#!/bin/bash

xset -b

setxkbmap us intl

picom &

unclutter --jitter 10 --ignore-scrolling --start-hidden --fork

CONNECTED=$(xrandr -q | grep "HDMI-1 connected")
TV=$(xrandr -q | grep "4096x2160")
if [[ -z "$CONNECTED" ]]; then
    xrandr --newmode "1920x1080_60.00"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
    xrandr --addmode eDP-1 1920x1080_60.00

    xrandr --output eDP-1 --mode 1920x1080_60.00 
elif [[ -n "$TV" ]]; then
    xrandr --newmode "2560x1440_60.00"  312.25  2560 2752 3024 3488  1440 1443 1448 1493 -hsync +vsync
    xrandr --addmode HDMI-1 2560x1440_60.00

    xrandr --output eDP-1 --off \
    --output HDMI-1 --mode 2560x1440_60.00
else
    xrandr --newmode "2560x1080_120.00"  492.00  2560 2768 3048 3536  1080 1083 1093 1160 -hsync +vsync
    xrandr --addmode DP-2-1 2560x1080_120.00

    xrandr --newmode "1920x1080_75.00"  220.75  1920 2064 2264 2608  1080 1083 1088 1130 -hsync +vsync
    xrandr --addmode DP-2-3 1920x1080_75.00

    xrandr --newmode "1920x1080_144.00"  452.50  1920 2088 2296 2672  1080 1083 1088 1177 -hsync +vsync
    xrandr --addmode HDMI-1 1920x1080_144.00

    xrandr --output eDP-1 --off \
    --output HDMI-1 --primary --mode 1920x1080_144.00 \
    --output DP-2-3 --mode 1920x1080_75.00 \
    --rotate left --left-of HDMI-1 \
    --output DP-2-1 --mode 2560x1080_120.00 \
    --right-of HDMI-1
fi

nitrogen --restore

qtile start
