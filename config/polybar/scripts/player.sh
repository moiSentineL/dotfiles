#!/bin/bash

ARTIST="$(playerctl metadata xesam:artist)"
TITLE="$(playerctl metadata xesam:title)"


if [[ $(playerctl status) = "Playing" ]]; then
    echo "$ARTIST - $TITLE"
elif [[ $(playerctl status) = "Paused" ]]; then
    echo "  $ARTIST - $TITLE"
fi

