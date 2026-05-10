@Echo off
@Echo . 
@Echo ------------------------------------------------------
@Echo - Command: DoTaskScheduleInstall
@Echo ------------------------------------------------------
@Echo . This will overwrite your current settings with the defaults.
pause()
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
@Echo Schedule Run Once for all drives. 
SchTasks /Create /tn "\MacroDm\TaylorDo\Defrag\TaylorDo Run Once" /tr "%PROGRAMFILES%\MyDefrag v4.3.1\Scripts\ScriptsAutomatic\YearlyAutomatic.bat" /sc ONCE /st 23:00 /et 23:59 /sd %DATE% /f /rl Highest /ru SYSTEM /Z
@Echo ------------------------------------------------------
@Echo Schedule Yearly for all drives. 
SchTasks /Create /tn "\MacroDm\TaylorDo\Defrag\TaylorDo Yearly" /tr "%PROGRAMFILES%\MyDefrag v4.3.1\Scripts\ScriptsAutomatic\YearlyAutomatic.bat" /sc MONTHLY /m JAN /d 7 /st 19:00 /du 1:00 /sd 2021/01/01 /f /rl Highest /ru SYSTEM
@Echo ------------------------------------------------------
@Echo Schedule Monthly for all drives. 
SchTasks /Create /tn "\MacroDm\TaylorDo\Defrag\TaylorDo Monthly" /tr "%PROGRAMFILES%\MyDefrag v4.3.1\Scripts\ScriptsAutomatic\MonthlyAutomatic.bat" /sc MONTHLY /d SUN /mo FIRST /m FEB,MAR,APR,MAY,JUN,JUL,AUG,SEP,OCT,NOV,DEC /st 19:00 /du 1:00 /sd 2021/01/01 /f /rl Highest /ru SYSTEM
@Echo ------------------------------------------------------
@Echo Schedule Weekly for all drives. 
SchTasks /Create /tn "\MacroDm\TaylorDo\Defrag\TaylorDo Weekly 2" /tr "%PROGRAMFILES%\MyDefrag v4.3.1\Scripts\ScriptsAutomatic\WeeklyAutomatic.bat" /sc MONTHLY /d SUN /mo SECOND /st 19:00 /du 1:00 /sd 2021/01/01 /f /rl Highest /ru SYSTEM
SchTasks /Create /tn "\MacroDm\TaylorDo\Defrag\TaylorDo Weekly 3" /tr "%PROGRAMFILES%\MyDefrag v4.3.1\Scripts\ScriptsAutomatic\WeeklyAutomatic.bat" /sc MONTHLY /d SUN /mo THIRD /st 19:00 /du 1:00 /sd 2021/01/01 /f /rl Highest /ru SYSTEM
SchTasks /Create /tn "\MacroDm\TaylorDo\Defrag\TaylorDo Weekly 4" /tr "%PROGRAMFILES%\MyDefrag v4.3.1\Scripts\ScriptsAutomatic\WeeklyAutomatic.bat" /sc MONTHLY /d SUN /mo FOURTH /st 19:00 /du 1:00 /sd 2021/01/01 /f /rl Highest /ru SYSTEM
@Echo ------------------------------------------------------
@Echo Schedule Daily for all drives. 
@REM /d 1-6,8-13,15-20,22-26,28-31 
SchTasks /Create /tn "\MacroDm\TaylorDo\Defrag\TaylorDo Daily" /tr "%PROGRAMFILES%\MyDefrag v4.3.1\Scripts\ScriptsAutomatic\DailyAutomatic.bat" /sc WEEKLY /d MON,TUE,WED,THU,FRI,SAT /st 19:00 /du 1:00 /sd 2021/01/01 /f /rl Highest /ru SYSTEM
@REM SchTasks /Create /tn "\MacroDm\TaylorDo\Defrag\TaylorDo Daily" /tr "%PROGRAMFILES%\MyDefrag v4.3.1\Scripts\ScriptsAutomatic\DailyAutomatic.bat" /sc MONTHLY /mo 1 /d 1,2,3,4,5,6,8,9,10,11,12,13,15,16,17,18,19,20,22,23,24,25,26,28,29,30,31 /st 19:00 /du 1:00 /sd 2021/01/01 /f /rl Highest /ru SYSTEM
@Echo ------------------------------------------------------
@Echo Remove MyDefrag Task Scheduler Items. 
SchTasks /Delete /tn "\MyDefrag v4.3.1 Daily" /f
SchTasks /Delete /tn "\MyDefrag v4.3.1 Monthly" /f
@Echo ------------------------------------------------------
@Echo Disable Windows Defrag Schedule.
SchTasks /Change /tn "\Microsoft\Windows\Defrag\ScheduledDefrag" /DISABLE
@Echo ------------------------------------------------------
@Echo . 
@Echo - End of DoTaskScheduleInstall -----------------
@TIMEOUT /T 1 /NOBREAK
pause()