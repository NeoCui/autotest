#!/bin/sh

vmware -v >8-2.txt

esxcli network nic list >>8-2.txt
