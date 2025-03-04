#!/bin/bash

# Temporary files for session count and planned total
TEMP_FILE="/tmp/pomodoro_sessions.txt"
TOTAL_FILE="/tmp/pomodoro_total.txt"
CURRENT_FILE="/tmp/pomodoro_current.txt"

# Function to initialize the session and total count
initialize() {
    echo "0" > "$TEMP_FILE"                 # Reset session count
    echo "3" > "$TOTAL_FILE"                # Default planned sessions
    echo "Pomodoro sessions reset to 0 with a planned total of 3."
}

stuff() {
# Fetch the planned total sessions
total_sessions=$(cat "$TOTAL_FILE")

# Increment the session count
current_sessions=$(cat "$TEMP_FILE")
new_sessions=$((current_sessions + 1))
echo "$new_sessions" > "$TEMP_FILE"
echo "$new_sessions/$total_sessions" > "$CURRENT_FILE"
}

# Check for manual reset command
if [ "$1" = "reset" ]; then
    initialize
    exit 0
fi

# Check for setting a new total
if [ "$1" = "set" ]; then
    if [[ "$2" =~ ^[0-9]+$ ]]; then
        echo "$2" > "$TOTAL_FILE"
        echo "Planned total Pomodoro sessions set to $2."
        stuff
    else
        echo "Invalid total. Please provide a valid number."
    fi
    exit 0
fi

# Check if the temp file exists
if [ ! -f "$TEMP_FILE" ]; then
    initialize
fi

stuff 
# Output the current session count and total
echo "Pomodoro session: $new_sessions/$total_sessions"
