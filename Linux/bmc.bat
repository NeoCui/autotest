@echo off
rem This bat file is designed to test the BMC function.
rem Created date: 11/8/2016
rem Version: v0.1.0

echo 1 Lenovo System X
echo 2 Lenovo Think Server
ehco 0 Exit Menu
:s1

set /p input=Select the platform, and press "Enter" to confirm:
if "%input%"==1 goto systemx
if "%input%"==2 goto thinkserver
if "%input%"==0 goto exit

:systemx
set /p ip=Please input the BMC ip address:
c:\Users\steel\ipmitool.exe -I lanplus -H %ip% -U USERID -P PASSW0RD bmc info > BMC.txt
pause
c:\Users\steel\ipmitool.exe -H %ip% -I lan -U USERID -P PASSW0RD power off
pause
c:\Users\steel\ipmitool.exe -H %ip% -I lan -U USERID -P PASSW0RD power on
 
:thinkserver 
set /p ip=Please input the BMC ip address:
c:\Users\steel\ipmitool.exe -I lanplus -H %ip% -U lenovo -P len0vO bmc info > BMC.txt
pause
c:\Users\steel\ipmitool.exe -H %ip% -I lan -U lenovo -P len0vO power off
pause
c:\Users\steel\ipmitool.exe -H %ip% -I lan -U lenovo -P len0vO power on
 
:exit
exit
 
