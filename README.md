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
