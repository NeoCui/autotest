#!/bin/sh



esxcli system module parameters set -m ixgbe -p "max_vfs=8,8"
reboot
