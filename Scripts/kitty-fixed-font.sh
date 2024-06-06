#!/bin/bash

function checkIsWQHD() {
  read -ra screens -d '' <<<"$(xrandr | grep '*' | cut -d'*' -f1 | cut -d ' ' -f4)"

  for a in "${screens[@]}"; do
    if [[ "$a" = "3440x1440" ]]; then
      echo 1
      return 0;
    fi

    if [[ "$a" = "2560x1440" ]]; then
      echo 2
      return 0;
    fi

    if [[ "$a" = "3840x2160" ]]; then
      echo 3
      return 0;
    fi
  done
}

case $(checkIsWQHD) in
  # Ultra wide wqhd
  1)
    kitty --config $HOME/.config/kitty/kitty.conf --config $HOME/.config/kitty/kitty-wideqhd.conf
    ;;

  # wqhd
  2)
    kitty --config $HOME/.config/kitty/kitty.conf --config $HOME/.config/kitty/kitty-wqhd.conf
    ;;

  # 4k
  3)
    kitty --config $HOME/.config/kitty/kitty.conf --config $HOME/.config/kitty/kitty-4k.conf
    ;;

  # default
  *)
    kitty --config $HOME/.config/kitty/kitty.conf --config $HOME/.config/kitty/kitty-hd.conf
    ;;
esac
