#!/bin/bash
echo started
a=1
function handle {
     if [[ ${1:0:9} == "workspace" ]]; then
    /home/paul/eww/target/release/eww open snow-fall2
    sleep 0.3
    /home/paul/eww/target/release/eww open snow-fall1
    sleep 0.4
    /home/paul/eww/target/release/eww close snow-fall2
    sleep 0.3
    /home/paul/eww/target/release/eww close snow-fall1
  fi

}

socat - UNIX-CONNECT:/tmp/hypr/$(echo $HYPRLAND_INSTANCE_SIGNATURE)/.socket2.sock | while read line; do handle $line; done
