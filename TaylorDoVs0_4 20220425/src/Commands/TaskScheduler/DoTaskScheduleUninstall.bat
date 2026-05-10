@Echo off
@Echo . 
@Echo ------------------------------------------------------
@Echo - Command: DoTaskScheduleUninstall
@Echo ------------------------------------------------------
@Echo . This will completely remove TaylorDo from the Task Scheduler
pause()
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
@Echo Schedule Run Once for all drives. 
SchTasks /Delete /tn "\MacroDm\TaylorDo\Defrag\TaylorDo Run Once" /f
@Echo ------------------------------------------------------
@Echo Schedule Yearly for all drives. 
SchTasks /Delete /tn "\MacroDm\TaylorDo\Defrag\TaylorDo Yearly" /f
@Echo ------------------------------------------------------
@Echo Schedule Monthly for all drives. 
SchTasks /Delete /tn "\MacroDm\TaylorDo\Defrag\TaylorDo Monthly" /f
@Echo ------------------------------------------------------
@Echo Schedule Weekly for all drives. 
SchTasks /Delete /tn "\MacroDm\TaylorDo\Defrag\TaylorDo Weekly 2" /f
SchTasks /Delete /tn "\MacroDm\TaylorDo\Defrag\TaylorDo Weekly 3" /f
SchTasks /Delete /tn "\MacroDm\TaylorDo\Defrag\TaylorDo Weekly 4" /f
@Echo ------------------------------------------------------
@Echo Schedule Daily for all drives. 
SchTasks /Delete /tn "\MacroDm\TaylorDo\Defrag\TaylorDo Daily" /f
@Echo ------------------------------------------------------
@Echo Remove MyDefrag Task Scheduler Items. 
SchTasks /Delete /tn "\MyDefrag v4.3.1 Daily" /f
SchTasks /Delete /tn "\MyDefrag v4.3.1 Monthly" /f
@Echo ------------------------------------------------------
@Echo Disable Windows Defrag Schedule.
SchTasks /Change /tn "\Microsoft\Windows\Defrag\ScheduledDefrag" /ENABLE
@Echo ------------------------------------------------------
@Echo . 
@Echo - End of DoTaskScheduleUninstall -----------------
@TIMEOUT /T 1 /NOBREAK
pause
