#!/bin/sh

#source /etc/X11/xinit/xinitrc

[ -f ~/.xprofile ] && . ~/.xprofile

xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto

xbindkeys
dwmbar &
exec dwm
