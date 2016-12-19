#! /bin/sh
#------------------------------------------------------
#This shell script is designed to test one of the 
#virtualization function - interrupt remapping.
#Created date: 11/8/2016
#Version: v0.1.0
#-----------------------------------------------------
file="grub.cfg"
log="interrupt-remap-log"
dir="/boot"
path=`find /boot -name grub.cfg`
warn="No target file found: "

echo "###########Interrupt Remapping############" >> $log
echo "##########################################" >> $log

#Collect the apic information from demsg log file
info="Interrupt Remapping function test:"
echo $info | tee -a $log
if [ $path ]; then
	info="Check the interrupt remapping stauts in the 'dmesg' log"
	echo "#$info $1 'remap'" | tee -a $log
	cmd=`dmesg | grep -i remap`
	echo $cmd | tee -a $log
else
        echo $warn$file | tee -a $log 
fi
echo -e "\n" >> $log

#Modify the Interrupt Remapping parameter in the kernel boot option
#Remove the 'remap' option if the remapping already exists in the kernel boot option.
info="Modify the remap parameter in the kernel boot option."
echo "#$info" | tee -a $log
if [ "$1" = "-remove" ]; then
	cmd=`cat $path | grep -i remap`
	if [ $? -eq 0 ]; then
		info="a. Remove the 'remap' option in the kernel boot option"
		echo $info | tee -a $log
  		sed -i 's/ intel_iommu=on intremap=on//' $path
	else
		warn="No 'remap' parameter found in the kernel boot option"
		echo $warn
		exit
	fi
	echo -e "\n" >> $log
#Add the 'remap' option to the kernel boot option
elif [ "$1" = "-add" ]; then
	cmd=`cat $path | grep -i remap`
	if [ $? -eq 0 ]; then
		warn="Note that 'remap' parameter already exists in the kernel boot option"
		echo $warn
		exit
	else
		info="b. Add the 'remap' option in the kernel boot option"
		echo $info | tee -a $log
  		sed -i 's/quiet/& intel_iommu=on intremap=on /' $path
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

