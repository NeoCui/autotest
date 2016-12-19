#!/bin/sh


vmware -v > 8-12.txt

bootOption -o >> 8-12.txt

esxcli hardware trustedboot get >> 8-12.txt



