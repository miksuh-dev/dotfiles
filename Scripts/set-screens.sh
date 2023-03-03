#!/usr/bin/bash

XRANDR_OUTPUT=$(xrandr)
MACHINE_ID=$($HOME/Scripts/get-machine-id.sh)

HDMI0=$(echo $XRANDR_OUTPUT | grep -q "HDMI-0 connected" ; echo $?)
DP0=$(echo $XRANDR_OUTPUT | grep -q "DP-0 connected" ; echo $?)
DP4=$(echo $XRANDR_OUTPUT | grep -q "DP-4 connected" ; echo $?)
VGA0=$(echo $XRANDR_OUTPUT | grep -q "VGA-0 connected" ; echo $?)
LVDS0=$(echo $XRANDR_OUTPUT | grep -q "LVDS-0 connected" ; echo $?)
DP21=$(echo $XRANDR_OUTPUT | grep -q "DP-2-1 connected" ; echo $?)
DP22=$(echo $XRANDR_OUTPUT | grep -q "DP-2-2 connected" ; echo $?)
DP3=$(echo $XRANDR_OUTPUT | grep -q "DP-3 connected" ; echo $?)
HDMI1=$(echo $XRANDR_OUTPUT | grep -q "HDMI-1 connected" ; echo $?)
EDPI1=$(echo $XRANDR_OUTPUT | grep -q "eDP-1 connected" ; echo $?)

if [[ $DP4 -eq 0 && $DP0 -eq 0 && $HDMI0 -eq 0 ]]; then
  # Home - Main PC
  if [ "$MACHINE_ID" = "a141f10085" ]; then
    xrandr --output DP-4 --mode 2560x1440 --pos 0x0 --rate 144 --rotate left
    xrandr --output DP-0 --mode 2560x1440  --pos 1440x560 --rate 144 --primary
    xrandr --output HDMI-0 --mode 2560x1440 --pos 4000x560 --rate 144
  fi
elif [[ $HDMI1 -eq 0 && $DP21 -eq 0 && $DP22 -eq 0 && $EDP1 -eq 0 ]]; then
  # Home screens - Work PC
  if [ "$MACHINE_ID" = "4cc9745ad9" ]; then
    xrandr --output eDP-1 --off
    xrandr --output HDMI-1 --mode 2560x1440 --rate 60 --rotate left
    xrandr --output DP-2-1 --mode 2560x1440 --rate 60 --right-of HDMI-1 --primary
    xrandr --output DP-2-2 --mode 2560x1440 --rate 60 --right-of DP-2-1
  fi
elif [[ $EDPI1 -eq 0 && $DP3 -eq 0 ]]; then
  # Work screens - Work PC
  if [ "$MACHINE_ID" = "4cc9745ad9" ]; then
    xrandr --output eDP-1 --mode 1920x1080
    xrandr --output DP-3 --mode 3440x1440 --primary --right-of eDP-1
  fi
elif [[ $EDPI1 -eq 0 ]]; then
  # Single screen - Work PC
  if [ "$MACHINE_ID" = "4cc9745ad9" ]; then
    xrandr --output eDP-1 --mode 1920x1080 --pos 0x0 --rate 60
  fi
fi

