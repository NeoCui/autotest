#!/bin/sh
#------------------------------------------------
#This shell script is designed to check PCI device
#ID and its drivers.
#Created date: 11/8/2016
#Version: v0.1.0
#------------------------------------------------
warn="No target folder: "
log="pciid-log"
inputfile="pciid.txt"
echo "#############PIC device ID check##############" >> $log
echo "##############################################" >> $log

if [ -f $inputfile ]; then
	echo "Inputfile $inputfile found."
	cmd=`sed -i '/^$/d' $inputfile
	echo $cmd
	#read PCI ID from input file.
	while read data
	do
		#1. check PCI device ID
		if [ ! $data ]; then
			echo "NULL PCI ID found in the input file. Please check the input file."
			exit
		else
			vid="v0000"`echo $data|awk -F ":" '{print $1}'`
			sid="d0000"`echo $data|awk -F ":" '{print $2}'`
			echo "VendorID:DeviceID $vid:$sid" | tee -a $log
		fi
		#2. check related drivers.
		dir="/lib/modules/`uname -r`/"
		subdir="modules.order"
		if [ -d $dir ]; then
			for ko in $( cat $dir$subdir | grep ko )
			do
				for alias in $( modinfo $dir$ko | grep -i alias )
				do
					ret=$( echo $alias | grep -i $vid | grep -i $sid)
					if [ "$ret"x != ""x ]; then
						echo $ko | tee -a $log
						modinfo $dir$ko | grep "^version" | tee -a $log
					fi
				done
			done
		else
			echo $warn$dir | tee -a $log
		fi
	done < $inputfile
else
	echo "Error: No input file $inputfile found." | tee -a $log
	exit
fi
