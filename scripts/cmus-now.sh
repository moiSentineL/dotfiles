#!/bin/zsh

# Code inspired by content found at http://v3gard.com/2011/01/getting-cmus-to-cooperate-with-conky/

if pgrep -f "cmus" > /dev/null; then

artist=`cmus-remote -Q | 
	grep --text '^tag artist' | 
	sed '/^tag artistsort/d' | 
	awk '{gsub("tag artist ", "");print}'`
title=`cmus-remote -Q  | 
	grep --text '^tag title' | 
	sed -e 's/tag title //' |
	awk '{gsub("tag title ", "");print}'`

	echo "$artist - $title"
else
	echo " "
fi
