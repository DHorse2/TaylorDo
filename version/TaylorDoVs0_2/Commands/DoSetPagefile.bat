@Echo off
@Echo Command: DoSetPagefile
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
Rem Source: https://social.technet.microsoft.com/Forums/windows/en-US/708da424-3a7c-404d-8f54-f989ed62d323/command-for-changeing-the-page-file
Rem from ::setpagefile.bat::
@echo off
set /p server="Which server or '@serverlist.txt?'   ":
set /p logon="Which user to logon with?  ":
set /p StartSize="What InitialSize do you want on the pagefile?   ":
set /p MaxSize="What MaximumSize do you want on the pagefile?   ":
set /p pathfilename="What volume:\\path\filename?  (i.e. C:\\pagefile.sys)

REM wmic pagefileset where name="<path/filename>" set InitialSize=<initialsize>,MaximumSize=<maxsize> //wrong
REM wmic pagefileset where name="<volume:\\path\filename>" set InitialSize=<initialsize>,MaximumSize=<maxsize> //right

wmic /user:usirmc\%logon% /node:%server% pagefileset where name="%pathfilename%" set InitialSize=%StartSize%,MaximumSize=%MaxSize%
@Echo 
@Echo --------------- End of DoSetPagefile -----------------
@TIMEOUT /T 1 /NOBREAK
