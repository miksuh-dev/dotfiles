#!/bin/bash

if [ -x "$(command -v playerctl)" ]; then
    playerstatus=$(playerctl status)

    if [[ $playerstatus == "Playing" ]]
    then
        artist=$(playerctl metadata artist)
        title=$(playerctl metadata title)

        if [[ $artist == "" ]]
        then
            text="$title"
        else
            text="$artist - $title"
        fi


        if [[ ${#text} -gt 48 ]] ; then
            echo $text | cut -c1-45 | xargs -I{} -0 echo -n "Playing: {}... |"
        else
            echo $text | xargs -I{} echo -n "Playing: {} |"
        fi

    fi
fi
