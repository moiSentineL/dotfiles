#!/bin/zsh

if pgrep -f "study.sh" > /dev/null; then
    echo "studying"
elif pgrep -f "flomo" > /dev/null; then
    echo "working"
else
    echo ""
fi
