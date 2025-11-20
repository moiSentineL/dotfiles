#!/usr/bin/env bash

# This script assumes Zen Browser is a Firefox fork
# and listens for commands via xdotool

# Get the active window's WM_CLASS
active_class=$(xprop -id "$(xdotool getactivewindow)" WM_CLASS)

# Check if it's Zen Browser
if [[ "$active_class" == *"zen"* ]]; then
    # Send Ctrl+L (focus address bar)

    xdotool key --clearmodifiers "ctrl+l"
    xdotool type --clearmodifiers "% "
    xdotool keyup space

    sleep 0.01

    xdotool keyup "alt" # because I have binded this script to alt + @space in sxhkd
fi

