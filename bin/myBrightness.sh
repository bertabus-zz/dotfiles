#/!bin/bash

declare -i brightness=`cat /sys/class/backlight/nvidia_backlight/brightness`

if [ "$1" == + ]; then
    declare -i test=$brightness+10
    `echo $test > /sys/class/backlight/nvidia_backlight/brightness`

elif [ "$1" == "-" ]; then
    declare -i test=$brightness-10
    `echo $test > /sys/class/backlight/nvidia_backlight/brightness`
else
    exit 0;
fi
