#!/bin/bash

chosen=$(echo -e " Shutdown\n Reboot\n Suspend\n Lock\n Logout" | rofi -dmenu -i -p "Power Menu")

case "$chosen" in
    " Shutdown") shutdown now ;;
    " Reboot") reboot ;;
    " Suspend") systemctl suspend ;;
    " Lock") swaylock -i ~/wallpaper/orv2.png ;;
    " Logout") hyprctl dispatch exit ;;
    *) exit 1 ;;
esac
