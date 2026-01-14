#!/bin/bash

# selecting default pipewire sink (preselected) using dmenu via pactl

# TODO: find sink.name from pactl
sinklist=("bluez.dopes" "bluez.pebble" "internal" "interface")

# echo the list

for f in ${sinklist}; do
    echo ${f} | dmenu # | xargs pactl set-default-sink
done
