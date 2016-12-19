@echo off & title
echo  +-------------------------------------------------------------------------------------------------+
echo *                                                                                                   *
echo *                              "LENOVO SW-OS Development Testing Team."                             *
                                              Date /t
                                              Time /t
echo *                                                                                                   *
echo  +-------------------------------------------------------------------------------------------------+

rem;; Need to improve points:
rem;; 1. 
rem;; 2. 

:Pre
echo.
echo  +-------------------------------------------------------------------------------------------------+
echo *                                                                                                   *
echo *                     This batch file is apply for Windows vNext_Hyper-v test.                      *
echo *                                                                                                   *
echo *                         System will restart after uninstalling this feature.                        *
echo *                                                                                                   *
echo  +-------------------------------------------------------------------------------------------------+
color 2f
powershell uninstall-windowsfeature hyper-v
timeout /t 10
shutdown -r -t 0
