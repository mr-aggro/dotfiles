#!/bin/bash

function gen_list()
{
    netctl list 
}

ACTIVE=$( netctl list | grep '*' | cut -d ' ' -f 2- )
PROFILE=$( (gen_list)  | rofi -dmenu -p "Connect to")
#echo "${ACTIVE}"
#if [ x"empty" = x"${WORKSPACE}" ]
#then
#    i3_empty_workspace.sh
#elif [ -n "${WORKSPACE}" ] 
if [ -n "${PROFILE}" ]
then
#    sudo netctl stop $ACTIVE
    sudo netctl start $PROFILE
fi
