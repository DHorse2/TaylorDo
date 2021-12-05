@Echo off
@Echo -------- Command: DoSortFast
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
@Echo -------- Do Fast Sort for User Zones
Copy "..\ActionVerbs\Fast\ZoneDoActionTypeAllFast.MyDc"	        "..\ActionVerbs\ZoneDoActionThis.MyDc" /Y
Copy "..\ActionVerbs\Fast\ZoneDoActionTypeAllFast.MyDc"         "..\ActionVerbs\ZoneDoActionTypeAll.MyDc" /Y

@Echo -------- OS Boot
Copy "..\ActionVerbs\Fast\ZoneDoActionTypeOsBootDataFast.MyDc"  "..\ActionVerbs\ZoneDoActionTypeOsBootData.MyDc" /Y
Copy "..\ActionVerbs\Fast\ZoneDoActionTypeOsBootFixedFast.MyDc" "..\ActionVerbs\ZoneDoActionTypeOsBootFixed.MyDc" /Y

@Echo -------- Mft and Dir
Copy "..\ActionVerbs\Fast\ZoneDoActionTypeOsDirFast.MyDc"       "..\ActionVerbs\ZoneDoActionTypeOsDir.MyDc" /Y
Copy "..\ActionVerbs\Fast\ZoneDoActionTypeOsMftFast.MyDc"       "..\ActionVerbs\ZoneDoActionTypeOsMft.MyDc" /Y
Copy "..\ActionVerbs\Fast\ZoneDoActionTypeOsPageHiberDumpFast.MyDc"     "..\ActionVerbs\ZoneDoActionTypeOsPageHiberDump.MyDc" /Y

@Echo -------- OS Boot ProgramHints
Copy "..\ActionVerbs\Fast\ZoneDoActionTypeOsProgramHintsDataFast.MyDc"  "..\ActionVerbs\ZoneDoActionTypeOsProgramHints.MyDc" /Y
Copy "..\ActionVerbs\Fast\ZoneDoActionTypeOsProgramHintsFixedFast.MyDc" "..\ActionVerbs\ZoneDoActionTypeOsProgramHintsFixed.MyDc" /Y

@Echo -------- Programs
Copy "..\ActionVerbs\Fast\ZoneDoActionTypeOsProgramsDataFast.MyDc"      "..\ActionVerbs\ZoneDoActionTypeOsPrograms.MyDc" /Y
Copy "..\ActionVerbs\Fast\ZoneDoActionTypeOsProgramsFixedFast.MyDc"     "..\ActionVerbs\ZoneDoActionTypeOsProgramsFixed.MyDc" /Y

@Echo -------- Blobs
Copy "..\ActionVerbs\Fast\ZoneDoActionTypeBlobsFast.MyDc"      "..\ActionVerbs\ZoneDoActionTypeBlobs.MyDc"

@Echo -------- Archives
Copy "..\ActionVerbs\Fast\ZoneDoActionTypeArchivesBuFast.MyDc"      "..\ActionVerbs\ZoneDoActionTypeArchivesBu.MyDc"

@Echo -------- Set Mode to Fast
Copy "..\ActionVerbs\Fast\ZoneDoActionThisModeFast.txt"         "..\ActionVerbs\ZoneDoActionThisMode.txt"

@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
call "..\Commands\DoStateSave.bat"
@Echo 
@Echo --------------- End of DoSortFast -----------------
@TIMEOUT /T 1 /NOBREAK
