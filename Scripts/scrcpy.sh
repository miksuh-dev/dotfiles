#!/bin/bash
if  ! pidof scrcpy ; then
  if [ -x "$(command -v scrcpy)" ]; then
    scrcpy -S -w
  else
    snap run scrcpy -S -w
  fi
fi
