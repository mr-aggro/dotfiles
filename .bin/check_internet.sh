if ping -q -c 1 -W 1 1.1.1.1 &> /dev/null; then
  echo "%{F#00ff00}%{F-}"
else
  echo "%{F#ff0000}%{F-}"
fi
