echo  +-------------------------------------------------------------------------------------------------+
echo *                                                                                                   *
echo *                              "LENOVO SW-OS Development Testing Team."                             *
echo *                                                                                                   *
echo  +-------------------------------------------------------------------------------------------------+
echo  +-------------------------------------------------------------------------------------------------+
echo *                                                                                                   *
echo *                "This Script is apply for Windows vNext_Disable and Enable PCIe test."             *
echo *                                                                                                   *
echo *               "You need an another NIC to connect if you are remoting control the SUT."           *
echo *                                                                                                   *
echo  +-------------------------------------------------------------------------------------------------+
timeout /t 5
echo "Information: System is scanning devices status, please wait...."
Get-NetAdapter -Physical > DisEnaPCIeTest.txt
echo "Warning: NetAdapter devices will lost connection after 10 seconds."
timeout /t 10
Get-NetAdapter | ? status -Match up | Disable-NetAdapter >> DisEnaPCIeTest.txt
echo "Information: System is refreshing devices status, please wait...."
timeout /t 10
Get-NetAdapter -Physical >> DisEnaPCIeTest.txt
echo "Information: NetAdapter devices will be connected automaticlly after 10 seconds."
timeout /t 10
Get-NetAdapter | ? status -NotMatch up | Enable-NetAdapter >> DisEnaPCIeTest.txt
echo "Information: System is refreshing devices status, please wait...."
timeout /t 10
Get-NetAdapter -Physical >> DisEnaPCIeTest.txt
echo "Information: All the tests have been finished, please check the log of DisEnaPCIeTest.txt."