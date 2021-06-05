#!/bin/sh

# $0 script appname summary body icon urgency
# $1 appname
# $2 summary
# $3 body
# $4 icon
# $5 urgency

INITIAL_COLOR=blue
FLASH_DELAY=0.3

function getColor() {
  word=$1
  declare -A apps=(    
    [whatsapp]=00FF00  
    [pushbullet]=red
  )

  for app in "${!apps[@]}"
  do
     
    color=${apps[$app]}

    if [[ $app == *"${word}"* ]]; then
      echo $color
    fi

  done
}

declare -A apps=(
  [whatsapp]=green
  [pushbullet]=green
)

if [ $2 ]; then
  notif_color=$(getColor $2)

  if [ $notif_color ]; then
    hue lights 1 $notif_color
    sleep $FLASH_DELAY
    hue lights 1 $INITIAL_COLOR
  fi
fi

