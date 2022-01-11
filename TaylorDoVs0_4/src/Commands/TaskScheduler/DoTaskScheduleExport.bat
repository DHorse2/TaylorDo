@Echo off
@Echo . 
@Echo ------------------------------------------------------
@Echo - Command: DoTaskScheduleExport
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
@Echo Schedule First Run for all drives. 
SchTasks /Query /xml /tn "\MacroDm\TaylorDo\Defrag\TaylorDo First Run" > "%PROGRAMFILES%\TaylorDoVs0_4\src\Install\TaylorDo First Run.xml"
@Echo ------------------------------------------------------
@Echo Schedule Yearly for all drives. 
SchTasks /Query /xml /tn "\MacroDm\TaylorDo\Defrag\TaylorDo All Yearly" > "%PROGRAMFILES%\TaylorDoVs0_4\src\Install\TaylorDo All Yearly.xml"
@Echo ------------------------------------------------------
@Echo Schedule Monthly for all drives. 
SchTasks /Query /xml /tn "\MacroDm\TaylorDo\Defrag\TaylorDo All Monthly"  > "%PROGRAMFILES%\TaylorDoVs0_4\src\Install\TaylorDo All Monthly.xml"
@Echo ------------------------------------------------------
@Echo Schedule Weekly for all drives. 
SchTasks /Query /xml /tn "\MacroDm\TaylorDo\Defrag\TaylorDo All Weekly"  > "%PROGRAMFILES%\TaylorDoVs0_4\src\Install\TaylorDo All Weekly.xml"
@Echo ------------------------------------------------------
@Echo Disable Windows Defrag Schedule.
SchTasks /Query /xml /tn "\Microsoft\Windows\Defrag\ScheduledDefrag"  > "%PROGRAMFILES%\TaylorDoVs0_4\src\Install\ScheduledDefrag.xml"
@Echo ------------------------------------------------------
@Echo . 
@Echo - End of DoTaskScheduleExport -----------------
@TIMEOUT /T 1 /NOBREAK
pause()