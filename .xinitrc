# set keyboar (in x)
setxkbmap -layout us -variant intl

# start picom
picom &

# unclutter hides the mouse cursor
unclutter --jitter 10 --ignore-scrolling --start-hidden --fork

# nitrogen for wallpaper
fixd 
nitrogen --set-zoom-fill ~/Pictures/noragami.jpg --head=0 
nitrogen --set-zoom-fill ~/Pictures/dororo.jpg --head=1
nitrogen --set-zoom-fill ~/Pictures/kochou.jpg --head=2 

# start qtile 
qtile start
