#!/bin/bash

# this script downloads videos from youtube in the desired directory.
# to be used with sxhkd

DIR="/home/nibir/tmp/vids"
LINK="$(xclip -selection clipboard -o)"


# check directory
if [[ ! -d "$DIR" ]]; then
    echo "directory not found. making."
    mkdir -p "$DIR"
else
    echo "directory found. commencing"
fi

# check if it's a link
if [[ ! "$LINK" == *"youtube"* ]]; then
    notify-send "YouTube link not found."
    exit 1
else
    echo "youtube link found. commencing"
fi

notify-send "Downloading"

yt-dlp "$LINK" \
  --sleep-requests 1 \
  -f "bestvideo[vcodec!*=av01][vcodec!*=vp9][vcodec!*=vp09]+bestaudio[ext=opus]/bestvideo[vcodec!*=av01][vcodec!*=vp9]+bestaudio/bestvideo+bestaudio" \
  -o "%(title)s.%(ext)s" \
  -P "$DIR" \
  --merge-output-format mp4 \
  --embed-chapters \
  --concurrent-fragments 1 \
  --external-downloader aria2c \
  --external-downloader-args "aria2c:-c -j 4 -x 16 -s 16 -k 2M --file-allocation=none" &> /dev/null \

  #--write-auto-sub \
  #--embed-subs \
  #--sub-lang en \
notify-send "Download Finished"
