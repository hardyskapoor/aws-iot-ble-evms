#!/bin/bash
#
# Script to install aws-iot-ble-sensor onto a Raspbian Jessie system.
#
# curl -sL https://raw.githubusercontent.com/hardyskapoor/aws-iot-ble-evms/master/evms-setup.sh | sudo -E bash -
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

print_status "Running clone for aws-iot-ble-evms"

cd /opt

exec_cmd 'git clone https://github.com/hardyskapoor/aws-iot-ble-evms.git'
print_status "Copy this command and added into crontab \n 2/* * * * * /opt/aws-iot-ble-evms/internet-test.sh "
