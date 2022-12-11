#!/bin/bash
echo started
    /home/paul/eww/target/release/eww open snow-fall2
    sleep 0.2
    /home/paul/eww/target/release/eww open snow-fall1
    sleep 0.7
    /home/paul/eww/target/release/eww close snow-fall1
    sleep 0.1
    /home/paul/eww/target/release/eww close snow-fall2
exit
