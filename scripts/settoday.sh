#!/usr/bin/env bash

FILE="$HOME/today.txt"

#input=$(fuzzel --dmenu --prompt-only "now: " <&-) || exit 0
input=$(dmenu -p "now: " <&-) || exit 0

# if user cancels, do nothing
echo "$input" > "$FILE"

# polybar-msg action "#today.hook.0"
pkill -SIGRTMIN+1 i3status-rs
