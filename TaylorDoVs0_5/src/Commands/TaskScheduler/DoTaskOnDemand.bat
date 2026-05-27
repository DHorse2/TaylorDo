@Echo off
@Echo. 
@Echo ------------------------------------------------------
@Echo - Command: DoTaskOnDemand
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK >nul
@Echo ------------------------------------------------------
@Echo Disable Run Once for all drives. 
SchTasks /Change /tn "\MacroDm\TaylorDo\Defrag\TaylorDo Run Once"  /DISABLE
@Echo ------------------------------------------------------
@Echo Disable Yearly for all drives. 
SchTasks /Change /tn "\MacroDm\TaylorDo\Defrag\TaylorDo Yearly"  /DISABLE
@Echo ------------------------------------------------------
@Echo Disable Monthly for all drives. 
SchTasks /Change /tn "\MacroDm\TaylorDo\Defrag\TaylorDo Monthly"  /DISABLE
@Echo ------------------------------------------------------
@Echo Disable Weekly for all drives. 
SchTasks /Change /tn "\MacroDm\TaylorDo\Defrag\TaylorDo Weekly"  /DISABLE
@Echo ------------------------------------------------------
@Echo Disable Daily for all drives. 
SchTasks /Change /tn "\MacroDm\TaylorDo\Defrag\TaylorDo Daily"  /DISABLE
@Echo ------------------------------------------------------
@Echo Disable Windows Defrag Schedule.
SchTasks /Change /tn "\Microsoft\Windows\Defrag\ScheduledDefrag" /DISABLE
@Echo ------------------------------------------------------
@Echo. 
@Echo - End of DoTaskOnDemand -----------------
@TIMEOUT /T 1 /NOBREAK >nul
pause()