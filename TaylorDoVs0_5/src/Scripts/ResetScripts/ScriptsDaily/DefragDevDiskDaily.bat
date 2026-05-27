@Echo off
@Echo -------- Command: DefragDevDiskDaily
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK >nul
@Echo ------------------------------------------------------
cd ..
call "..\Commands\DoDefragFast.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK >nul
@Echo ------------------------------------------------------
@Rem "..\..\ScriptsDaily\"
cd "ScriptsDaily"
"DefragDevDiskDaily.MyD"
