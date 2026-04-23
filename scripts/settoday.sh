#!/usr/bin/env bash

FILE="$HOME/today.txt"

input=$(printf "" | dmenu -p "now:" -fn "Pragmasevka Nerd Font-18" -sb "#91171f")

# if user cancels, do nothing
[ -z "$input" ] && exit 0

echo "$input" > "$FILE"

polybar-msg action "#today.hook.0"
