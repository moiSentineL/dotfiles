#!/bin/bash

width=30

# Define boundaries in seconds from midnight
start_point=$(( 7 * 3600 ))        # 07:00 AM = 25,200 seconds
end_point=$((21 * 3600)) # 08:30 PM = 73,800 seconds
total_window=$(( end_point - start_point ))

# Get current time components and strip leading zeros safely
h=$(date +%H); h=$((100$h % 100))
m=$(date +%M); m=$((100$m % 100))
s=$(date +%S); s=$((100$s % 100))

current_seconds=$(( h * 3600 + m * 60 + s ))

# Calculate percentage based strictly on your active window
if [ $current_seconds -le $start_point ]; then
    percent=0
elif [ $current_seconds -ge $end_point ]; then
    percent=100
else
    active_seconds=$(( current_seconds - start_point ))
    percent=$(( active_seconds * 100 / total_window ))
fi

# Color logic based on actual time of day
if [ $h -ge 18 ]; then
    color="#FF5555" # Red after 6:00 PM (The final sprint)
elif [ $h -ge 14 ]; then
    color="#F1FA8C" # Yellow after 2:00 PM (Mid-day warning)
else
    color="#50FA7B" # Green (Fresh start)
fi

# Bar rendering via string slicing
filled=$(( percent * width / 100 ))
empty=$(( width - filled ))

full_bar="▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓"
empty_bar="░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░"

echo "%{F$color}${full_bar:0:filled}%{F-}${empty_bar:0:empty}"
