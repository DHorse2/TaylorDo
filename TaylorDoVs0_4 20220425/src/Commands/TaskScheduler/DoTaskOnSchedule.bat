@Echo off
@Echo . 
@Echo ------------------------------------------------------
@Echo - Command: DoTaskOnSchedule
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
@Echo Schedule Run Once for all drives. 
SchTasks /Change /tn "\MacroDm\TaylorDo\Defrag\TaylorDo Run Once"  /ENABLE
@Echo ------------------------------------------------------
@Echo Schedule Yearly for all drives. 
SchTasks /Change /tn "\MacroDm\TaylorDo\Defrag\TaylorDo Yearly"  /ENABLE
@Echo ------------------------------------------------------
@Echo Schedule Monthly for all drives. 
SchTasks /Change /tn "\MacroDm\TaylorDo\Defrag\TaylorDo Monthly"  /ENABLE
@Echo ------------------------------------------------------
@Echo Schedule Weekly for all drives. 
SchTasks /Change /tn "\MacroDm\TaylorDo\Defrag\TaylorDo Weekly"  /ENABLE
@Echo ------------------------------------------------------
@Echo Schedule Daily for all drives. 
SchTasks /Change /tn "\MacroDm\TaylorDo\Defrag\TaylorDo Daily"  /ENABLE
@Echo ------------------------------------------------------
@Echo Disable Windows Defrag Schedule.
SchTasks /Change /tn "\Microsoft\Windows\Defrag\ScheduledDefrag" /DISABLE
@Echo ------------------------------------------------------
@Echo . 
@Echo - End of DoTaskOnSchedule -----------------
@TIMEOUT /T 1 /NOBREAK
pause()