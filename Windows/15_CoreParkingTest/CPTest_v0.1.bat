@echo off & title
echo  +-------------------------------------------------------------------------------------------------+
echo *                                                                                                   *
echo *                              "LENOVO SW-OS Development Testing Team."                             *
                                              Date /t
                                              Time /t
echo *                                                                                                   *
echo  +-------------------------------------------------------------------------------------------------+

:Begin
rem;; This batch file is apply for Windows vNext_Coreparking test.
color 2f
resmon
echo.
echo "Information: You will get the coreparking result of 50 percent after 15 seconds, please wait..."
timeout /t 15
echo.
powercfg -setacvalueindex scheme_current sub_processor 0cc5b647-c1df-4637-891a-dec35c318583 50
powercfg -setactive scheme_current
goto S1

:S1
echo.
echo "Information: You will get the coreparking result of 80 percent after 10 seconds, please wait..."
timeout /t 10
echo.
powercfg -setacvalueindex scheme_current sub_processor 0cc5b647-c1df-4637-891a-dec35c318583 80
powercfg -setactive scheme_current
goto S2

:S2
echo.
echo "Information: You will get the coreparking result of 100 percent after 10 seconds, please wait..."
timeout /t 10
echo.
powercfg -setacvalueindex scheme_current sub_processor 0cc5b647-c1df-4637-891a-dec35c318583 100
powercfg -setactive scheme_current
goto S3

:S3
echo.
echo "Information: You will get the coreparking result of 0 percent after 10 seconds, please wait..."
timeout /t 10
echo.
powercfg -setacvalueindex scheme_current sub_processor 0cc5b647-c1df-4637-891a-dec35c318583 0
powercfg -setactive scheme_current
goto S4

:S4
echo.
echo "Information: You will get the coreparking result of 90 percent after 10 seconds, please wait..."
timeout /t 10
echo.
powercfg -setacvalueindex scheme_current sub_processor 0cc5b647-c1df-4637-891a-dec35c318583 90
powercfg -setactive scheme_current
goto S5

:S5
echo.
echo "Information: You will get the coreparking result of 60 percent after 10 seconds, please wait..."
timeout /t 10
echo.
powercfg -setacvalueindex scheme_current sub_processor 0cc5b647-c1df-4637-891a-dec35c318583 60
powercfg -setactive scheme_current
goto S6

:S6
echo.
echo "Information: You will get the coreparking result of 20 percent after 10 seconds, please wait..."
timeout /t 10
echo.
powercfg -setacvalueindex scheme_current sub_processor 0cc5b647-c1df-4637-891a-dec35c318583 20
powercfg -setactive scheme_current
goto S7

:S7
echo.
echo "Information: You will get the coreparking result of 100 percent after 10 seconds, please wait..."
timeout /t 10
echo.
powercfg -setacvalueindex scheme_current sub_processor 0cc5b647-c1df-4637-891a-dec35c318583 100
powercfg -setactive scheme_current
goto S0

:S0
echo "Do you want to end of this processing? Please press "y" or "n"."
set /p ans=
if /i "%ans%"=="y" (goto a) else (goto begin)

:a
taskkill /f /t /im perfmon.exe
exit

