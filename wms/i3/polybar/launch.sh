#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar
polybar --list-monitors | while read monitor; do
    port=$(echo $monitor | cut -d":" -f1)
    if echo $monitor | grep 3840 > /dev/null; then
        MONITOR=$port polybar -vvv default-hidpi &
    else
        MONITOR=$port polybar default &
    fi
done

echo "Bars launched..."