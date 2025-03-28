#!/bin/bash

# Array of random messages
messages=(
    "Are you being productive?"
    "What are you working on?"
    "Stay focused and keep working!"
    "How's your progress?"
    "Are you working on what you planned for?"
)

while true; do
    # Select a random message from the array
    random_message=${messages[$RANDOM % ${#messages[@]}]}

    # Send notification with the random message
    notify-send "Hourly Check-in" "$random_message" -u critical

    # Play notification sound
    paplay ~/.local/notif.mp3

    # Wait for 1 hour (3600 seconds)
    sleep 3600
done
