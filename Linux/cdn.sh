#!/bin/sh
#----------------------------------------------------------
#This shell script is designed to check the status of 
#package 'biosdevname', and network device naming rule.
#Created date: 11/8/2016
#Version: V0.1.0
#----------------------------------------------------------
info="List all the avaiable network devices:"
dir="/sys/class/net"
log="cdn-log"
warn="No target file found: "
cmd=`ls $dir`
echo "#################CDN####################" >> $log
echo "########################################" >> $log

#List all the avaiable network devices and store them in the "cdn-log"
echo "#$info" | tee -a $log
if [ -d $dir ]; then
        echo $cmd | tee -a $log
else
        echo $warn$dir | tee -a $log
fi
echo -e "\n" >> $log

#1. Check the installation status of biosdevname
info="1.Check that the package 'biosdevname' is installed or not:"
warn="No 'biosdevname' found! Please install biosdevname package."
echo "#$info" | tee -a $log
cmd=`rpm -qa | grep -i biosdevname`
if [ $? -eq 0 ]; then
        echo $cmd | tee -a $log
        sleep 5
else
        echo $warn | tee -a $log
fi
echo -e "\n" >> $log

#2. Verify the biosdevname function
info="2.Append biosdevname=1 parameter in the kernel boot option"
warn="No target file found: "
dir="/boot"
file="grub.cfg"
path=`find $dir -name $file`
echo "#$info" | tee -a $log
if [ $path ]; then
        sed -i 's/quiet/& biosdevname=1/' $path
	info="Append the 'biosdevname=1' parameter successfully."
	echo $info | tee -a $log
else
        echo $warn$file | tee -a $log
fi
echo -e "\n" >> $log

#3. Remove the file called "70-persistent-net.rules"
info="3.Remove the rule file called '70-persistent-net.rules'"
echo "#$info" | tee -a $log
dir="/etc/udev"
file="70-persistent-net.rules"
cmd=`rm -f $path`
if [ $path ]; then
	info="Remove the $file successfully."	
	echo $cmd
	echo $info | tee -a $log
else
	echo $warn$file | tee -a $log
fi
echo -e "\n" >> $log

#4. Reboot the Operating System
read -p "Do you want reboot now(Y/N)" answer
case $answer in
Y|y)
        echo "System will reboot after 3 seconds..."
        sleep 3
        reboot
N|n)
        exit

