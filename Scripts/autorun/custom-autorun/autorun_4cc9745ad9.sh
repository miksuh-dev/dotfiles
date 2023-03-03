#!/bin/bash

pidof teams >/dev/null || /usr/bin/teams &
pidof slack >/dev/null || /usr/bin/slack &
pidof chrome >/dev/null || /usr/local/bin/outlook &
