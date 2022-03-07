# Inav Terrain Following
A simple POC to implement terrain following in Inav.
## Usage
* In Inav, perform `wp` on the command line.  
* Copy the waypoints into a file (I used `terrain.txt`.  See example).  
* Run `ruby terrain_follow.rb terrain.txt`
* Results are in `terrain_results.txt`
* copy and paste in CLI
* save waypoints `wp save`

## Notes
* For simplicity, home altitude will be set using coordinates from the first waypoint so you MUST START MISSION FROM LAUNCH SITE.
* Data retrieved from [Open Topo Data](https://www.opentopodata.org)

## Example
Inav wp mission retrieved via `wp`
```
wp 0 1 380133408 -1226582149 5000 0 0 0 0
wp 1 1 380098982 -1226560430 5000 0 0 0 0
wp 2 1 380043892 -1226554380 5000 0 0 0 0
wp 3 1 380000622 -1226561707 5000 0 0 0 0
wp 4 1 379979914 -1226572655 5000 0 0 0 0
wp 5 1 379987291 -1226637503 5000 0 0 0 0
wp 6 1 379980122 -1226676862 5000 0 0 0 0
wp 7 1 380004196 -1226686602 5000 0 0 0 0
wp 8 1 380029302 -1226698480 5000 0 0 0 0
wp 9 1 380075346 -1226680612 5000 0 0 0 0
wp 10 1 380105964 -1226645085 5000 0 0 0 0
wp 11 1 380134808 -1226598968 5000 0 0 0 0
wp 12 1 380133092 -1226571167 5000 0 0 0 165
```
is converted to
```
wp 0 1 380133408 -1226582149 12192 0 0 0 0
wp 1 1 380098982 -1226560430 19092 0 0 0 0
wp 2 1 380043892 -1226554380 32392 0 0 0 0
wp 3 1 380000622 -1226561707 41992 0 0 0 0
wp 4 1 379979914 -1226572655 43392 0 0 0 0
wp 5 1 379987291 -1226637503 39192 0 0 0 0
wp 6 1 379980122 -1226676862 35292 0 0 0 0
wp 7 1 380004196 -1226686602 37392 0 0 0 0
wp 8 1 380029302 -1226698480 29592 0 0 0 0
wp 9 1 380075346 -1226680612 22392 0 0 0 0
wp 10 1 380105964 -1226645085 18292 0 0 0 0
wp 11 1 380134808 -1226598968 11992 0 0 0 0
wp 12 1 380133092 -1226571167 11892 0 0 0 165
```
