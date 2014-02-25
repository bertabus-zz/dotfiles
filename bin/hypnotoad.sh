#!/bin/env zsh
the_fortune=`fortune`
clear
for i in {1..6}
do
  for eyes in {'-~','-\','~|','\|','\/','/~','~-'}
  do
    # clear
    cowsay -f ~/.config/bin/hypno.cow -e $eyes $the_fortune
    printf "\033[55A"
    sleep .05
  done
done
cowsay -f ~/.config/bin/hypno.cow -e $eyes $the_fortune
