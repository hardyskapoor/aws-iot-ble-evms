#!/bin/bash
x=`ping -c1 google.com 2>&1 | grep unknown`
if [ !  "$x" =  "" ]; then
	echo  "Network is down, attempting to restart"
	sudo /sbin/ifup --force $wlan
	sleep 5
else
	echo "Network is up and all fine"
fi
