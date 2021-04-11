#!/bin/bash

nvidia-settings --load-config-only

$HOME/Programs/FreeFileSync/fileserver_sync.sh &

xrandr --output LVDS-0 --mode 1920x1080 --rotate normal
xrandr --output VGA-0 --mode 1440x900 --rotate normal --left-of LVDS-0
xrandr --output HDMI-0 --mode 1360x768 --rotate normal --right-of LVDS-0

nitrogen --set-zoom-fill /home/miksuh/Pictures/taustakuvat/5120x1440/armenia_khustup_k13_annihilation_hayk-wallpaper-5120x1440.jpg
