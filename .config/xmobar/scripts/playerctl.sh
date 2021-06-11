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


        output="Playing: "
        if [[ ${#text} -gt 48 ]] ; then
            output+="$(echo $text | cut -c1-45)..."
        else
            output+=$text
        fi

        echo "${output} |"
    fi
fi
