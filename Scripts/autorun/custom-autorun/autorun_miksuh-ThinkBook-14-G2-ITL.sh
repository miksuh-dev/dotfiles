#!/bin/bash

pidof teams >/dev/null || /usr/bin/teams &
pidof thunderbird >/dev/null || /usr/bin/thunderbird &
