# set keyboar (in x)
setxkbmap -layout us -variant intl

# start picom
picom &

# unclutter hides the mouse cursor
unclutter --jitter 10 --ignore-scrolling --start-hidden --fork

# dbus
/usr/lib/notification-daemon-1.0/notification-daemon &

# start qtile 
qtile start
