#!/bin/bash

rsync -avz  /opt/aws-iot-ble-sensor-log/logs/ root@139.59.173.147:/home/autumn-fair-2016-pi-log/ >> /home/pi/sync.log 2>&1
