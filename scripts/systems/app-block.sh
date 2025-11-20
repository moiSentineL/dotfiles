#!/bin/bash

APPS=("telegram-desktop" "firefox" "mpv" "vesktop")
for app in "${APPS[@]}"; do
    pkill -f $app
done
echo "Apps killed!"

