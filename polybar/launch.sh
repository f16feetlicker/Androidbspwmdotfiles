#!/usr/bin/env bash

# Add this script to your wm startup file.

DIR="$HOME/.config/polybar"

# Terminate already running bar instances
killall -q polybar

# Launch the bar
polybar -q bar1 -c "$DIR"/config.ini &
polybar -q bar2 -c "$DIR"/config.ini &
polybar -q cpu -c "$DIR"/config.ini &
polybar -q window -c "$DIR"/config.ini &
polybar -q hour -c "$DIR"/config.ini &
polybar -q date -c "$DIR"/config.ini &
