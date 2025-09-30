#!/bin/sh

# Define power options with icons
options="  Lock\n  Logout\n  Shutdown\n  Reboot"

# Launch dmenu vertically with 4 lines
choice=$(echo -e "$options" | dmenu \
    -i \
    -c \
    -l 4 \
    -fn "JetBrainsMono-Regular:size=12" \
    -nb "#282828" \
    -nf "#ebdbb2" \
    -sb "#d3869b" \
    -sf "#282828" \
    -bw 3 \
    -p "Power Menu:")

# Perform the selected action
case "$choice" in
    *Lock*) betterlockscreen -l blur ;;
    *Logout*) pkill -KILL -u "$USER" ;;
    *Shutdown*) shutdown now ;;
    *Reboot*) reboot ;;
esac
