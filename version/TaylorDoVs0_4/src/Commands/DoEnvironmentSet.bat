@Echo off
@Echo . 
@Echo ------------------------------------------------------
@Echo - Command: DoEnvironmentSet
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------

setx /K /M MyDefragDir=HKEY_LOCAL_MACHINE\SOFTWARE\MyDefrag\Install_Dir
setx /K /M TaylorDoDir==HKEY_LOCAL_MACHINE\SOFTWARE\TaylorDo\Install_Dir
setx /K /M TaylorDoPublisher=HKEY_LOCAL_MACHINE\SOFTWARE\TaylorDo\Publisher
setx /K /M TaylorDoProductName=HKEY_LOCAL_MACHINE\SOFTWARE\TaylorDo\ProductName
setx /K /M TaylorDoVersion=HKEY_LOCAL_MACHINE\SOFTWARE\TaylorDo\Version

; set MyDefragDir=%PROGRAMFILES%\MyDefrag v4.3.1
; set TaylorDoDir=%PROGRAMFILES%\TaylorDo
; set TaylorDoPublisher=David G Horsman
; set TaylorDoProductName=Taylor Disk Optimizer
; set TaylorDoVersion=4.0.1.0

@Echo . 
@Echo ------------------------------------------------------
@Echo . 
@Echo - End of DoEnvironmentSet -----------------
@TIMEOUT /T 1 /NOBREAK
pause()