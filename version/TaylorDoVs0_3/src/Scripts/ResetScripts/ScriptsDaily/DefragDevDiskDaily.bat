@Echo off
@Echo -------- Command: DefragDevDiskDaily
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
cd ..
call "..\Commands\DoDefragFast.bat"
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
@Rem "..\..\ScriptsDaily\"
cd "ScriptsDaily"
"DefragDevDiskDaily.MyD"
