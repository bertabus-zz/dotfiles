#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

xrdb -merge ~/.config/X11/.Xresources

# exec gnome-session
# exec startkde
# exec startxfce4
# exec enlightenment_start 
exec awesome
# ...or the Window Manager of your choice
