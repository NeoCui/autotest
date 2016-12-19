@echo off & title
echo  +-------------------------------------------------------------------------------------------------+
echo.*                                                                                                   *
echo.*                              "LENOVO SW-OS Development Testing Team."                             *
                                              Date /t
                                              Time /t
echo.*                                                                                                   *
echo  +-------------------------------------------------------------------------------------------------+

rem;; Need to improve points:
rem;; 1. How to continue to manage bitlocker after restart?
rem;; 2. 

:Begin
echo This batch file is apply for Windows vNext_Install Bitlocker test.
echo.
echo  +-------------------------------------------------------------------------------------------------------------+
echo.*                                                                                                               *
echo.*                                               Read first......                                                *                                                 
echo.*                                                                                                               *
echo.*                 Please make sure the status of TPM is Enable or Active in BIOS before starting.               *
echo.*                             System will restart after installing this feature.                                *
echo.*                                                                                                               *
echo  +-------------------------------------------------------------------------------------------------------------+
color 2f
powershell install-windowsfeature bitlocker -restart
pause

