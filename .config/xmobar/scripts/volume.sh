#!/bin/bash
echo "Vol: $(pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '\d+(?=%)%' | head -n 1)"
