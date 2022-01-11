@Echo off
@Echo . 
@Echo ------------------------------------------------------
@Echo - Command: DoTaskDisableWindows
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
@Echo Enable Windows Defrag Schedule.
SchTasks /Change /tn "\Microsoft\Windows\Defrag\ScheduledDefrag" /DISABLE
@Echo ------------------------------------------------------
@Echo . 
@Echo - End of DoTaskDisableWindows -----------------
@TIMEOUT /T 1 /NOBREAK
pause()