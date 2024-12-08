#!/bin/zsh

qdbus org.kde.ActivityManager /ActivityManager/Activities SetCurrentActivity $( grep -Po '.*?(?=\=Creation)' ~/.config/kactivitymanagerdrc | awk "NR==1")
# switches activity

nmcli r wifi off

konsole  -e termdown 10m

notify-send "Time's up!" "CLOSE THE DAMN COMPUTER" -u critical

paplay ~/.local/notif.mp3
