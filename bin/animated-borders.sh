
function handle {
  if [[ ${1:0:12} == "activewindow" ]]; then
sleep 0.1
raw=$(hyprctl activewindow | grep -m2 size: | tail -n1)
size2=$(echo "$raw" | cut -c 7-)
export colors="rgba(111111FF) rgba(FFFFFFFF) rgba(111111FF)"

sizex=$(echo "$size2" | cut -d',' -f 1)
sizey=$(echo "$size2" | cut -d',' -f 2)


	awk -v sizex="$sizex" -v sizey="$sizey"  'BEGIN {
		Pi= 3.1415926535
		sizex2 = sizex/2
		sizey2=sizey/2
		for (i = -sizey2; i <= sizey2; ++i) {
			result1 = atan2(i,sizex2)*180/Pi
			i = i+20
			if (result1 < 0){
				result = 360 + result1
			}
			else {
				result = result1
			}
			# print int(result)
			#t =t+1
			system("hyprctl keyword general:col.active_border $colors $(("int (result)"))deg")
			system("sleep 0.01")   
		}
		for (i2 = -sizex2; i2 <= sizex2; ++i2) {
			result2 = atan2(i2,sizey2)*180/Pi
			i2 = i2+20
			result = 90 + result2
			#print "x1: " int(result)
			#t =t+1
			#print t
			system("hyprctl keyword general:col.active_border $colors $(("int (result)"))deg")
			system("sleep 0.01")
		}
		for (i3 = -sizey2; i3 <= sizey2; ++i3) {
			result3 = atan2(i3,sizex2)*180/Pi
			i3 = i3+20
			result = 180 + result3
			#print "y2: " int(result)
			#t =t+1
			#print t
			system("hyprctl keyword general:col.active_border $colors $(("int (result)"))deg")
			system("sleep 0.01")
		}
		for (i4 = -sizex2; i4 <= sizex2; ++i4) {
			result4 = atan2(i4,sizey2)*180/Pi
			i4 = i4+20
			result = 270 + result4
			#print "x2: " int(result)
			#t =t+1
			#print t
			system("hyprctl keyword general:col.active_border $colors $(("int (result)"))deg")
			system("sleep 0.01")
		}	
}'


#!/bin/sh


  fi
}

socat - UNIX-CONNECT:/tmp/hypr/$(echo $HYPRLAND_INSTANCE_SIGNATURE)/.socket2.sock | while read line; do handle $line; done
