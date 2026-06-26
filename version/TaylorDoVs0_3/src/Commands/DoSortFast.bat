@Echo off
@Echo . 
@Echo ------------------------------------------------------
@Echo Command: DoSortFast
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
@Echo - Do Fast Sort for User Zones
@Echo ------------------------------------------------------
@Echo - Regular Zones
Copy "..\ActionVerbs\Fast\ZoneDoActionTypeAllFast.MyDc"	        "..\ActionVerbs\ZoneDoActionThis.MyDc" /Y
Copy "..\ActionVerbs\Fast\ZoneDoActionTypeAllFast.MyDc"         "..\ActionVerbs\ZoneDoActionTypeAll.MyDc" /Y
@Echo . 
@Echo - Set Mode to Fast
Copy "..\ActionVerbs\Fast\ZoneDoActionThisModeFast.MyDc"         "..\ActionVerbs\ZoneDoActionThisMode.MyDc" /Y
@Echo . 
@Echo - OS Boot
Copy "..\ActionVerbs\Fast\ZoneDoActionTypeOsBootDataFast.MyDc"  "..\ActionVerbs\ZoneDoActionTypeOsBootData.MyDc" /Y
Copy "..\ActionVerbs\Fast\ZoneDoActionTypeOsBootFixedFast.MyDc" "..\ActionVerbs\ZoneDoActionTypeOsBootFixed.MyDc" /Y
@Echo . 
@Echo - Mft and Dir
Copy "..\ActionVerbs\Fast\ZoneDoActionTypeOsDirFast.MyDc"       "..\ActionVerbs\ZoneDoActionTypeOsDir.MyDc" /Y
Copy "..\ActionVerbs\Fast\ZoneDoActionTypeOsMftFast.MyDc"       "..\ActionVerbs\ZoneDoActionTypeOsMft.MyDc" /Y
Copy "..\ActionVerbs\Fast\ZoneDoActionTypeOsPageHiberDumpFast.MyDc"     "..\ActionVerbs\ZoneDoActionTypeOsPageHiberDump.MyDc" /Y
@Echo . 
@Echo - OS Boot ProgramHints
Copy "..\ActionVerbs\Fast\ZoneDoActionTypeOsProgramHintsDataFast.MyDc"  "..\ActionVerbs\ZoneDoActionTypeOsProgramHints.MyDc" /Y
Copy "..\ActionVerbs\Fast\ZoneDoActionTypeOsProgramHintsFixedFast.MyDc" "..\ActionVerbs\ZoneDoActionTypeOsProgramHintsFixed.MyDc" /Y
@Echo . 
@Echo - Programs
Copy "..\ActionVerbs\Fast\ZoneDoActionTypeOsProgramsDataFast.MyDc"      "..\ActionVerbs\ZoneDoActionTypeOsPrograms.MyDc" /Y
Copy "..\ActionVerbs\Fast\ZoneDoActionTypeOsProgramsFixedFast.MyDc"     "..\ActionVerbs\ZoneDoActionTypeOsProgramsFixed.MyDc" /Y
@Echo . 
@Echo - Blobs
Copy "..\ActionVerbs\Fast\ZoneDoActionTypeBlobsFast.MyDc"      "..\ActionVerbs\ZoneDoActionTypeBlobs.MyDc"
@Echo . 
@Echo - Archives
Copy "..\ActionVerbs\Fast\ZoneDoActionTypeArchivesBuFast.MyDc"      "..\ActionVerbs\ZoneDoActionTypeArchivesBu.MyDc"
@Echo . 
@Echo ------------------------------------------------------
@Echo . 
@Echo - End of DoSortFast -----------------
@TIMEOUT /T 1 /NOBREAK
