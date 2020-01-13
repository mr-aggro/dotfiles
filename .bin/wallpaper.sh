#!/bin/bash

wallp_dir="$HOME"/w
reload_time="7"
wallpapers=();
while read ; do
    wallpapers+=($REPLY)
done < <(ls "$wallp_dir")

while true; do
    count=${#wallpapers[@]}
    rand=$((RANDOM % count + 1))     
    feh --bg-scale "$wallp_dir"/"${wallpapers[$rand]}"
    sleep "$reload_time"
done
