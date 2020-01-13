#!/bin/bash

function gen_list()
{
    netctl list 
}

PROFILE=$( (gen_list)  | rofi -dmenu -p "Connect to")
if [ -n "${PROFILE}" ]
then
PROF=$(echo "$PROFILE" | cut -d ' ' -f 2- | awk '{print $1}')
ACTIVE=$(netctl is-active $PROF)
    if [ "$ACTIVE" == "active" ]; then
#	echo "Selected active /$PROF/"
	sudo netctl stop $PROF
    else
#	echo "Selected non-active /$PROF/"
	sudo netctl start $PROF
    fi
fi
