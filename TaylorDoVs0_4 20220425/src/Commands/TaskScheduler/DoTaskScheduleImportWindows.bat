@Echo off
@Echo . 
@Echo ------------------------------------------------------
@Echo - Command: DoTaskScheduleImportWindows
@Echo ------------------------------------------------------
@Echo . This will overwrite your current settings with any previous exported tasks.
pause()
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
@Echo Disable Windows Defrag Schedule.
SchTasks /Create /xml "%PROGRAMFILES%\TaylorDoVs0_4\src\Install\ScheduledDefrag.xml" /tn "\Microsoft\Windows\Defrag\ScheduledDefrag" /ru SYSTEM
@Echo ------------------------------------------------------
@Echo . 
@Echo - End of DoTaskScheduleImportWindows -----------------
@TIMEOUT /T 1 /NOBREAK
pause()