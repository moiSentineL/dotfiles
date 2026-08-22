#!/bin/bash

find . -type l | while read -r link; do
    target=$(readlink -f "$link")
    if [ -f "$target" ]; then
        rm "$link"
        ln "$target" "$link"
    fi
done
