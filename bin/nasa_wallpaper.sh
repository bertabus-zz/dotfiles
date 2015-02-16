#!/bin/bash
 
# grabs the nasa image of the day by RSS feed and updates the gnome
# background. add this to your cron jobs to have this happen daily.  this is,
# obviously, a hack, that is likely to break at the slightest change of NASA's
# RSS implementation. yay standards!

#EDITED FOR feh

# echo "start"
rss=`wget -q -O - http://www.nasa.gov/rss/lg_image_of_the_day.rss`
# echo $rss

# echo "start"
img_url=`echo $rss | grep -o '<enclosure [^>]*>' | grep -o -m 1 'http://[^\"]*'`
# echo $img_url

img_name=`echo $img_url | grep -o [^/]*\.\w*$`
# echo $img_name 

# this command is benign if the directory already exists.
mkdir -p ~/Pictures/wallpapers/nasa/
 
# this command will overwrite the image if it already exists
wget -q -O ~/Pictures/wallpapers/nasa/$img_name $img_url
 
feh --bg-scale ~/Pictures/wallpapers/nasa/$img_name
