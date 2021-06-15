#!/bin/bash

# Policy kit
if [ -x /usr/lib/polkit-kde-authentication-agent-1 ]; then
  pidof polkit-kde-authentication-agent-1 >/dev/null || /usr/lib/polkit-kde-authentication-agent-1 &
else
  pidof lxpolkit >/dev/null || lxpolkit &
fi

# Compositor
if command -v picom &> /dev/null; then
  pidof picom >/dev/null || picom --config $HOME/.config/picom/picom.conf &
else
  pidof compton >/dev/null || compton &
fi

# Notifications
pidof dunst >/dev/null || dunst -config $HOME/.config/dunst/dunstrc &

# Tray
pidof trayer >/dev/null || trayer --edge top --align right --padding 10 --SetDockType true --SetPartialStrut true --expand true --monitor primary --transparent true --alpha 0 --tint 0x111111  --height 18 --widthtype request &

# Network manager
if command -v nm-applet &> /dev/null; then
  pidof nm-applet >/dev/null || nm-applet &
else
  pidof wicd-client >/dev/null || wicd-client &
fi

# Clipboard
pidof xfce4-clipman >/dev/null || xfce4-clipman &

# Screenshot tool
pidof flameshot >/dev/null || flameshot &

# Screensaver
pidof xscreensaver >/dev/null || xscreensaver -no-splash &
