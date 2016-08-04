#!/bin/env sh

seconds=$1; date1=$((`date +%s` + $seconds)); 
while [ "$date1" -ne `date +%s` ]; do 
  echo -ne "$(date -u --date @$(($date1 - `date +%s` )) +%H:%M:%S)\r"; 
done
echo -en "\007"
echo ALL DONE!!!!!!
