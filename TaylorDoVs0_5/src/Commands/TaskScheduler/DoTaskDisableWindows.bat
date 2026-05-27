@Echo off
@Echo. 
@Echo ------------------------------------------------------
@Echo - Command: DoTaskENABLEWindows
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK >nul
@Echo ------------------------------------------------------
@Echo ENABLE Run Once for all drives. 
SchTasks /Change /TN "\MacroDm\TaylorDo\Defrag\TaylorDo Run Once"  /ENABLE
@Echo ------------------------------------------------------
@Echo ENABLE Yearly for all drives. 
SchTasks /Change /TN "\MacroDm\TaylorDo\Defrag\TaylorDo Yearly"  /ENABLE
@Echo ------------------------------------------------------
@Echo ENABLE Monthly for all drives. 
SchTasks /Change /TN "\MacroDm\TaylorDo\Defrag\TaylorDo Monthly"  /ENABLE
@Echo ------------------------------------------------------
@Echo ENABLE Weekly for all drives. 
SchTasks /Change /TN "\MacroDm\TaylorDo\Defrag\TaylorDo Weekly 2"  /ENABLE
SchTasks /Change /TN "\MacroDm\TaylorDo\Defrag\TaylorDo Weekly 3"  /ENABLE
SchTasks /Change /TN "\MacroDm\TaylorDo\Defrag\TaylorDo Weekly 4"   /ENABLE
@Echo ------------------------------------------------------
@Echo ENABLE Daily for all drives. 
SchTasks /Change /TN "\MacroDm\TaylorDo\Defrag\TaylorDo Daily"  /DISABLE
@Echo ------------------------------------------------------
@Echo Enable Windows Defrag Schedule.
SchTasks /Change /tn "\Microsoft\Windows\Defrag\ScheduledDefrag" /DISABLE
@Echo ------------------------------------------------------
@Echo. 
@Echo - End of DoTaskENABLEWindows -----------------
@TIMEOUT /T 1 /NOBREAK >nul
pause()