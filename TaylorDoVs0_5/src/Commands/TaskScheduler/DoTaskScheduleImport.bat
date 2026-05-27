@Echo off
@Echo. 
@Echo ------------------------------------------------------
@Echo - Command: DoTaskScheduleImport
@Echo ------------------------------------------------------
@Echo. This will overwrite your current settings with any previous exported tasks.
pause()
@TIMEOUT /T 1 /NOBREAK >nul
@Echo ------------------------------------------------------
@Echo Schedule Run Once for all drives. 
SchTasks /Create /xml "%PROGRAMFILES%\TaylorDo\Commands\Install\TaylorDo Run Once.xml" /tn "\MacroDm\TaylorDo\Defrag\TaylorDo Run Once" /ru SYSTEM
@Echo ------------------------------------------------------
@Echo Schedule Yearly for all drives. 
SchTasks /Create /xml "%PROGRAMFILES%\TaylorDo\Commands\Install\TaylorDo Yearly.xml" /tn "\MacroDm\TaylorDo\Defrag\TaylorDo Yearly" /ru SYSTEM
@Echo ------------------------------------------------------
@Echo Schedule Monthly for all drives. 
SchTasks /Create /xml "%PROGRAMFILES%\TaylorDo\Commands\Install\TaylorDo Monthly.xml" /tn "\MacroDm\TaylorDo\Defrag\TaylorDo Monthly" /ru SYSTEM
@Echo ------------------------------------------------------
@Echo Schedule Weekly for all drives. 
SchTasks /Create /xml "%PROGRAMFILES%\TaylorDo\Commands\Install\TaylorDo Weekly.xml" /tn "\MacroDm\TaylorDo\Defrag\TaylorDo Weekly" /ru SYSTEM
@Echo ------------------------------------------------------
@Echo Schedule Daily for all drives. 
SchTasks /Create /xml "%PROGRAMFILES%\TaylorDo\Commands\Install\TaylorDo Weekly.xml" /tn "\MacroDm\TaylorDo\Defrag\TaylorDo Daily" /ru SYSTEM
@Echo ------------------------------------------------------
@Echo. 
@Echo - End of DoTaskScheduleImport -----------------
@TIMEOUT /T 1 /NOBREAK >nul
pause()