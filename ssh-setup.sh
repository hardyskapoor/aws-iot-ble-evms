#!/bin/bash
#
# Script to install aws-iot-ble-sensor onto a Raspbian Jessie system.
#
# curl -sL https://raw.githubusercontent.com/hardyskapoor/aws-iot-ble-evms/master/ssh-setup.sh | sudo -E bash -
# or run this command both will install the cron.
# curl -sL http://pi.stillindev.com/ssh-setup.sh | sudo -E bash -
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


print_status "Setting up cron for rsync started"
print_status "create ssh folder"
rm -rf /root/.ssh
mkdir .ssh
#chmod 777 .ssh
cp /opt/aws-iot-ble-evms/ssh/id_rsa /root/.ssh/id_rsa
cp /opt/aws-iot-ble-evms/ssh/id_rsa.pub /root/.ssh/id_rsa.pub
print_status "change permission id_rsa"
chmod 600 /root/.ssh/id_rsa
cd /
chmod +x /opt/aws-iot-ble-evms/log-sync.sh
print_status "Removing old log-sync cronbjob"
rm -rf /etc/cron.d/log-sync

print_status "setting up sync cron"
exec_cmd 'ln -s /opt/aws-iot-ble-evms/log-sync /etc/cron.d/log-sync'

print_status "Setting up cron for rsync finished"

print_status "All done"
