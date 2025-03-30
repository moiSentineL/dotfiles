#!/bin/bash

# Kill any existing Polybar instances
pkill -x polybar

# Wait for them to close
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch first bar on Monitor 1
MONITOR=eDP-1 polybar main &

# Launch second bar on Monitor 2
MONITOR=HDMI-1 polybar second &

#if type "xrandr"; then
# for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
#    MONITOR=$m polybar --reload example &
#  done
#else
#  polybar --reload example &
#fi
