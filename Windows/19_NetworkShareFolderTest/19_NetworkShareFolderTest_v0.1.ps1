echo  +-------------------------------------------------------------------------------------------------+
echo *                                                                                                   *
echo *                              "LENOVO SW-OS Development Testing Team."                             *
echo *                                                                                                   *
echo  +-------------------------------------------------------------------------------------------------+
echo  +-------------------------------------------------------------------------------------------------+
echo *                                           ReadMe                                                  *
echo *               1 "This Script file is apply for Windows vNext_Network_Share folder test."           *
echo *               2 "You have to record the ip address of test machine before performing follow steps." *
echo *               3 "Open Run window and input \\xxx.xxx.xxx.xxx in your PC."                          *
echo *               4 "Copy a big file(no more than 2GB) to share folder."                              *
echo *               5 "Verify the MD5."                                                                *
echo  +-------------------------------------------------------------------------------------------------+
echo  "System is scanning the ip address, please wait...."
Get-NetIPConfiguration
echo  "Creating a share folder on your desktop, please wait...."
timeout /t 5
New-SmbShare -Name ShareFolderTest -Path C:\Users\Administrator\Desktop -Description Networkshare -FullAccess administrator
echo "All share folder wil be shown after 5 seconds, please wait.... "
timeout /t 5
Get-WmiObject -Class win32_share | ft -AutoSize