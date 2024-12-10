CURRENT_SONG=$(python3 $HOME/.config/waybar/scripts/mediaplayer.py --player spotify)

zscroll -p " | " --delay 0.2 \
    --length 40 \
    --update-interval 1 \
    --update-check true $CURRENT_SONG &
wait
