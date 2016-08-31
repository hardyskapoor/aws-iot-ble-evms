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


 sshpass -p "45lub82nfpqkc85o90" ssh root@139.59.173.147

print_status "All done"
