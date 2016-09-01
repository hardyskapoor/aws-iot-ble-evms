#!/usr/bin/expect -f
spawn rsync -avzp --chmod=a+rwx /opt/aws-iot-ble-sensor-log/logs/ autumnfairlog@www3.g16.pair.com:/usr/home/autumnfairlog/public_html/pilogs/
expect "assword:"
send "iFNrMcyz\r"
interact
