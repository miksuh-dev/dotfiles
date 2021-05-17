#!/bin/bash

if [ -x "$(command -v playerctl)" ]; then
    playerstatus=$(playerctl status)

    if [[ $playerstatus == "Playing" ]]
    then
        artist=$(playerctl metadata artist)
        title=$(playerctl metadata title)

        if [[ $artist == "" ]]
        then
            echo -n "$title |"
        else
            echo -n "$artist - $title |"
        fi
    fi
fi
