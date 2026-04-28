@Echo off
@Echo . 
@Echo ------------------------------------------------------
@Echo - Command: DoTaskOnSchedule
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
@Echo Schedule First Run for all drives. 
SchTasks /Change /tn "\MacroDm\TaylorDo\Defrag\TaylorDo First Run"  /ENABLE
@Echo ------------------------------------------------------
@Echo Schedule Yearly for all drives. 
SchTasks /Change /tn "\MacroDm\TaylorDo\Defrag\TaylorDo All Yearly"  /ENABLE
@Echo ------------------------------------------------------
@Echo Schedule Monthly for all drives. 
SchTasks /Change /tn "\MacroDm\TaylorDo\Defrag\TaylorDo All Monthly"  /ENABLE
@Echo ------------------------------------------------------
@Echo Schedule Weekly for all drives. 
SchTasks /Change /tn "\MacroDm\TaylorDo\Defrag\TaylorDo All Weekly"  /ENABLE
@Echo ------------------------------------------------------
@Echo Disable Windows Defrag Schedule.
SchTasks /Change /tn "\Microsoft\Windows\Defrag\ScheduledDefrag" /DISABLE
@Echo ------------------------------------------------------
@Echo . 
@Echo - End of DoTaskOnSchedule -----------------
@TIMEOUT /T 1 /NOBREAK
pause()