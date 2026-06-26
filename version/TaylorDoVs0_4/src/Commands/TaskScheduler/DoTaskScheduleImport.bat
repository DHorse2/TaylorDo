@Echo off
@Echo . 
@Echo ------------------------------------------------------
@Echo - Command: DoTaskScheduleImport
@Echo ------------------------------------------------------
@Echo . This will overwrite your current settings with any previous exported tasks.
pause()
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
@Echo Schedule First Run for all drives. 
SchTasks /Create /xml "%PROGRAMFILES%\TaylorDoVs0_4\src\Install\TaylorDo First Run.xml" /tn "\MacroDm\TaylorDo\Defrag\TaylorDo First Run" /ru SYSTEM
@Echo ------------------------------------------------------
@Echo Schedule Yearly for all drives. 
SchTasks /Create /xml "%PROGRAMFILES%\TaylorDoVs0_4\src\Install\TaylorDo All Yearly.xml" /tn "\MacroDm\TaylorDo\Defrag\TaylorDo All Yearly" /ru SYSTEM
@Echo ------------------------------------------------------
@Echo Schedule Monthly for all drives. 
SchTasks /Create /xml "%PROGRAMFILES%\TaylorDoVs0_4\src\Install\TaylorDo All Monthly.xml" /tn "\MacroDm\TaylorDo\Defrag\TaylorDo All Monthly" /ru SYSTEM
@Echo ------------------------------------------------------
@Echo Schedule Weekly for all drives. 
SchTasks /Create /xml "%PROGRAMFILES%\TaylorDoVs0_4\src\Install\TaylorDo All Weekly.xml" /tn "\MacroDm\TaylorDo\Defrag\TaylorDo All Weekly" /ru SYSTEM
@Echo ------------------------------------------------------
@Echo . 
@Echo - End of DoTaskScheduleImport -----------------
@TIMEOUT /T 1 /NOBREAK
pause()