#!/bin/bash

# ---- config ----
TAGS=(
  "~math"
  "~physics"
  "~chem"
  "~JEE"
  "writing"
  "youtube"
  "hobby"
)
# ----------------

choice=$(printf "%s\n" "${TAGS[@]}" | dmenu -i -b -fn "Pragmasevka Nerd Font-11" -sb "#91171f")

# If user pressed Esc or empty input
[ -z "$choice" ] && exit 0

# Allow multiple tags separated by spaces
timew start $choice
