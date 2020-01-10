# dotfiles
Arch i3 gaps polybar scripts

# Commands:
  Клавиши для бинда:
  xev | grep XF 
  
  Класс окна:
  xprop | grep CLASS
  
  Раскладка:
  exec --no-startup-id setxkbmap us,ru -option 'grp:alt_shift_toggle' 
  
  Тачпад, включение тапов:
  xinput list-props DEVICE
  xinput set-prop DEVICE PROP [1,0]
 
# Citrix crashes:
https://github.com/emeryberger/DieHard

    cat /opt/Citrix/ICAClient/wfica.sh 
    #!/bin/sh
    ICAROOT=/opt/Citrix/ICAClient 
    export ICAROOT
    #LD_LIBRARY_PATH=/opt/Citrix/ICAClient/lib
    #export LD_LIBRARY_PATH
    LD_PRELOAD=/usr/local/lib/libdiehard.so
    export LD_PRELOAD
    $ICAROOT/wfica -file $1
    
    
# check char in ttf font
  python check_char.py 🌡

    output:
    --> /usr/share/fonts/noto/NotoSansSymbols2-Regular.ttf
    --> /usr/share/fonts/Unifont/Unifont_Upper.ttf
    
# Disable system beep
    rmmod pcspkr
    
# Sound system
    alsa-utils alsa-plugins alsa-firmware alsa-lib pulseaudio pulseaudio-alsa pulseaudio-bluetooth
    
# Auto mount usb
    pacman -S udiskie
    
# Bluetooth
    https://wiki.archlinux.org/index.php/Bluetooth_headset#Headset_via_Bluez5/PulseAudio
    pacman -S blueman #GTK manager
