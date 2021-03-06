#!/bin/bash

# The IP for the server you wish to ping (8.8.8.8 is a public Google DNS server)
SERVER=8.8.8.8
echo "checking wifi network at: "
date

# Only send two pings, sending output to /dev/null
ping -c2 ${SERVER} > /dev/null

# If the return code from ping ($?) is not 0 (meaning there was an error)
if [ $? != 0 ]
then
    # Restart the wireless interface
    echo "Network is down attempting for netwrok reboot"
    sudo ifdown --force wlan0
    sudo ifup wlan0
else
    echo "Network is up and all fine"
fi
