@Echo off
@Echo .
@Echo ------------------------------------------------------
@Echo - ToDo Command: DoSysCleanStep1Start Do System Clean Step1 Start
@Echo ------------------------------------------------------
@Echo This script starts the system file cleanup processes.
@Echo It is a 3 step process: Start(Disables), Reboot, Logon.
@Echo . 
@Echo Script Types:
@Echo Admin run:
@Echo - UserRun
@Echo . 
@Echo ------------------------------------------------------
@Echo Description: **** IN PROGRESS ****
@Echo TaylorDo System Cleanup 
@Echo (Unmoveable, System Pagefile removal and recreation.)
@Echo This series of processes executes upon REBOOT
@Echo It Deletes, Recreates or Defrags:
@Echo	Pagefile, Hyberfile, Dumpfile, 
@Echo	System Indexes, 
@Echo	System Volume Information
@Echo	$JRN 
@Echo . 
@Echo ------------------------------------------------------
@Echo Purpose:
@Echo Windows, anti-virus software and applications 
@Echo Create numerous unmoveable files on these disk.
@Echo Particularly when a disk has ever been full these 
@Echo files can become highly fragmented and scattered 
@Echo across the hard drive.
@Echo - This interferes with free space consolodation and 
@Echo placement of zones.
@Echo - It does not impact reads of files that span these 
@Echo files but does occupy valuable realestate on the disk.
@Echo . 
@Echo WARNING:
@Echo The current design WILL DELETE ALL YOUR RESTORE POINTS 
@Echo and create a new one in the 2nd or 3rd step.
@Echo . 
@Echo It assumes you use system indexing, hybernation 
@Echo and ? also.
@Echo . 
@Echo ToDo Implement Sleep and abort
@pause
@Echo ------------------------------------------------------
@Echo ------------------------------------------------------
@call "..\Commands\DoStateSave.bat"
@Echo . 
@Echo ------------------------------------------------------
@Echo Disable Hyberfile
powercfg -h off
Del Hyberfile.sys
@Echo . 
@Echo ------------------------------------------------------
@Echo Disable Dumpfile
@Rem A dedicated dump file is a page file that is not used for paging. Instead, it is "dedicated" to back a system crash dump file (Memory.dmp) when a system crash occurs. (Microsoft)
Del DUMPFILE.sys
@Echo . 
@Echo ------------------------------------------------------
@Echo Disable Pagefile (Recreate)
@Rem wmic pagefile
wmic pagefile list /format:list
@Echo ----------------------------------
wmic computersystem where name="%computername%" set AutomaticManagedPagefile=False
wmic pagefileset where name="C:\\pagefile.sys" set InitialSize=16,MaximumSize=16
@Echo . 
@Echo ------------------------------------------------------
@Echo Disable Pagefile (Delete & Recreate) (eval)
@Echo powercfg.exe /hibernate off
@Echo . 
@Echo ------------------------------------------------------
@Echo Delete Restore Points (System Volume Information)
net stop srservice
sc config srservice start= disabled
@Echo . 
@Echo ------------------------------------------------------
@Echo Recreate System Indexes
net stop wsearch
del "%ProgramData%\Microsoft\Search\Data\Applications\Windows\Windows.edb"
:wsearch
sc config wsearch start= delayed-auto
@Rem :wsearch
@Rem AFTER BOOT: net start wsearch
@Rem IF NOT %ERRORLEVEL%==0 (goto :wsearch) ELSE goto :indexend
:indexend
@Echo . 
@Echo ------------------------------------------------------
@Echo Other
@Echo . 
Del hyberfile.sys
Del swapfile.sys
@Echo . 
@Echo ------------------------------------------------------
@Echo - End of DoSysCleanStep1Start -----------------
@Echo REBOOT in safe mode
pause
@shutdown.exe /r /o.
