#!/bin/bash

# get Xresources | find lines with colors | remove spaces and wildcards
colors=$(cat ~/.config/X11/xresources | egrep "color[0-9]+" | sed -e "s/[* ]\+//g" | sed -e "s/\!.*//g");

# Read hex color values and strore them in an array.
# Array looks like this:
# 0 => #000000
# [COLOR_NUMBER] => [HEX_COLOR_VALUE]
while read -r line
do
  colorNumber=$(echo $line | awk -F":" '{print $1}' | sed -e "s/color//g")
  colorValue=$(echo $line | awk -F":" '{print $2}')
  
  colorValues["$colorNumber"]="$colorValue"
done <<< "$colors"

printf "\n"

# Display colored values.
for index in ${!colorValues[*]}
do
  # Foreground color numbers are 30-37.
  colorNumber=$((30 + $index))

  # Background color numbers are 40-47, but we do not want to change the background.
  # In order to use the background color as a foreground color it is necessary to output \e[1m
  # before corresponding foregound color eg. "\e[1m \e[31m" - normal red will become background red.
  if (( $index > 7))
  then
    colorNumber=$(($colorNumber - 8)) # Still use foreground color codes.
    printf '\e[1m'                    # Use "Bold or incrased intensity" parameter to use corresponding
                                      # background color as a foreground color.
  fi

  # Display colored square and color value.
  printf '\e[%im █ %s' $colorNumber ${colorValues[$index]}

  # Include newline after printing all foregound colors.
  if (( $index == 7 ))
  then
    printf "\n"
  fi
done

# Reset parameters and output a few newlines
printf "\e[0m\n\n"
