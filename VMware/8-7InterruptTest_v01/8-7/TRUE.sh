#!/bin/sh
esxcli system settings kernel set --setting=iovDisableIR -v TRUE
reboot
