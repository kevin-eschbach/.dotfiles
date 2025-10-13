#!/usr/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x -u $UID polybar >/dev/null; do sleep 1; done

if command -v xrandr >/dev/null; then
    # Get all connected outputs except eDP-1
    mapfile -t outputs < <(xrandr --query | grep " connected" | cut -d" " -f1 | grep -v "eDP-1")
    if [ "${#outputs[@]}" -gt 0 ]; then
        # Turn on all external, turn off eDP-1
        for m in "${outputs[@]}"; do
            xrandr --output "$m" --auto
        done
        xrandr --output "eDP-1" --off
    else
        # Only eDP-1 is connected, turn it on
        xrandr --output "eDP-1" --auto
    fi
fi

# Launch bar
polybar --reload example
