#!/bin/bash

vol=$(amixer get Master | awk -F'[]%[]' '/%/ {if ($7 == "off") { print "MM" } else { print $2/10 }}' | head -n 1)

# echo -e "Vol: \e[32m$vol\e[0m"
# echo -e "Vol: $vol"
echo "Vol: <fc=#709080>$vol</fc>"

exit 0
