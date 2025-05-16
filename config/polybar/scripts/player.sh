#!/bin/bash

PLAYERS="spotify,cmus,ncspot"
COMMAND="playerctl --player=$PLAYERS status"

write() {
    if [[ $(playerctl --player=$PLAYERS status) = "Playing" ]]; then
        echo "$(playerctl --player=$PLAYERS metadata --format "{{ artist }} - {{ title }}")"
    elif [[ $(playerctl --player=$PLAYERS status) = "Paused" ]]; then
        echo "  $(playerctl --player=$PLAYERS metadata --format "{{ artist }} - {{ title }}")"
    fi
}

if [[ $(playerctl --player=$PLAYERS status 2>&1) != *"No players found"* ]]; then
    write
else
    echo ""
fi
