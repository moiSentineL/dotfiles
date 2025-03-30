#!/bin/bash
python3 ~/.config/polybar/scripts/mediaplayer.py --player spotify | jq -r '.text' &

