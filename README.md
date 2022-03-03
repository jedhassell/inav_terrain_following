# inav_terrain_following
"sort of"
## Usage
* In Inav, perform `diff all` on the command line.  
* Copy the waypoints into a file (I used `terrain.txt`.  See example).  
* Run `ruby terrain_follow.rb terrain.txt`
* Results are in `terrain_results.txt`

## Notes
* For simplicity, home altitude will be set using coordinates from the first waypoint so you MUST START MISSION FROM LAUNCH SITE.
