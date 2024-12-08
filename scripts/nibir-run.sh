#!/bin/zsh

if [[ $# -ne 2 ]]; then
    echo "Give proper arguments, good sir."
    exit 1
fi

if [[ $1 == https* ]]; then
    cd ~/Documents/GH/nibir-run && pnpm run shorten $1 $2
else
    echo "Arguments don't match expected patterns"
fi

