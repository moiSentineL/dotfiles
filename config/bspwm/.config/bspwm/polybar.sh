#!/bin/bash

# Kill any existing Polybar instances
pkill -x polybar
pkill -x cleanfullscreen

# Wait for them to close
sleep 1

polybar second &

sleep 1

~/.config/bspwm/cleanfullscreen_second &
