#!/bin/bash

xmodmap -e "keycode 49 = Scroll_Lock"
pkill xbindkeys; xbindkeys
xset r rate 350 30

[ -f $HOME/.custom-autorun/autorun_$(hostname).sh ] && sleep 3 && bash $HOME/.custom-autorun/autorun_$(hostname).sh

for id in $(xinput list | grep 'Logitech G Pro' | grep pointer | cut -d '=' -f 2 | cut -f 1);do xinput set-prop $id "Coordinate Transformation Matrix" 1, 0, 0, 0, 1, 0, 0, 0, 1;xinput set-prop $id 'libinput Accel Profile Enabled' 0, 1;done
