@Echo off
@Echo .
@Echo ------------------------------------------------------
@Echo - ToDo Command: DoSysCleanStep3Logon Do Sys Clean Step3 Logon
@Echo ------------------------------------------------------
@Echo - RUN THIS AFTER THE DEFRAG
@Echo Deletes, Recreates or Defrags:
@Echo Pagefile, Hyberfile, Dumpfile, 
@Echo System Indexes, 
@Echo System Volume Information
@Echo $JRN 
@Echo . 
@Echo ------------------------------------------------------
@Echo off
@Echo This script executes at logon or before the next run
@Echo - AtLogon
@Echo - AtNextRun
@Echo 
@Echo You might do house keeping here,
@Echo start services, delete files, etc.
@Echo . 
@Echo ------------------------------------------------------
@Echo Enable Pagefile (Re-extend on disk)
@Rem wmic pagefile
wmic computersystem where name="%computername%" set AutomaticManagedPagefile=True
@Echo ---------------------------------
wmic pagefile list /format:list
@Echo . 
@Echo ------------------------------------------------------
@Echo Recreate System Indexes
:wsearch
sc config wsearch start= delayed-auto
net start wsearch
IF NOT %ERRORLEVEL%==0 (goto :wsearch) ELSE goto :indexend
:indexend
@Echo . 
@Echo ------------------------------------------------------
@Echo Delete Restore Points (System Volume Information)
sc config srservice start= Auto
net start srservice
wmic.exe /Namespace:\\root\default Path SystemRestore Call CreateRestorePoint "Restore Points Turned on by TaylorDo", 100, 7
@Echo ------------------------------------------------------
@Echo ------------------------------------------------------
@Echo Other
@Echo - End of DoSysCleanStep3Logon -----------------
@Echo . 
pause
@Rem Example:
@Rem REBOOT in safe mode
@Rem shutdown.exe /r /o.