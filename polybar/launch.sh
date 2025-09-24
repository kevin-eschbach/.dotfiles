#!/usr/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x -u $UID polybar >/dev/null; do sleep 1; done

# Let all monitors mirror the laptop
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
      xrandr --output $m --same-as eDP-1
  done
fi

# Launch bar
polybar --reload example
