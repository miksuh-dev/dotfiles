#!/bin/bash

xmodmap -e "keycode 49 = Scroll_Lock"
xbindkeys &
xset r rate 350 30
dunst -config $HOME/.config/dunst/dunstrc &

[ -f $HOME/custom_autorun.sh ] && bash $HOME/custom_autorun.sh

nitrogen --head=0 --set-zoom-fill $HOME/Pictures/taustakuvat/aika.jpg
nitrogen --head=1 --set-zoom-fill $HOME/Pictures/taustakuvat/aika.jpg
nitrogen --head=2 --set-zoom-fill $HOME/Pictures/taustakuvat/aika.jpg
