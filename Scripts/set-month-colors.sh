#!/bin/bash

declare -A months
months[1]="#006afe"
months[2]="#5c6db5"
months[3]="#4494a4"
months[4]="#fce09c"
months[5]="#a8be3f"
months[6]="#6fbe53"
months[7]="#69822d"
months[8]="#a49f2e"
months[9]="#e8b83d"
months[10]="#e27e36"
months[11]="#87431c"
months[12]="#e40010"

current_month=$(date +%m)
month_string=${months[$current_month]}

echo $month_string > ~/.config/colors/main
