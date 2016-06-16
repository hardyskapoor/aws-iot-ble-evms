#!/bin/bash
x=`ping -c1 google.com 2>&1 | grep unknown`
if [ !  "$x" =  "" ]; then
	echo  "Network is down, attempting to restart"
	# remove add Network reboot
	# sudo /sbin/ifup --force $wlan
	sudo reboot
	sleep 5
else
	echo "Network is up and all fine"
fi
