#!/bin/zsh

if [[ $# -ne 2 ]]; then
    echo "Not quite my tempo"
    exit 1
fi

if [[ $1 == https* ]]; then
    percollate pdf --css "a:after { display: none }" $1 -o ~/Documents/percollate/"$2"
else
    echo "No link in the first argument."
fi

