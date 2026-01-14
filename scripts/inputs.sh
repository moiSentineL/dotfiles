#!/bin/bash

# solving input problems

## keyboard colemak mod
setxkbmap -model pc105 -layout us -variant cmk_ed_us -option grp:alt_shift_toggle,misc:extend,lv5:caps_switch_lock,grp:shifts_toggle,compose:menu -v 9

## left handed mouse
xinput set-button-map "HID 1bcf:08a0 Mouse" 3 2 1 4 5 6 7 8 9
xinput set-prop "HID 1bcf:08a0 Mouse" "libinput Accel Speed" 0.4
