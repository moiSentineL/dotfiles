#!/usr/sbin/fish

# wallpaper setter using fish + dmenu + feh

set WALLDIR "/home/nibir/.dotfiles/assets/walls/"

find $WALLDIR -name '*.jpg' -o -name '*.png' | dmenu -i -b -fn "Pragmasevka Nerd Font-11" | xargs feh --bg-scale
