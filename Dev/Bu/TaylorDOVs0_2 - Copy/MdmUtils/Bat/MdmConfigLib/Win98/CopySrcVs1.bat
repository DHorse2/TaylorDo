@Rem
@Rem
@Rem Syntax: COPYSRC SourcePath DestionationPath Option
@Rem where options = d(elete contents)
@Rem
@Echo ...Backup from %1 to %2 with options: %3
@Echo .
@PAUSE
@Rem
@If exist F:\Backup\True.Flg      GoTo :SKELTONEXISTS
@Rem
@Echo . Skelton Directories do not exist, creating all...
@Echo .
@Call C:\Bat\Win98\CrDirSrc
@Rem
@Echo . Skelton Directories Created for %2
@Echo .
@PAUSE
:SKELTONEXISTS
@Rem
@If exist %2\True.Flg      GoTo :DIREXISTS
@Rem
@Echo . Destination Directory does not exist, creating...
@Echo .
@Echo ...Backup from %1 to %2 with options: %3
@Echo .
@Choice /c:YN Ary you sure this is correct 
@If errorlevel 2     GoTo RUNCANCEL
@If errorlevel 1     GoTo RUNOK
@Echo .
@Echo . Enter Y or N to confirm
@Echo .
@GoTo SKELTONEXISTS
:RUNOK
MD %2
Copy C:\Bat\Win98\True.Flg %2
@Rem
@Echo . Destination Directory Created for %2
@Echo .
@PAUSE
:DIREXISTS
@Rem
@If %3==d      GoTo :DIRDELALL
@If %3==D      GoTo :DIRDELALL
@Echo . Existing files not deleted...
@Echo .
@GoTo :SKIPDIRDELALL
@Rem
:DIRDELALL
@Rem
@Echo . Deleting all files in directory %2
@Echo .
DELTREE /Y %2
@Echo .
Md %2
@Echo .
Copy C:\Bat\Win98\True.Flg %2
@Echo .
@Echo . Files deleted
@Echo .
@PAUSE
@Rem
:SKIPDIRDELALL
@Rem
@Rem
@Echo .
@Echo . Copying files...
@Echo .
@Echo . XCOPY %1 %2 /E /C /H /K /I /Y
@Echo .
@PAUSE
XCOPY %1 %2 /E /C /H /K /I /Y
@Echo .
@PAUSE
@Rem
@GoTo ENDOFCOPY
:RUNCANCEL
@Echo .
@Echo . Copy cancelled!!!
@Echo .
:ENDOFCOPY
@Rem
@If not exist  %2\True.Flg      Copy C:\Bat\Win98\True.Flg %2
@Rem
@Echo .
@Echo . Finished copying...
@Echo .
