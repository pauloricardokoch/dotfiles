#!/bin/bash

xset -b

setxkbmap us intl

picom &

unclutter --jitter 10 --ignore-scrolling --start-hidden --fork

CONNECTED=$(xrandr -q | grep "DP-3-1 connected")
TV=$(xrandr -q | grep "4096x2160")
if [[ -z "$CONNECTED" ]]; then
    xrandr --newmode Modeline "1920x1200_60.00"  193.25  1920 2056 2256 2592  1200 1203 1209 1245 -hsync +vsync
    xrandr --addmode eDP-1 1920x1200_60.00

    xrandr --output eDP-1 --mode 1920x1080_60.00 
elif [[ -n "$TV" ]]; then
    xrandr --newmode "2560x1440_60.00"  312.25  2560 2752 3024 3488  1440 1443 1448 1493 -hsync +vsync
    xrandr --addmode HDMI-1 2560x1440_60.00

    xrandr --output eDP-1 --off \
    --output HDMI-1 --mode 2560x1440_60.00
else
    xrandr --newmode "1920x1080_144.00"  452.50  1920 2088 2296 2672  1080 1083 1088 1177 -hsync +vsync
    xrandr --addmode DP-3-1 1920x1080_144.00

    xrandr --newmode "1920x1080_144.00"  452.50  1920 2088 2296 2672  1080 1083 1088 1177 -hsync +vsync
    xrandr --addmode DP-3-2 1920x1080_144.00

    xrandr --output eDP-1 --off \
    --output DP-3-1 --primary --mode 1920x1080_144.00 \
    --output DP-3-2 --mode 1920x1080_144.00 --right-of DP-3-1
fi

nitrogen --restore

qtile start
