@echo off

set TASKDIR=%~dp0

echo Creating First Time Run...
schtasks /create /tn "TaylorDo Daily" /xml "%TASKDIR%TaylorDo Run Once.xml" /f

echo Creating Daily Task...
schtasks /create /tn "TaylorDo Daily" /xml "%TASKDIR%TaylorDo Daily.xml" /f

echo Creating Weekly Task...
schtasks /create /tn "TaylorDo Weekly" /xml "%TASKDIR%TaylorDo Weekly.xml" /f

echo Creating Monthly Task...
schtasks /create /tn "TaylorDo Monthly" /xml "%TASKDIR%TaylorDo Monthly.xml" /f

echo Creating Yearly Task...
schtasks /create /tn "TaylorDo Yearly" /xml "%TASKDIR%TaylorDo Yearly.xml" /f

echo Done.
pause
