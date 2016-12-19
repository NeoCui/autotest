@echo off & title
echo  +-------------------------------------------------------------------------------------------------+
echo *                                                                                                   *
echo *                              "LENOVO SW-OS Development Testing Team."                             *
                                              Date /t
                                              Time /t
echo *                                                                                                   *
echo  +-------------------------------------------------------------------------------------------------+

rem;; Need to improve points:
rem;; 1. How to re-install GUI feature automatically after restart?
rem;; 2. How to merge unins/install GUI feature by one batch?

:Begin
echo.
echo  +-------------------------------------------------------------------------------------------------+
echo *                                                                                                   *
echo *                     This batch file is apply for Windows vNext_Install GUI test.                *
echo *                                                                                                   *
echo *                         System will restart after performing this step.                           *
echo *                                                                                                   *
echo  +-------------------------------------------------------------------------------------------------+
echo.
color 2f
echo                  "Warning: System will be carried out this script after 15 seconds."
echo.
timeout /t 15
powershell get-windowsimage -imagepath d:\sources\install.wim >InsGUI.txt
powershell install-windowsfeature server-gui-mgmt-infra, server-gui-shell -restart >>InsGUI.txt
pause
exit

