@Echo off
@Echo . 
@Echo ------------------------------------------------------
@Echo - Command: DoTaskScheduleInstall
@Echo ------------------------------------------------------
@Echo . This will overwrite your current settings with the defaults.
pause()
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
@Echo Schedule First Run for all drives. 
SchTasks /Create /tn "\MacroDm\TaylorDo\Defrag\TaylorDo First Run" /tr "%PROGRAMFILES%\MyDefrag v4.3.1\Scripts\ScriptsAutomatic\YearlyAutomatic.bat" /sc Once /st 19:00 /du 1:00 /sd 2021/01/01 /f /rl Highest /ru SYSTEM 
@Echo ------------------------------------------------------
@Echo Schedule Yearly for all drives. 
SchTasks /Create /tn "\MacroDm\TaylorDo\Defrag\TaylorDo All Yearly" /tr "%PROGRAMFILES%\MyDefrag v4.3.1\Scripts\ScriptsAutomatic\YearlyAutomatic.bat" /sc Monthly /m Jan /d 7 /st 19:00 /du 1:00 /sd 2021/01/01 /f /rl Highest /ru SYSTEM 
@Echo ------------------------------------------------------
@Echo Schedule Monthly for all drives. 
SchTasks /Create /tn "\MacroDm\TaylorDo\Defrag\TaylorDo All Monthly" /tr "%PROGRAMFILES%\MyDefrag v4.3.1\Scripts\ScriptsAutomatic\MonthlyAutomatic.bat" /sc Monthly /m Feb,Mar,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec /d 7 /st 19:00 /du 1:00 /sd 2021/01/01 /f /rl Highest /ru SYSTEM 
@Echo ------------------------------------------------------
@Echo Schedule Weekly for all drives. 
SchTasks /Create /tn "\MacroDm\TaylorDo\Defrag\TaylorDo All Weekly" /tr "%PROGRAMFILES%\MyDefrag v4.3.1\Scripts\ScriptsAutomatic\WeeklyAutomatic.bat" /sc Weekly /d FRI /st 19:00 /du 1:00 /sd 2021/01/01 /f /rl Highest /ru SYSTEM 
@Rem SchTasks /Create /tn "\MacroDm\TaylorDo\Defrag\TaylorDo All Weekly" /tr "%PROGRAMFILES%\MyDefrag v4.3.1\Scripts\ScriptsAutomatic\WeeklyAutomatic.bat" /sc Monthly /m Jan,Feb,Mar,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec /d 21 /st 19:00 /du 1:00 /sd 2021/01/01 /f /rl Highest /ru SYSTEM 
@Rem SchTasks /Create /tn "\MacroDm\TaylorDo\Defrag\TaylorDo All Weekly" /tr "%PROGRAMFILES%\MyDefrag v4.3.1\Scripts\ScriptsAutomatic\WeeklyAutomatic.bat" /sc Monthly /m Jan,Feb,Mar,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec /d 14,21,28 /st 19:00 /du 144:00 /sd 2021/01/01 /f /rl Highest /ru SYSTEM 
@Echo ------------------------------------------------------
@Echo Disable Windows Defrag Schedule.
SchTasks /Change /tn "\Microsoft\Windows\Defrag\ScheduledDefrag" /DISABLE
@Echo ------------------------------------------------------
@Echo . 
@Echo - End of DoTaskScheduleInstall -----------------
@TIMEOUT /T 1 /NOBREAK
pause()