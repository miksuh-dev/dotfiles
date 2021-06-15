#!/bin/bash

nvidia-settings --load-config-only &

$HOME/Programs/FreeFileSync/fileserver_sync.sh &
