#!/bin/bash
#
# Script to install aws-iot-ble-sensor onto a Raspbian Jessie system.
#
# curl -sL https://raw.githubusercontent.com/hardyskapoor/aws-iot-ble-evms/master/evms-setup.sh | sudo -E bash -
# or run this command both will install the cron.
# curl -sL http://pi.stillindev.com/evms-setup.sh | sudo -E bash -
#
export DEBIAN_FRONTEND=noninteractive

print_status() {
    echo
    echo "## $1"
    echo
}

bail() {
    echo 'Error executing command, exiting'
    exit 1
}

exec_cmd_nobail() {
    echo "+ $1"
    bash -c "$1"
}

exec_cmd() {
    exec_cmd_nobail "$1" || bail
}


cd /opt
print_status "Removing old aws-iot-ble-evms folder"
rm -rf aws-iot-ble-evms

print_status "Running clone for aws-iot-ble-evms"

exec_cmd 'git clone https://github.com/hardyskapoor/aws-iot-ble-evms.git'

print_status "Make the wifi test executeable"
#chmod +x /opt/aws-iot-ble-evms/internet-test.sh
chmod +x /opt/aws-iot-ble-evms/wifi-rebooter.sh

print_status "Removing old check-wifi cronbjob"
rm -rf /etc/cron.d/check-wifi

print_status "Setting up new cronjob"
exec_cmd 'ln -s /opt/aws-iot-ble-evms/check-wifi /etc/cron.d/check-wifi'
print_status "Setting up cron for rsync started"
print_status "create ssh folder"
cd /home/pi
rm -rf .ssh
mkdir .ssh
cd .ssh
cp /opt/aws-iot-ble-evms/ssh/id_rsa id_rsa
cp /opt/aws-iot-ble-evms/ssh/id_rsa.pub id_rsa.pub
print_status "change permission id_rsa"
chmod 600 id_rsa
cd /
print_status "Removing old log-sync cronbjob"
rm -rf /etc/cron.d/log-sync

print_status "setting up sync cron"
exec_cmd 'ln -s /opt/aws-iot-ble-evms/log-sync /etc/cron.d/log-sync'

print_status "Setting up cron for rsync finished"

print_status "All done"
