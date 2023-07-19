#!/bin/bash

nvidia-settings --load-config-only &

$HOME/Programs/FreeFileSync/fileserver_sync.sh &

pidof rambox >/dev/null || /usr/bin/rambox &
pidof mumble >/dev/null || /usr/bin/mumble-lts &
pgrep -f "python /usr/bin/twitch-indicator" >/dev/null || /usr/bin/twitch-indicator &
