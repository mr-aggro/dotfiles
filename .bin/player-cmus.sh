#!/bin/sh

if info=$(cmus-remote -Q 2> /dev/null); then
    status=$(echo "$info" | grep -v "set " | grep -v "tag " | grep "status " | cut -d ' ' -f 2)
    if [ "$status" = "playing" ] || [ "$status" = "paused" ] || [ "$status" = "stopped" ]; then
	title=$(echo "$info" | grep -v 'set ' | grep " title " | cut -d ' ' -f 3-)
	artist=$(echo "$info" | grep -v 'set ' | grep " artist " | cut -d ' ' -f 3-)
	position=$(echo "$info" | grep -v "set " | grep -v "tag " | grep "position " | cut -d ' ' -f 2)
	duration=$(echo "$info" | grep -v "set " | grep -v "tag " | grep "duration " | cut -d ' ' -f 2)
	file=$(cmus-remote -C status | grep "file " | cut -d ' ' -f 3-)
	stream=$(cmus-remote -C status | grep "stream " | cut -d ' ' -f 2-)	
	if [ "$duration" -ge 0 ]; then
	    pos_minutes=$(printf "%02d" $((position / 60)))
	    pos_seconds=$(printf "%02d" $((position % 60)))

	    dur_minutes=$(printf "%02d" $((duration / 60)))
	    dur_seconds=$(printf "%02d" $((duration % 60)))
	if [ "$title" = "" ]
	then
	    info_string1="| $file"
	    else
	    info_string1=""
	fi
	    info_string="| $pos_minutes:$pos_seconds / $dur_minutes:$dur_seconds" 
	fi
	
	info_string="$artist - $title $stream $info_string1 $info_string"
	
	if [ "$status" = "playing" ]; then
	    echo "#1 $info_string"
	elif [ "$status" = "paused" ]; then
	    echo "#2 $info_string"
	elif [ "$status" = "stopped" ]; then 
	    echo "#3 $info_string"
	else
	    echo ""
	fi
    else
	echo ""
    fi
else
    echo ""
fi
