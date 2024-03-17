#!/bin/bash

xset -b

setxkbmap us intl

picom &

unclutter --jitter 10 --ignore-scrolling --start-hidden --fork

CONNECTED=$(xrandr -q | grep "HDMI-1 connected")
if [[ -z "$CONNECTED" ]]; then
    xrandr --newmode "1920x1080_60.00"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
    xrandr --addmode eDP-1 1920x1080_60.00
    xrandr --output eDP-1 --mode 1920x1080_60.00 
else
    xrandr --newmode "2560x1080_60.00"  230.00  2560 2720 2992 3424  1080 1083 1093 1120 -hsync +vsync
    xrandr --addmode DP-2-1 2560x1080_60.00

    xrandr --newmode "1920x1080_120.00"  369.50  1920 2080 2288 2656  1080 1083 1088 1160 -hsync +vsync
    xrandr --addmode DP-2-3 1920x1080_120.00

    xrandr --newmode "1920x1080_144.00"  452.50  1920 2088 2296 2672  1080 1083 1088 1177 -hsync +vsync
    xrandr --addmode HDMI-1 1920x1080_144.00

    xrandr --output eDP-1 --off \
    --output HDMI-1 --primary --mode 1920x1080_144.00 \
    --output DP-2-3 --mode 1920x1080_120.00 \
    --rotate left --left-of HDMI-1 \
    --output DP-2-1 --mode 2560x1080_60.00 \
    --right-of HDMI-1
fi

nitrogen --restore

/home/pkoch/.local/bin/qtile start
