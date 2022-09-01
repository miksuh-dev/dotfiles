#!/bin/bash

function checkIsWQHD() {
  read -ra screens -d '' <<<"$(xrandr | grep '*' | cut -d'*' -f1 | cut -d ' ' -f4)"
  for a in "${screens[@]}"; do
    if [ "$a" = "2560x1440" ]; then
      echo 1
      return 0;
    fi
  done

  echo 0
}

if [ $(checkIsWQHD) = 1 ]; then
  kitty --config $HOME/.config/kitty/kitty.conf --config $HOME/.config/kitty/kitty-wqhd.conf
else
  kitty --config $HOME/.config/kitty/kitty.conf --config $HOME/.config/kitty/kitty-hd.conf
fi


