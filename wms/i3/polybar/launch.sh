#!/bin/bash
# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar
# first polybar gets the tray, therefore start polybar
# on monitor with the highest resolution first
polybar --list-monitors | sort -nr -k2 | while read monitor; do
    port=$(echo $monitor | cut -d":" -f1)
    if echo $monitor | grep 3840x > /dev/null; then
        MONITOR=$port polybar default-hidpi &
    else
        MONITOR=$port polybar default &
    fi
done

echo "Bars launched..."
