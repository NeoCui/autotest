echo  +-------------------------------------------------------------------------------------------------+
echo *                                                                                                   *
echo *                              "LENOVO SW-OS Development Testing Team."                             *
echo *                                                                                                   *
echo  +-------------------------------------------------------------------------------------------------+
echo  +-------------------------------------------------------------------------------------------------+
echo *                                                                                                   *
echo *                "This batch file is apply for Windows vNext_Check System EventLog test."           *
echo *                                                                                                   *
echo *                     "Please plug in a removable device to save the output log."                  *
echo *                                                                                                   *
echo  +-------------------------------------------------------------------------------------------------+
timeout /t 10
echo "Information: System is checking the eventlog, please wait...."
Get-EventLog -List > Eventlog.txt
echo "Information: System eventlog will be output after 5 seconds."
timeout /t 5
Get-Eventlog -LogName system -EntryType error | ft eventid,entrytype,category,source,message -AutoSize >> Eventlog.txt
echo "Information: Windows log will be output after 5 seconds."
timeout /t 5
Get-WinEvent -LogName system | Where-Object {$_.leveldisplayname -eq "Critical" -or $_.leveldisplayname -eq "Error"} | Select-Object ProviderName,TimeCreated,ID,LevelDisplayName,Message > Winlog.txt
echo "Information: All the tests have been finished, please copy log files(Eventlog.txt and Winlog.txt) to your removable device."