require "httparty"
require "byebug"

# tested on inav 3.0.1 (obviously, going to refactor for 4.1 once i can get to my fc)

class TerrainFollow
  LATITUDE = 3
  LONGITUDE = 4
  ALTITUDE = 5
  DESIRED_ALTITUDE = 12192 # 400ft

  def initialize(home_altitude = nil)
    @str = File.read(ARGV[0])
    @lines = @str.split("\n")
    @home_altitude = home_altitude
  end

  def call
    results = ""
    raw_altitudes = altitudes(coordinates)
    home_altitude = raw_altitudes.first

    raw_altitudes.each_with_index do |raw_altitude, i|
      line_arr = @lines[i].split
      line_arr[ALTITUDE] = (raw_altitude - home_altitude + DESIRED_ALTITUDE).to_i  # subtract home_altitude because gps always sets home to 0 altitude
      results << line_arr.join(" ") + "\n"
    end

    puts results
    File.write("terrain_results.txt", results)
  end

  private

  def altitudes(coordinates)
    response = HTTParty.post("https://api.opentopodata.org/v1/srtm30m",
                             headers: { "Accept" => "application/json", "Content-Type" => "application/json" },
                             body: payload(coordinates))

    fail response.body unless response.success?
    response["results"].map { |r| r["elevation"] * 100 } # *100 for conversion from m to cm
  end

  def payload(coordinates)
    locations = []
    coordinates.each do |lat, long|
      locations <<  "#{lat},#{long}"
    end

    data = {
      locations: locations.join('|'),
      interpolation: "nearest"
    }.to_json
  end

  def coordinates
    @lines.map do |line|
      line_arr = line.split
      [line_arr[LATITUDE].dup.insert(-8, ".").to_f, line_arr[LONGITUDE].dup.insert(-8, ".").to_f] # insert decimals because inav doesn't have them??!?
    end
  end
end

TerrainFollow.new.call
