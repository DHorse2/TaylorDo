@Echo off
@Echo -------- Command: DoSortRegular
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------

@Echo -------- Do Regular Sort for User Zones
Copy "..\ActionVerbs\Regular\ZoneDoActionTypeAllRegular.MyDc"              "..\ActionVerbs\ZoneDoActionThis.MyDc"
Copy "..\ActionVerbs\Regular\ZoneDoActionTypeAllRegular.MyDc"              "..\ActionVerbs\ZoneDoActionTypeAll.MyDc"

@Echo -------- OS Boot
Copy "..\ActionVerbs\Regular\ZoneDoActionTypeOsBootDataRegular.MyDc"       "..\ActionVerbs\ZoneDoActionTypeOsBootData.MyDc"
Copy "..\ActionVerbs\Regular\ZoneDoActionTypeOsBootFixedRegular.MyDc"      "..\ActionVerbs\ZoneDoActionTypeOsBootFixed.MyDc"

@Echo -------- Mft and Dir
Copy "..\ActionVerbs\Regular\ZoneDoActionTypeOsDirRegular.MyDc"            "..\ActionVerbs\ZoneDoActionTypeOsDir.MyDc"
Copy "..\ActionVerbs\Regular\ZoneDoActionTypeOsMftRegular.MyDc"            "..\ActionVerbs\ZoneDoActionTypeOsMft.MyDc"
Copy "..\ActionVerbs\Regular\ZoneDoActionTypeOsPageHiberDumpRegular.MyDc"  "..\ActionVerbs\ZoneDoActionTypeOsPageHiberDump.MyDc"

@Echo -------- OS Boot ProgramHints
Copy "..\ActionVerbs\Regular\ZoneDoActionTypeOsProgramHintsDataRegular.MyDc"  "..\ActionVerbs\ZoneDoActionTypeOsProgramHints.MyDc"
Copy "..\ActionVerbs\Regular\ZoneDoActionTypeOsProgramHintsFixedRegular.MyDc" "..\ActionVerbs\ZoneDoActionTypeOsProgramHintsFixed.MyDc"

@Echo -------- Programs
Copy "..\ActionVerbs\Regular\ZoneDoActionTypeOsProgramsDataRegular.MyDc"      "..\ActionVerbs\ZoneDoActionTypeOsPrograms.MyDc"
Copy "..\ActionVerbs\Regular\ZoneDoActionTypeOsProgramsFixedRegular.MyDc"     "..\ActionVerbs\ZoneDoActionTypeOsProgramsFixed.MyDc"

@Echo -------- Blobs
Copy "..\ActionVerbs\Regular\ZoneDoActionTypeBlobsRegular.MyDc"      "..\ActionVerbs\ZoneDoActionTypeBlobs.MyDc"

@Echo -------- Archives
Copy "..\ActionVerbs\Regular\ZoneDoActionTypeArchivesBuRegular.MyDc"      "..\ActionVerbs\ZoneDoActionTypeArchivesBu.MyDc"

@Echo -------- Set Mode to Regular
Copy "..\ActionVerbs\Regular\ZoneDoActionThisModeRegular.txt"                  "..\ActionVerbs\ZoneDoActionThisMode.txt"

@Echo 
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
call "..\Commands\DoStateSave.bat"
@Echo 
@Echo --------------- End of DoSortRegular -----------------
@TIMEOUT /T 1 /NOBREAK
