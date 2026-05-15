@Echo off
@Echo . 
@Echo ------------------------------------------------------
@Echo - Command: DoTaskScheduleExport
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
@Echo Schedule Run Once for all drives. 
SchTasks /Query /xml /tn "\MacroDm\TaylorDo\Defrag\TaylorDo Run Once" > "%PROGRAMFILES%\TaylorDo\Commands\Install\TaylorDo Run Once.xml"
@Echo ------------------------------------------------------
@Echo Schedule Yearly for all drives. 
SchTasks /Query /xml /tn "\MacroDm\TaylorDo\Defrag\TaylorDo Yearly" > "%PROGRAMFILES%\TaylorDo\Commands\Install\TaylorDo Yearly.xml"
@Echo ------------------------------------------------------
@Echo Schedule Monthly for all drives. 
SchTasks /Query /xml /tn "\MacroDm\TaylorDo\Defrag\TaylorDo Monthly"  > "%PROGRAMFILES%\TaylorDo\Commands\Install\TaylorDo Monthly.xml"
@Echo ------------------------------------------------------
@Echo Schedule Weekly for all drives. 
SchTasks /Query /xml /tn "\MacroDm\TaylorDo\Defrag\TaylorDo Weekly 2"  > "%PROGRAMFILES%\TaylorDo\Commands\Install\TaylorDo Weekly 2.xml"
SchTasks /Query /xml /tn "\MacroDm\TaylorDo\Defrag\TaylorDo Weekly 3"  > "%PROGRAMFILES%\TaylorDo\Commands\Install\TaylorDo Weekly 3.xml"
SchTasks /Query /xml /tn "\MacroDm\TaylorDo\Defrag\TaylorDo Weekly 4"  > "%PROGRAMFILES%\TaylorDo\Commands\Install\TaylorDo Weekly 4.xml"
@Echo ------------------------------------------------------
@Echo Schedule Daily for all drives. 
SchTasks /Query /xml /tn "\MacroDm\TaylorDo\Defrag\TaylorDo Weekly"  > "%PROGRAMFILES%\TaylorDo\Commands\Install\TaylorDo Daily.xml"
@Echo ------------------------------------------------------
@Echo Disable Windows Defrag Schedule.
SchTasks /Query /xml /tn "\Microsoft\Windows\Defrag\ScheduledDefrag"  > "%PROGRAMFILES%\TaylorDo\Commands\Install\ScheduledDefrag.xml"
@Echo ------------------------------------------------------
@Echo . 
@Echo - End of DoTaskScheduleExport -----------------
@TIMEOUT /T 1 /NOBREAK
pause()