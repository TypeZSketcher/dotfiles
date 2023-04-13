#!/usr/bin/env bash

killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if type "xrandr"; then
	for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
	MONITOR=$m polybar atas &
	MONITOR=$m polybar bawah &
done
else
	polybar atas &
	polybar bawah &
fi

echo "Polybar launched..."
