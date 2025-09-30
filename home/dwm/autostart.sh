#!/usr/bin/env sh
slstatus &
dunst --config ~/.config/dunst/dunstrc &
xautolock -detectsleep -time 10 -locker "betterlockscreen -l blur" &
