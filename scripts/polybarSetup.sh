killall polybar

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m ~/.config/polybar/scripts/launch.sh &
  done
else
  ~/.config/polybar/scripts/launch.sh &
fi
