#!/bin/bash

xrandr --output eDP --off --output HDMI-A-0 --off --output DisplayPort-0 --off --output DisplayPort-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --rate 74.97

sleep 2

setxkbmap -model pc105 -layout us(cmk_ed_us) -option grp:alt_shift_toggle,misc:extend,lv5:caps_switch_lock,grp:shifts_toggle,compose:menu -v 9
