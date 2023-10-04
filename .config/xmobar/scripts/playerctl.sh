#!/bin/bash

if [ -x "$(command -v playerctl)" ]; then
    metadata=$(playerctl -p spotify metadata --format "{{ status }};{{ artist }};{{ title }}")

    IFS=';'
    read -a array <<< "$metadata"

    if [[ ${array[0]} == "Playing" ]]; then
        artist=${array[1]}
        title=${array[2]}

        if [[ $artist == "" ]]; then
            text="$title"
        else
            text="$artist - $title"
        fi

        if [[ ${#text} -gt 45 ]] ; then
            output="$(echo $text | cut -c1-43)..."
        else
            output=$text
        fi

        echo " ${output} |"

    fi
fi
