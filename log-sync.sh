#!/bin/bash

rsync -avzp --chomod=a+rwx  /opt/aws-iot-ble-sensor-log/logs/ root@139.59.173.147:/home/autumn-fair-2016-pi-log/
