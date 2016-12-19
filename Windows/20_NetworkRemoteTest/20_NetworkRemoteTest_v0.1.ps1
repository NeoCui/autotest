echo  +-------------------------------------------------------------------------------------------------+
echo *                                                                                                   *
echo *                              "LENOVO SW-OS Development Testing Team."                             *
echo *                                                                                                   *
echo  +-------------------------------------------------------------------------------------------------+
echo  +-------------------------------------------------------------------------------------------------+
echo *                                                                                                   *
echo *                "This batch file is apply for Windows vNext_Network_Remote test."                  *
echo *                                                                                                   *
echo *                     "Please plug in a removable device to save the output log."                   *
echo *                                                                                                   *
echo  +-------------------------------------------------------------------------------------------------+
echo  "System is scanning the ip address, please wait...."
Get-NetIPConfiguration
echo  "Checking the status of firewall profile, please wait...."
get-netfirewallprofile >NetworkRemoteTest.txt
echo  "The status of firewall profile will be changed after 10 seconds."
timeout /t 10
Set-NetFirewallProfile -Enabled False >>NetworkRemoteTest.txt
echo  "Refreshing and exporting the status of firewall profile, please wait...."
timeout /t 10
Get-NetFirewallProfile >>NetworkRemoteTest.txt
echo  "System is setting the protocol of allow remote access 'Remote connections to this computer', please wait...."
timeout /t 5
Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server' -Name fDenyTSConnections -Value 0
Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp' -Name userAuthentication -Value 1
Set-NetFirewallRule -DisplayGroup 'remote desktop' -Enabled True
echo "Restoring and exporting the status of firewall profile, please wait...."
timeout /t 10
Set-NetFirewallProfile -Enabled true >>NetworkRemoteTest.txt
echo  "Exporting the status of firewall profile, please wait...."
timeout /t 10
get-netfirewallprofile >>NetworkRemoteTest.txt