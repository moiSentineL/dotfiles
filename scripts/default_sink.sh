#!/bin/bash

# selecting default pipewire sink (preselected) using dmenu via pactl

# TODO: find sink.name from pactl
sinklist=("bluez.dopes" "bluez.pebble" "internal" "interface")

# echo the list

choice=$(printf "%s\n" "${sinklist[@]}" | dmenu -i -b -fn "Pragmasevka Nerd Font-11" -sb "#91171f")

# If user pressed Esc or empty input
[ -z "$choice" ] && exit 0

echo $choice

# Conditional check
