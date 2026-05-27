@Echo off
@Echo. 
@Echo ------------------------------------------------------
@Echo - Command: DoTaskEnableWindows
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK >nul
@Echo ------------------------------------------------------
@Echo Disable Run Once for all drives. 
SchTasks /Change /TN "\MacroDm\TaylorDo\Defrag\TaylorDo Run Once"  /DISABLE
@Echo ------------------------------------------------------
@Echo Disable Yearly for all drives. 
SchTasks /Change /TN "\MacroDm\TaylorDo\Defrag\TaylorDo Yearly"  /DISABLE
@Echo ------------------------------------------------------
@Echo Disable Monthly for all drives. 
SchTasks /Change /TN "\MacroDm\TaylorDo\Defrag\TaylorDo Monthly"  /DISABLE
@Echo ------------------------------------------------------
@Echo Disable Weekly for all drives. 
SchTasks /Change /TN "\MacroDm\TaylorDo\Defrag\TaylorDo Weekly 2"  /DISABLE
SchTasks /Change /TN "\MacroDm\TaylorDo\Defrag\TaylorDo Weekly 3"  /DISABLE
SchTasks /Change /TN "\MacroDm\TaylorDo\Defrag\TaylorDo Weekly 4"   /DISABLE
@Echo ------------------------------------------------------
@Echo Disable Daily for all drives. 
SchTasks /Change /TN "\MacroDm\TaylorDo\Defrag\TaylorDo Daily"  /DISABLE
@Echo ------------------------------------------------------
@Echo Enable Windows Defrag Schedule.
SchTasks /Change /TN "\Microsoft\Windows\Defrag\ScheduledDefrag" /ENABLE
@Echo ------------------------------------------------------
@Echo. 
@Echo - End of DoTaskEnableWindows -----------------
@TIMEOUT /T 1 /NOBREAK >nul
pause()