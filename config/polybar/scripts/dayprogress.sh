#!/bin/bash

width=30
# 8:30 PM is 20:30. Total seconds: (20 * 3600) + (30 * 60) = 73800
end_point=73800

h=$(date +%H); h=$((100$h % 100))
m=$(date +%M); m=$((100$m % 100))
s=$(date +%S); s=$((100$s % 100))

current_seconds=$(( h * 3600 + m * 60 + s ))

# Calculate percent, capped at 100
if [ $current_seconds -ge $end_point ]; then
    percent=100
else
    percent=$(( current_seconds * 100 / end_point ))
fi

# Color logic: Red at 18:00 (6pm), Yellow at 15:00 (3pm)
if [ $h -ge 17 ]; then
    color="#FF5555"
elif [ $h -ge 14 ]; then
    color="#F1FA8C"
else
    color="#50FA7B"
fi

filled=$(( percent * width / 100 ))
empty=$(( width - filled ))

full_bar="▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓"
empty_bar="░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░"

echo "%{F$color}${full_bar:0:filled}%{F-}${empty_bar:0:empty}"
