#!/bin/bash
echo "Vol: $(pactl list sinks | tr ' ' '\n' | grep -m1 '%')"
