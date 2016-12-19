#! /bin/bash
#-----------------------------------------------------
#This shell script is designed to test the network
#manager service - collect network card information and load/unload
#network card drivers.
#Created date: 11/8/2016
#Version: v0.1.0
#-----------------------------------------------------

log=sriov-log
echo "#############SRIOV-NIC#################" >> $log
echo "#######################################" >> $log

#1. Shutdown the network manager service
info="1. Stop NetworkManager service"
echo "#$info" | tee -a $log
cmd=`service NetworkManager stop`
if [ $? -eq 0 ]; then
	echo $cmd
	info="Stop the NetworkManager service successfully."
	echo $info | tee -a $log
	sleep 5
else
	warn="Stop the NetworkManager service failed."
	echo $warn | tee -a $log
fi	
echo -e "\n" >> $log

#2. Start the network service
info="2. Start NetworkManager service"
echo "#$info" | tee -a $log
cmd=`service NetworkManager start`
if [ $? -eq 0 ]; then
	echo $cmd
	info="Start the NetworkManager service successfully."
	echo $info | tee -a $log
	sleep 5
else
	warn="Start the NetworkManager service failed."
	echo $warn | tee -a $log
fi	
echo -e "\n" >> $log

#3. Check the network card information
info="3. Check i350 network card information"
echo "#$info" | tee -a $log
cmd=`lspci | grep -i i350`
if [ $? -eq 0 ]; then
	info="Network device -i350 information:"
	echo $info | tee -a $log
	echo $cmd | tee -a $log
	sleep 5
else
	warn="Fetch NIC - i350 failed: No avaiable information."
	echo $warn | tee -a $log
fi	
echo -e "\n" >> $log

#4. Unload the network card driver
info="4. Unload  network card - igb driver"
echo "#$info" | tee -a $log
cmd=`modprobe -r igb`
if [ $? -eq 0 ]; then
	echo $cmd
	info="Unload NIC driver successfully."
	echo $info | tee -a $log
	sleep 5
else
	warn="Unload NIC driver failed."
	echo $warn | tee -a $log
fi	
echo -e "\n" >> $log

#5. Recheck network card information
info="5. Re-check i350 network card information"
echo "#$info" | tee -a $log
cmd=`lspci | grep -i i350`
if [ $? -eq 0 ]; then
	info="Network device -i350 information:"
	echo $info | tee -a $log
	echo $cmd | tee -a $log
	sleep 5
else
	warn="Fetch NIC - i350 failed: No avaiable information."
	echo $warn | tee -a $log
fi	
echo -e "\n" >> $log

#6. Check the error information related to network card information
info="6. Check the error information in 'dmesg' related to i350 network card information"
echo "#$info" | tee -a $log
cmd=`dmesg | grep -i error`
if [ $? -eq 0 ]; then
	info="Error information in the 'dmesg' log file:"
	echo $info | tee -a $log
	echo $cmd | tee -a $log
	sleep 5
else
	warn="No error information avaiable in the 'dmesg' log file."
	echo $warn | tee -a $log
fi
echo -e "\n" >> $log

#7. Load the network card driver
info="7. Load  network card - igb driver"
echo "#$info" | tee -a $log
cmd=`modprobe igb max_vfs=1`
if [ $? -eq 0 ]; then
	echo $cmd
	info="Load NIC driver successfully."
	echo $info | tee -a $log
	sleep 5
else
	warn="Load NIC driver failed."
	echo $warn | tee -a $log
fi	
echo -e "\n" >> $log

#8. Recheck network card information
info="8. The last check for i350 network card information"
echo "#$info" | tee -a $log
cmd=`lspci | grep -i i350`
if [ $? -eq 0 ]; then
	info="Network device -i350 information:"
	echo $info | tee -a $log
	echo $cmd | tee -a $log
	sleep 5
else
	warn="Fetch NIC - i350 failed: No avaiable information."
	echo $warn | tee -a $log
fi	

