#!/bin/sh

if info=$(mocp -i 2> /dev/null); then
    status=$(echo "$info" | grep "State: " | cut -d ' ' -f 2)
    info_string=""
    if [ "$status" = "PLAY" ] || [ "$status" = "PAUSE" ]; then
	title=$(echo "$info" | grep -e "^Title: " | cut -d ' ' -f 2-)
	position=$(echo "$info" | grep "CurrentTime: " | cut -d ' ' -f 2-)
	duration=$(echo "$info" | grep "TotalTime: " | cut -d ' ' -f 2-)
	info_string="$title | $position/$duration"
    fi
	if [ "$status" = "PLAY" ]; then
	    echo " $info_string"
	elif [ "$status" = "PAUSE" ]; then
	    echo " $info_string"
	elif [ "$status" = "STOP" ]; then
	    echo " $info_string"
	else
	    echo ""
	fi
fi