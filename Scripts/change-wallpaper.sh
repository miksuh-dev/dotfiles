#!/bin/bash

# $HOME/Scripts/styli.sh -w 2560 -h 2560 -b bg-fill -s nature -n -m 3

declare -A months
months[01]="january"
months[02]="february"
months[03]="march"
months[04]="april"
months[05]="may"
months[06]="june"
months[07]="july"
months[08]="august"
months[09]="september"
months[10]="october"
months[11]="november"
months[12]="december"

current_month=$(date +%m)
month_string=${months[$current_month]}

$HOME/Scripts/styli.sh -w 2560 -h 2560 -b bg-fill -s ${month_string} -m 3 && exit 0

nitrogen --set-zoom-fill --random $HOME/Pictures/taustakuvat/7680x1400/ && exit 0
nitrogen --set-zoom-fill --random $HOME/Pictures/taustakuvat/ && exit 0

