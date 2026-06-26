@Echo off
@Echo . 
@Echo ------------------------------------------------------
@Echo - Command: DoTaskOnDemand
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
@Echo Disable First Run for all drives. 
SchTasks /Change /tn "\MacroDm\TaylorDo\Defrag\TaylorDo First Run"  /DISABLE
@Echo ------------------------------------------------------
@Echo Disable Yearly for all drives. 
SchTasks /Change /tn "\MacroDm\TaylorDo\Defrag\TaylorDo All Yearly"  /DISABLE
@Echo ------------------------------------------------------
@Echo Disable Monthly for all drives. 
SchTasks /Change /tn "\MacroDm\TaylorDo\Defrag\TaylorDo All Monthly"  /DISABLE
@Echo ------------------------------------------------------
@Echo Disable Weekly for all drives. 
SchTasks /Change /tn "\MacroDm\TaylorDo\Defrag\TaylorDo All Weekly"  /DISABLE
@Echo ------------------------------------------------------
@Echo Disable Windows Defrag Schedule.
SchTasks /Change /tn "\Microsoft\Windows\Defrag\ScheduledDefrag" /DISABLE
@Echo ------------------------------------------------------
@Echo . 
@Echo - End of DoTaskOnDemand -----------------
@TIMEOUT /T 1 /NOBREAK
pause()