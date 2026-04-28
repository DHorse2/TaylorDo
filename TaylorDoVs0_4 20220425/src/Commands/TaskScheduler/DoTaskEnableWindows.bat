@Echo off
@Echo . 
@Echo ------------------------------------------------------
@Echo - Command: DoTaskEnableWindows
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
@Echo Disable First Run for all drives. 
SchTasks /Change /TN "\MacroDm\TaylorDo\Defrag\TaylorDo First Run"  /DISABLE
@Echo ------------------------------------------------------
@Echo Disable Yearly for all drives. 
SchTasks /Change /TN "\MacroDm\TaylorDo\Defrag\TaylorDo All Yearly"  /DISABLE
@Echo ------------------------------------------------------
@Echo Disable Monthly for all drives. 
SchTasks /Change /TN "\MacroDm\TaylorDo\Defrag\TaylorDo All Monthly"  /DISABLE
@Echo ------------------------------------------------------
@Echo Disable Weekly for all drives. 
SchTasks /Change /TN "\MacroDm\TaylorDo\Defrag\TaylorDo All Weekly"  /DISABLE
@Echo ------------------------------------------------------
@Echo Enable Windows Defrag Schedule.
SchTasks /Change /TN "\Microsoft\Windows\Defrag\ScheduledDefrag" /ENABLE
@Echo ------------------------------------------------------
@Echo . 
@Echo - End of DoTaskEnableWindows -----------------
@TIMEOUT /T 1 /NOBREAK
pause()