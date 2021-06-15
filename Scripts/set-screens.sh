#!/usr/bin/bash

HDMI0=$(xrandr | grep -q "HDMI-0 connected" ; echo $?)
DP0=$(xrandr | grep -q "DP-0 connected" ; echo $?)
DP4=$(xrandr | grep -q "DP-4 connected" ; echo $?)
VGA0=$(xrandr | grep -q "VGA-0 connected" ; echo $?)
LVDS0=$(xrandr | grep -q "LVDS-0 connected" ; echo $?)

if [[ $DP4 -eq 0 && $DP0 -eq 0 && $HDMI0 -eq 0 ]]; then
  # Home PC
  if [ "$HOSTNAME" = "mikko-pc" ]; then
    xrandr --output DP-4 --mode 2560x1440 --pos 0x0 --rate 144 --rotate left
    xrandr --output DP-0 --mode 2560x1440  --pos 1440x560 --rate 144 --primary
    xrandr --output HDMI-0 --mode 2560x1440 --pos 4000x560 --rate 144
  fi
elif [[ $LVDS0 -eq 0 && $VGA0 -eq 0 && $HDMI0 -eq 0 ]]; then
   # Home gaming laptop
  if [ "$HOSTNAME" = "miksuh" ]; then
    xrandr --output LVDS-0 --mode 1920x1080 --rotate normal
    xrandr --output VGA-0 --mode 1440x900 --rotate normal --left-of LVDS-0
    xrandr --output HDMI-0 --mode 1360x768 --rotate normal --right-of LVDS-0
  fi
fi

