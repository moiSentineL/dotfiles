#!/bin/bash

# Kill any existing Polybar instances
pkill -x polybar

# Wait for them to close
while pgrep -x polybar >/dev/null; do sleep 0.5; done

sleep 1

polybar second &

sleep 1

~/.config/bspwm/cleanfullscreen_second &
