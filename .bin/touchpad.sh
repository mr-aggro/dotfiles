#!/bin/sh

device='Synaptics TM3336-004'
id=$(xinput list-props "$device" | grep "Device Enabled" | cut -f3)
echo $id

#if [ $state == 1 ]; then
#xinput --disable "$device"
#else
#xinput --enable "$device"
#fi