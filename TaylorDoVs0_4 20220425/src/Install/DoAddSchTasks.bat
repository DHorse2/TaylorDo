@echo off

set TASKDIR=%~dp0

echo Creating Daily Task...
schtasks /create /tn "TaylorDo Daily" /xml "%TASKDIR%TaylorDo All Daily.xml" /f

echo Creating Weekly Task...
schtasks /create /tn "TaylorDo Weekly" /xml "%TASKDIR%TaylorDo All Weekly.xml" /f

echo Creating Monthly Task...
schtasks /create /tn "TaylorDo Monthly" /xml "%TASKDIR%TaylorDo All Monthly.xml" /f

echo Creating Yearly Task...
schtasks /create /tn "TaylorDo Yearly" /xml "%TASKDIR%TaylorDo All Yearly.xml" /f

echo Done.
pause
