#!/usr/bin/expect -f
spawn rsync -avzp --chmod=a+rwx /opt/aws-iot-ble-sensor-log/logs/ root@139.59.173.147:/home/autumn-fair-2016-pi-log/
expect "assword:"
send "45lub82nfpqkc85o90\r"
interact
