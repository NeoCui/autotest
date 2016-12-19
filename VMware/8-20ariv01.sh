#!/bin/sh
vmware -v >8-20ari.txt

lspci | grep -i network >>8-20ari.txt


