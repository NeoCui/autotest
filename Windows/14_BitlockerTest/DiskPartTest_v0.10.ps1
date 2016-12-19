echo  +-------------------------------------------------------------------------------------------------+
echo *                                                                                                   *
echo *                              "LENOVO SW-OS Development Testing Team."                             *
echo *                                                                                                   *
echo  +-------------------------------------------------------------------------------------------------+
echo  +-------------------------------------------------------------------------------------------------+
echo *                                                                                                   *
echo *                "This batch file is apply for Windows vNext_Create disk partition test."           *
echo *                                                                                                   *
echo *                                                                                                   *
echo  +-------------------------------------------------------------------------------------------------+
echo "System is scanning the disk status, please wait...."
timeout /t 5
Get-disk -Number 0 | ft -AutoSize
echo "Warning: System disk will be executed to partition after 15 seconds.Press 'Esc' to exit."
timeout /t 15
Resize-Partition -DiskNumber 0 -PartitionNumber 2 -Size (100GB)
New-Partition -DiskNumber 0 -UseMaximumSize -AssignDriveLetter
Format-Volume -DriveLetter e
Get-Partition -DiskNumber 0 | ft -AutoSize
Resize-Partition -DiskNumber 0 -PartitionNumber 3 -Size (10GB)
New-Partition -DiskNumber 0 -UseMaximumSize -AssignDriveLetter
Format-Volume -DriveLetter f
Get-Partition -DiskNumber 0 | ft -AutoSize
