#!/bin/sh

mkdir -p /home/droidian/.config
touch /home/droidian/.config/backlight-brightness

while true; do

if [ $(wlr-randr | grep -i "enabled" | awk '{print $2}') = 'yes' ]; then
#	echo "on";
	cat /sys/class/backlight/panel0-backlight/brightness > ~/.config/backlight-brightness;
	sleep 1

elif [ $(wlr-randr | grep -i "enabled" | awk '{print $2}') = 'no' ]; then
#	echo "off";
	sleep 1
	cat ~/.config/backlight-brightness > /sys/class/backlight/panel0-backlight/brightness
fi

done
