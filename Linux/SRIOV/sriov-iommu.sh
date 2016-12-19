#! /bin/bash
#--------------------------------------------------------
#This shell script is designed to test one of the Intel
#virtualization technology - iommu.
#Created date: 11/8/2016
#Version: v0.1.0
#--------------------------------------------------------
warn="Error: No target file: "
info="Append intel_iommu=on parameter for kernel boot option."
echo $info
dir="/boot"
file='grub.cfg'
path=`find $dir -name $file` 
if [ $path ]; then
	cmd=`cat $path | grep -i iommu`
	if [ $? -eq 0 ]; then
		warn="Note that 'iommu' already exists in the kernel boot option."
		echo $warn
	else
		sed -i 's/quiet/& intel_iommu=on/' $path
		warn="Append the 'iommu' successfully."
		echo $warn
	fi
	read -p "Do you want to reboot now (Yy/Nn) ?" answer
	case $answer in
	Y|y)
		info="The system will reboot in 3 seconds..."
		sleep 3
		reboot
	N|n)
		exit
else
	echo $warn$file
fi




