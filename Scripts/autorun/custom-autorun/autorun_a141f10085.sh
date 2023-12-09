#!/bin/bash

nvidia-settings --load-config-only &

$HOME/Programs/FreeFileSync/fileserver_sync.sh &

pidof rambox >/dev/null || /usr/bin/rambox &
pidof mumble >/dev/null || /usr/bin/mumble-lts &
pacmd list-sources | grep -e 'name: <obs.monitor>' || ~/Scripts/set-virtual-obs.sh
