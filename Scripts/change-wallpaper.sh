#!/bin/bash

# $HOME/Scripts/styli.sh -w 2560 -h 2560 -b bg-fill -s nature -n -m 3

declare -A months
months[1]="january"
months[2]="february"
months[3]="march"
months[4]="april"
months[5]="may"
months[6]="june"
months[7]="july"
months[8]="august"
months[9]="september"
months[10]="october"
months[11]="november"
months[12]="december"

current_month=$(date +%m)
month_string=${months[$current_month]}

$HOME/Scripts/styli.sh -w 2560 -h 2560 -b bg-fill -s ${month_string} -m 3 && exit 0

nitrogen --set-zoom-fill --random $HOME/Pictures/taustakuvat/7680x1400/ && exit 0
nitrogen --set-zoom-fill --random $HOME/Pictures/taustakuvat/ && exit 0

