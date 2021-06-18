#!/bin/bash
if  ! pidof scrcpy ; then
  scrcpy -S -w || snap run scrcpy -S -w
else
  echo no
fi
