#!/bin/sh

vmware -v >8-13.txt

esxcli system settings kernel list -o iovDisableIR >>8-13.txt

cat /var/log/vmkernel.log | grep -i ESR >>8-13.txt

esxcli system settings kernel set --setting=iovDisableIR -v TRUE >>8-13.txt


esxcli system settings kernel list -o iovDisableIR >>8-13.txt


cat /var/log/vmkernel.log | grep -i ESR >>8-13.txt
