#!/bin/bash

sleep 3
# Start up programs
$HOME/Scripts/startup.sh

# Computer specific custom startup
[ -f $HOME/Scripts/custom-autorun/autorun_$(hostname).sh ] && bash $HOME/Scripts/custom-autorun/autorun_$(hostname).sh

# Restart xbindkeys
pkill xbindkeys; xbindkeys

# Keyboard repeat speed
xset r rate 350 30

# Mouse speed
for id in $(xinput list | grep 'Logitech G Pro' | grep pointer | cut -d '=' -f 2 | cut -f 1);do xinput set-prop $id "Coordinate Transformation Matrix" 1, 0, 0, 0, 1, 0, 0, 0, 1;xinput set-prop $id 'libinput Accel Profile Enabled' 0, 1;done

# Set screens in correct order
$HOME/Scripts/set-screens.sh
$HOME/Scripts/styli.sh -w 2560 -h 2560 -b bg-fill -s nature -n -m 3
