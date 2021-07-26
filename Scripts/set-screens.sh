#!/usr/bin/bash

XRANDR_OUTPUT=$(xrandr)

HDMI0=$(echo $XRANDR_OUTPUT | grep -q "HDMI-0 connected" ; echo $?)
DP0=$(echo $XRANDR_OUTPUT | grep -q "DP-0 connected" ; echo $?)
DP4=$(echo $XRANDR_OUTPUT | grep -q "DP-4 connected" ; echo $?)
VGA0=$(echo $XRANDR_OUTPUT | grep -q "VGA-0 connected" ; echo $?)
LVDS0=$(echo $XRANDR_OUTPUT | grep -q "LVDS-0 connected" ; echo $?)
DP1=$(echo $XRANDR_OUTPUT | grep -q "DP-1 connected" ; echo $?)
DP11=$(echo $XRANDR_OUTPUT | grep -q "DP-1-1 connected" ; echo $?)
DP12=$(echo $XRANDR_OUTPUT | grep -q "DP-1-2 connected" ; echo $?)
HDMI1=$(echo $XRANDR_OUTPUT | grep -q "HDMI-1 connected" ; echo $?)
EDPI1=$(echo $XRANDR_OUTPUT | grep -q "DP-1-1 connected" ; echo $?)

if [[ $DP4 -eq 0 && $DP0 -eq 0 && $HDMI0 -eq 0 ]]; then
  # Home - Main PC
  if [ "$HOSTNAME" = "mikko-pc" ]; then
    xrandr --output DP-4 --mode 2560x1440 --pos 0x0 --rate 144 --rotate left
    xrandr --output DP-0 --mode 2560x1440  --pos 1440x560 --rate 144 --primary
    xrandr --output HDMI-0 --mode 2560x1440 --pos 4000x560 --rate 144
  fi
elif [[ $LVDS0 -eq 0 && $VGA0 -eq 0 && $HDMI0 -eq 0 ]]; then
   # Home - Gaming laptop
  if [ "$HOSTNAME" = "miksuh" ]; then
    xrandr --output LVDS-0 --mode 1920x1080 --rotate normal
    xrandr --output VGA-0 --mode 1440x900 --rotate normal --left-of LVDS-0
    xrandr --output HDMI-0 --mode 1360x768 --rotate normal --right-of LVDS-0
  fi
elif [[ $HDMI1 -eq 0 && $DP11 -eq 0 && $DP12 -eq 0 && $EDP1 -eq 0 ]]; then
  # Home screens - Work PC
  if [ "$HOSTNAME" = "debian" ]; then
    xrandr --output eDP-1 --off
    xrandr --output HDMI-1 --mode 2560x1440 --pos 0x0 --rate 60 --rotate left
    xrandr --output DP-1-1 --mode 2560x1440  --pos 1440x560 --rate 60 --primary
    xrandr --output DP-1-2 --mode 2560x1440 --pos 4000x560 --rate 60
  fi
elif [[ $EDPI1 -eq 0 && $HDMI1 -eq 0 && $DP11 -eq 0 ]]; then
  # Work screens - Work PC
  if [ "$HOSTNAME" = "debian" ]; then
    xrandr --output eDP-1 --mode 1920x1080 --primary
    xrandr --output HDMI-1 --mode 1920x1080 --right-of eDP-1
    xrandr --output DP-1-1 --mode 1920x1080 --right-of HDMI-1
  fi
elif [[ $EDPI1 -eq 0 ]]; then
  # Single screen - Work PC
  if [ "$HOSTNAME" = "debian" ]; then
    xrandr --output eDP-1 --mode 1920x1080 --pos 0x0 --rate 60
  fi
fi

