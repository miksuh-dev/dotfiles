#!/bin/bash

sleep 3
# Start up programs
$HOME/Scripts/autorun/start-programs.sh

# Increase key speed
xset r rate 350 30

# Disable debounce expire
xkbset exp "=bo"

xkbset bo 1

setxkbmap -option caps:escape

MACHINE_ID=$($HOME/Scripts/get-machine-id.sh)
CUSTOM_AUTORUN=$HOME/Scripts/autorun/custom-autorun/autorun_$MACHINE_ID.sh

# Computer specific custom startup
if [ -f $CUSTOM_AUTORUN ]; then
  bash $CUSTOM_AUTORUN
else
  echo "No custom autorun for $MACHINE_ID"
fi

# Restart xbindkeys
pkill xbindkeys; xbindkeys
xmodmap ~/.Xmodmap

# Mouse speed
for id in $(xinput list | grep 'Logitech' | grep pointer | cut -d '=' -f 2 | cut -f 1);do xinput set-prop $id "Coordinate Transformation Matrix" 1, 0, 0, 0, 1, 0, 0, 0, 1;xinput set-prop $id 'libinput Accel Profile Enabled' 0, 1;done

# Set screens to correct order
$HOME/Scripts/set-screens.sh
$HOME/Scripts/change-wallpaper.sh
