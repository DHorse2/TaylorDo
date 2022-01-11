@Echo off
@Echo . 
@Echo ------------------------------------------------------
@Echo - Command: DoTaskScheduleUninstall
@Echo ------------------------------------------------------
@Echo . This will completely remove TaylorDo from the Task Scheduler
pause()
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
@Echo Schedule First Run for all drives. 
SchTasks /Delete /tn "\MacroDm\TaylorDo\Defrag\TaylorDo First Run" /f
@Echo ------------------------------------------------------
@Echo Schedule Yearly for all drives. 
SchTasks /Delete /tn "\MacroDm\TaylorDo\Defrag\TaylorDo All Yearly" /f
@Echo ------------------------------------------------------
@Echo Schedule Monthly for all drives. 
SchTasks /Delete /tn "\MacroDm\TaylorDo\Defrag\TaylorDo All Monthly" /f
@Echo ------------------------------------------------------
@Echo Schedule Weekly for all drives. 
SchTasks /Delete /tn "\MacroDm\TaylorDo\Defrag\TaylorDo All Weekly" /f
@Echo ------------------------------------------------------
@Echo Clean up folders. 
SchTasks /Delete /tn "\MacroDm\TaylorDo\Defrag" /f
SchTasks /Delete /tn "\MacroDm\TaylorDo" /f
SchTasks /Delete /tn "\MacroDm" /f
@Echo ------------------------------------------------------
@Echo Disable Windows Defrag Schedule.
SchTasks /Change /tn "\Microsoft\Windows\Defrag\ScheduledDefrag" /ENABLE
@Echo ------------------------------------------------------
@Echo . 
@Echo - End of DoTaskScheduleUninstall -----------------
@TIMEOUT /T 1 /NOBREAK
