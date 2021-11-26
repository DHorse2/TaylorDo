@Echo off
@Echo -------- ToDo Command: DoSysClean Step2 Reboot
@Echo -------- 
@Echo This script executes upon the next system boot.
@Echo Script Types:
@Echo Admin run:
@Echo - UserRun
@Echo Boot:
@Echo - AtBootHklm HKLM
@Echo - AtBootHkcu HKCU
@Echo 
@Echo You might do house keeping here,
@Echo start services, delete files, etc.
@Echo 
@Echo ------------------------------------------------------
@Echo -------- 
@Echo Description
@Echo This series of processes executes upon REBOOT
@Echo It Deletes, Recreates or Defrags:
@Echo Pagefile, Hyberfile, Dumpfile, 
@Echo System Indexes, 
@Echo System Volume Information
@Echo $JRN 
@Echo 
@Echo ------------------------------------------------------
@Echo ------------------------------------------------------
@Echo -------- 
@Echo Delete Disabled Hyberfile
@Rem It should not exist at this point
@Rem but could on backup drives.
@Rem powercfg -h off
@Del Hyberfile.sys

@Echo ------------------------------------------------------
@Echo -------- 
@Echo Disable Dumpfile
@Del DUMPFILE.sys

@Echo ------------------------------------------------------
@Echo -------- 
@Echo Disable Pagefile (Recreate)

@Echo ------------------------------------------------------
@Echo -------- 
@Echo Disable Pagefile (Delete & Recreate) (eval)

@Rem Del hyberfile.sys

@Echo ------------------------------------------------------
@Echo -------- 
@Echo Delete Restore Points (System Volume Information)

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

@Echo ------------------------------------------------------
@Echo -------- 
@Echo Other

@Del hyberfile.sys
@Rem @Del swapfile.sys

@Echo -------- 
@Echo REBOOT in safe mode is NOT done here.
pause
Rem @shutdown.exe /r /o.