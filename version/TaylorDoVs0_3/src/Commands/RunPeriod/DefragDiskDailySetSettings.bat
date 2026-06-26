@Echo off
@Echo .
@Echo ------------------------------------------------------
@Echo - Command: DefragDiskDailySetSettings
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@call "..\Commands\DoStateSave.bat"
@TIMEOUT /T 1 /NOBREAK
@call "..\Commands\DoSortFast.bat"
@TIMEOUT /T 1 /NOBREAK
@call "..\Commands\DoGapNoVacate.bat"
@Echo . script is starting...

@Rem start script
@Rem @Echo . waiting for script to load. Processing settings. Wait...
@Rem @TIMEOUT /T 60 /NOBREAK
@Rem @call "..\Commands\DoStateRestore.bat"
