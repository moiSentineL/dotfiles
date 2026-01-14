#!/bin/bash

# my shutdown ritual

## kill zen-browser
pkill zen

## turn wifi off
nmcli r wifi off

## execute winlog
~/.dotfiles/scripts/systems/win.sh &

## focus on emacs (desktop 1)
bspc desktop -f 1

## persistant notification to proceed to checklist
dunstify -u critical "Execute sleep and proceed to verify shutdown checklist"
