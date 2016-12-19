@echo off & title
echo  +-------------------------------------------------------------------------------------------------+
echo.*                                                                                                   *
echo.*                              "LENOVO SW-OS Development Testing Team."                             *
                                              Date /t
                                              Time /t
echo.*                                                                                                   *
echo  +-------------------------------------------------------------------------------------------------+

rem;; Need to improve points:
rem;; 1. How to create a primary partition except C?
rem;; 2. 

:Pre-start
echo. This batch file is apply for Windows vNext_Manage Bitlocker test.
echo.
echo  +-------------------------------------------------------------------------------------------------------------+
echo.*                                                                                                               *
echo.*                                               Read first......                                                *                                                 
echo.*                                                                                                               *
echo.*                 Please make sure the status of TPM is Enable or Active in BIOS before starting.               *
echo.*                                                                                                               *
echo.*           ~~~~~~Please make sure create a Primary partition except C disk before starting.~~~~~~              *
echo.*                                                                                                               *
echo.*         ........Please plug in a removable device(such as, U disk) in order to save recovery Key.........     *
echo.*                                                                                                               *
echo  +-------------------------------------------------------------------------------------------------------------+
color 2f
pause
goto ScanPartition


:ScanPartition
echo "System will scan and back which partition is on your local hard disk firstly, please wait......"
echo.
set str=c d e f g h i j k l m n o p q r s t u v w x y z
echo The current disk partition as follows:
for %%i in (%str%) do if exist %%i: echo %%i:
goto begin

:begin
echo Warning: Please plug in a removable U disk and press any key to continue......
echo.
echo  +-----------------------------------------------------------------------------------------------------------------------------------------+
echo.*                                                                                                                                           *
echo.*  Which one do you want to apply this processing to disk partition? Please input the letter to continue. For example, C, D, "0" to exit.   *
echo.*                                                                                                                                           *
echo  +-----------------------------------------------------------------------------------------------------------------------------------------+ 
set /p ans=
if /i "%ans%"=="C" (goto S0)
if /i "%ans%"=="D" (goto S1)
if /i "%ans%"=="E" (goto S2)
if /i "%ans%"=="F" (goto S3)
if /i "%ans%"=="Esc" (goto S4)

:S0
echo  +-----------------------------------------------------------------------------------------------------------------------------------------+
echo.*                                                                                                                                           *
echo.*                                  System is checking the status of C disk, please wait......                                               *
echo.*                                                                                                                                           *
echo  +-----------------------------------------------------------------------------------------------------------------------------------------+ 
manage-bde -status c: >> c.txt
echo.
echo C disk encryption has been completed, please copy and save the recovery Key to removable device.
manage-bde -on c: -recoverypassword >> c.txt
echo.
pause
goto begin

:S1
echo  +-----------------------------------------------------------------------------------------------------------------------------------------+
echo.*                                                                                                                                           *
echo.*                                  System is checking the status of D disk, please wait......                                               *
echo.*                                                                                                                                           *
echo  +-----------------------------------------------------------------------------------------------------------------------------------------+ 
manage-bde -status d: >> d.txt
echo.
echo D disk encryption has been completed, please copy and save the recovery Key to removable device.
manage-bde -on d: -recoverypassword >> d.txt
echo.
pause
goto begin

:S2
echo  +-----------------------------------------------------------------------------------------------------------------------------------------+
echo.*                                                                                                                                           *
echo.*                                  System is checking the status of E disk, please wait......                                               *
echo.*                                                                                                                                           *
echo  +-----------------------------------------------------------------------------------------------------------------------------------------+ 
manage-bde -status e: >> e.txt
echo.
echo E disk encryption has been completed, please copy and save the recovery Key to removable device.
manage-bde -on e: -recoverypassword >> e.txt
echo.
pause
goto begin

:S3
echo  +-----------------------------------------------------------------------------------------------------------------------------------------+
echo.*                                                                                                                                           *
echo.*                                  System is checking the status of F disk, please wait......                                               *
echo.*                                                                                                                                           *
echo  +-----------------------------------------------------------------------------------------------------------------------------------------+ 
manage-bde -status f: >> f.txt
echo.
echo F disk encryption has been completed, please copy and save your recovery Key to removable device.
manage-bde -on f: -recoverypassword >> f.txt
echo.
pause
goto begin

:S4
exit

