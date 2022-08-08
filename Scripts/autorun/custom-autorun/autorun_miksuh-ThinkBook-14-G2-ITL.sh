#!/bin/bash

ps --no-headers -C mattermost-desktop -o args,state > /dev/null || /usr/bin/mattermost-desktop &
pidof teams >/dev/null || /usr/bin/teams &
pidof thunderbird >/dev/null || /usr/bin/thunderbird &
