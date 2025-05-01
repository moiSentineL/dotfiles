#!/bin/zsh

PLAYERS="spotify,cmus"
COMMAND="playerctl --player=$PLAYERS status"

write() {
    if [[ $(playerctl --player=$PLAYERS status) = "Playing" ]]; then
        echo "$(playerctl metadata --format "{{ artist }} - {{ title }}")"
    elif [[ $(playerctl --player=$PLAYERS status) = "Paused" ]]; then
        echo "  $(playerctl metadata --format "{{ artist }} - {{ title }}")"
    fi
}

if [[ $(playerctl -l 2>&1) != *"No players found"* ]]; then
    write
else
    echo ""
fi
