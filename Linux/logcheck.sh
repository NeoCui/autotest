#!/bin/sh
#---------------------------------------------------
#This shell script is designed to collect error and
#warning information of the installed Operating System.
#Created date: 11/8/2016
#Version: v0.1.0
#---------------------------------------------------

log=erro-log
warn="Error: No target file "
echo "##############Error Collection##############" >> $log
echo "############################################" >> $log
#1. Collect the error information from message log file
info="Error information in 'message' log file"
echo "#$info" | tee -a $log 
file="/var/log/messages"
if [ -f $file ]; then
	cmd=`egrep -i 'error|warn|fail' $file`
	if [ $? -eq 0 ]; then
		echo $cmd | tee -a $log
	else
		warn="No error information in the 'message' log file"
		echo $warn | tee -a $log
	fi	
else
	echo $warn$file | tee -a $log
fi
echo -e "\n" >> $log

#2. Collect the error information from dmesg log file
info="Error information in 'dmesg' log file"
echo "#$info" | tee -a $log
cmd=`dmesg | egrep -i 'error|warn|fail'`
if [ $? -eq 0 ]; then
	echo $cmd | tee -a $log
else
	warn="No error information in the 'dmesg' log file"
	echo $warn | tee -a $log
fi
echo -e "\n" >> $log



