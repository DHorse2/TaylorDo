@Rem
@Rem
@Rem Syntax: COPYSRC SourcePath DestionationPath DayWeek FileGroup Option
@Rem where options = d(elete contents)
@Rem
@Echo ...Backup from %1 to %2\%3\%4 with options: %5
@Echo .
@REM PAUSE
@Rem @Rem
@Rem @If exist %2\%3\%4\True.Flg      GoTo :SKELTONEXISTS
@Rem @Rem
@Rem @Echo . Skelton Directories do not exist, creating all...
@Rem @Echo .
@Rem @Call C:\Bat\Win98\CrDirSrc
@Rem @Rem
@Rem @Echo . Skelton Directories Created for %2\%3\%4
@Rem @Echo .
@Rem @REM PAUSE
:SKELTONEXISTS
@Rem
@If exist %2\%3\True.Flg      GoTo :DIREXISTS
@Rem
@Echo . Destination Directory does not exist, 
@Choice /c:YN Ary you sure this is correct 
@If errorlevel 2     GoTo RUNCANCEL
@If errorlevel 1     GoTo RUNOK
@Echo .
@Echo . Enter Y or N to confirm
@Echo .
@GoTo SKELTONEXISTS
:RUNOK
@Echo . Destination Directory does not exist, creating...
@Echo .
@If not exist %2\True.Flg         MD %2
@If not exist %2\True.Flg         Copy C:\Bat\Win98\True.Flg %2
@If not exist %2\%3\True.Flg      MD %2\%3
@If not exist %2\%3\True.Flg      Copy C:\Bat\Win98\True.Flg %2\%3
@If not exist %2\%3\%4\True.Flg   MD %2\%3\%4
@If not exist %2\%3\%4\True.Flg   Copy C:\Bat\Win98\True.Flg %2\%3\%4
@Rem
@Echo . Destination Directories Created for %2\%3\%4
@Echo .
@REM PAUSE
:DIREXISTS
@Rem
@If %5==d      GoTo :DIRDELALL
@If %5==D      GoTo :DIRDELALL
@Echo . Existing files not deleted...
@Echo .
@GoTo :SKIPDIRDELALL
@Rem
:DIRDELALL
@Rem
@Echo . Deleting all files in directory %2\%3\%4
@Echo .
DELTREE /Y %2\%3\%4
@Echo .
Md %2\%3\%4
@Echo .
Copy C:\Bat\Win98\True.Flg %2\%3\%4
@Echo .
@Echo . Files deleted
@Echo .
@REM PAUSE
@Rem
:SKIPDIRDELALL
@Rem
@Rem
@Echo .
@Echo . Copying files...
@Echo .
@Echo . XCOPY %1 %2\%3\%4 /E /C /H /K /I /Y
@Echo .
@REM PAUSE
XCOPY %1 %2\%3\%4 /E /C /H /K /I /Y
@Echo .
@REM PAUSE
@Rem
@GoTo ENDOFCOPY
:RUNCANCEL
@Echo .
@Echo . Copy cancelled!!!
@Echo .
:ENDOFCOPY
@Rem
@If not exist  %2\%3\%4\True.Flg      Copy C:\Bat\Win98\True.Flg %2\%3\%4
@Rem
@Echo .
@Echo ...Backup from %1 to %2\%3\%4 with options: %5
@Echo .
@Echo . Finished copying...
@Echo .
