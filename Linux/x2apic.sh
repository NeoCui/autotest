#! /bin/sh
#--------------------------------------------------------------
#This shell script is designed to test Intel CPU function - 
#APIC and X2APIC. APIC and X2APIC is Intel programmable
#interrupt controller.
#Created date: 11/8/2016
#Version: v0.1.0
#--------------------------------------------------------------
file="grub.cfg"
log="x2apic-log"
dir="/boot"
path=`find $dir -name $file`
warn="No target file found: "
echo "###############APIC, X2APIC################" >> $log
echo "###########################################" >> $log

#Collect the apic information from demsg log file
info="x2apic function test:"
echo $info | tee -a $log
if [ $path ]; then
	info="Check the apic stauts in the 'dmesg' log"
	echo "#$info $1 'nox2apic'" | tee -a $log
	cmd=`dmesg | grep -i apic`
	echo $cmd | tee -a $log
else
        echo $warn$file | tee -a $log 
fi
echo -e "\n" >> $log

#Modify the x2apic parameter in the kernel boot option
#Remove the 'nox2apic' option if the x2apic already exists in the kernel boot option.
info="Modify the x2apic parameter in the kernel boot option."
echo "#$info" | tee -a $log
if [ "$1" = "-remove" ]; then
	cmd=`cat $path | grep -i apic`
	if [ $? -eq 0 ]; then
		info="a. Remove the 'nox2apic' option in the kernel boot option"
		echo $info | tee -a $log
		sed -i 's/ nox2apic//' $path
	else
		warn="No 'nox2apic' parameter found in the kernel boot option"
		echo $warn
		exit
	fi
	echo -e "\n" >> $log
#Add the 'nox2apic' option to the kernel boot option
elif [ "$1" = "-add" ]; then
	cmd=`cat $path | grep -i apic`
	if [ $? -eq 0 ]; then
		warn="Note that 'nox2apic' parameter already exists in the kernel boot option"
		echo $warn
		exit
	else
		info="b. Add the 'nox2apic' option in the kernel boot option"
		echo $info | tee -a $log
		sed -i 's/quiet/& nox2apic /' $path
	fi
	echo -e "\n" >> $log
else
	warn="Parameter of '-add' or '-remove' needed to run this script!"
	echo $warn
	exit
fi
echo -e "\n" >> $log

#3. Reboot the system
read -p "Do you want to reboot now(Y/N) ?" answer
case $answer in
Y|y)
        echo "System will reboot after 3 seconds..."
        sleep 3
        reboot
N|n)
        exit

