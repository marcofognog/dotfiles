#!/bin/sh

SETUP_ENV=$(cat ~/.setup_env)
if  [ -z $SETUP_ENV ]; then
    filepath=$(readlink -f "$0")
    echo "SETUP_ENV is not defined (exited from $filepath)"
    exit;
fi

if [ $SETUP_ENV = "asus" ]; then
    intern=LVDS-1
    extern=HDMI-1
else
    intern=eDP-1
    extern=HDMI-2
fi

if xrandr | grep "$extern disconnected"; then
    xrandr --output $extern --off --output $intern --auto
else
    xrandr --output $extern --auto --output $intern --off
fi

