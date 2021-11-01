#!/bin/bash

pidof mattermost-desktop >/dev/null || /usr/bin/mattermost-desktop &
pidof teams >/dev/null || /usr/bin/teams &
pidof thunderbird >/dev/null || /usr/bin/thunderbird &
