#!/usr/bin/env bash

if pgrep -x "waybar" >/dev/null; then
    killall waybar
fi

waybar &
