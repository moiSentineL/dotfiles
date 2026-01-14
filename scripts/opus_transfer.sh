#!/bin/bash
# The Transporter

# Configuration
SERVER_USER="nibir"        # Your server login
SERVER_IP="192.168.10.5"            # Your server's local IP address
REMOTE_PATH="/mnt/Files/Media/Music/opus/"  # The Shadow Folder we created
LOCAL_PATH="$HOME/media/music/opus/"    # Where it goes on your ThinkPad

# Create local dir if it doesn't exist
mkdir -p "$LOCAL_PATH"

echo "Realigning the mirror..."

# -a: Archive mode (preserves permissions, symlinks, etc.)
# -v: Verbose (so you can see what's happening)
# -z: Compress data during transfer (saves bandwidth)
# -P: Shows progress bar
# --delete: Removes files on the ThinkPad if you deleted them on the server
rsync -avzP "${SERVER_USER}@${SERVER_IP}:${REMOTE_PATH}" "$LOCAL_PATH"

echo "Sync complete. Go study."
