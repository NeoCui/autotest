#!/bin/sh

vmware -v >8-7log.txt

cat /var/log/vmkernel.log | grep -i interrupterror >>8-7log.txt


cat /var/log/vmkernel.log | grep -i remapping >>8-7log.txt


cat /var/log/vmkernel.log | grep -i interrupRemapping >>8-7log.txt


cat /var/log/vmkernel.log | grep -i interrupt >>8-7log.txt
