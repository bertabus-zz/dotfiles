Useful udev rules for setting permissions on devices, place rules in /etc/udev/rules.d/

91-97 are useful, I'm not sure that 98 is even needed anymore, everything tested so far
has worked just fine without needing sudo permissions or 98.
These should give permissions for most of the embedded toys that I use regularly
including Salae logic devices, altera devices, multiple AVR programmers,
and other miscellaneous usb tty serial devices.

For serial devices cutecom seems to get the job done well enough. A full up terminal it is not but has lots of config settings for everything short of a full up linux tty. That is probably still best done using screen or other approaches. Serial devices typical are found
at /dev/ttyUSB0 or /dev/ttyUSB1 etc for each device plugged in.

The backlight rules were useful when operating with xmonad but not necessary
now that I have moved to xfce. They are in my git history.
