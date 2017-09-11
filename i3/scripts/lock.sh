#!/bin/bash
## Takes a screenshot and uses a blurred version of it
## as a lock screen with i3lock

# Take screencap
[ -f /tmp/screen.png ] && rm /tmp/screen.png

scrot /tmp/screen.png && chmod 666 /tmp/screen.png

convert /tmp/screen.png -paint 3 /tmp/screen.png
[[ -f ~/.config/i3/lock.png ]] && convert /tmp/screen.png  ~/.config/i3/lock.png -gravity center -composite -matte /tmp/screen.png
i3lock -u -e -i /tmp/screen.png
