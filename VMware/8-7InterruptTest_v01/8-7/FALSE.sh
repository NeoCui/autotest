#!/bin/sh
esxcli system settings kernel set --setting=iovDisableIR -v FALSE
reboot

