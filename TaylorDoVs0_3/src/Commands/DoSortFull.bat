@Echo off
@Echo . 
@Echo ------------------------------------------------------
@Echo - Command: DoSortFull
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
@Echo - Do Full Sort for User Zones
@Echo ------------------------------------------------------
@Echo - Regular Zones
Copy "..\ActionVerbs\Full\ZoneDoActionTypeAllFull.MyDc" /Y      "..\ActionVerbs\ZoneDoActionThis.MyDc"
Copy "..\ActionVerbs\Full\ZoneDoActionTypeAllFull.MyDc" /Y      "..\ActionVerbs\ZoneDoActionTypeAll.MyDc"
@Echo . 
@Echo - Set Mode to Full
Copy "..\ActionVerbs\Full\ZoneDoActionThisModeFull.MyDc" /Y      "..\ActionVerbs\ZoneDoActionThisMode.MyDc"
@Echo . 
@Echo - OS Boot
Copy "..\ActionVerbs\Full\ZoneDoActionTypeOsBootDataFull.MyDc" /Y  "..\ActionVerbs\ZoneDoActionTypeOsBootData.MyDc"
Copy "..\ActionVerbs\Full\ZoneDoActionTypeOsBootFixedFull.MyDc" /Y  "..\ActionVerbs\ZoneDoActionTypeOsBootFixed.MyDc"
@Echo . 
@Echo - Mft and Dir
Copy "..\ActionVerbs\Full\ZoneDoActionTypeOsDirFull.MyDc" /Y    "..\ActionVerbs\ZoneDoActionTypeOsDir.MyDc"
Copy "..\ActionVerbs\Full\ZoneDoActionTypeOsMftFull.MyDc" /Y    "..\ActionVerbs\ZoneDoActionTypeOsMft.MyDc"
Copy "..\ActionVerbs\Full\ZoneDoActionTypeOsPageHiberDumpFull.MyDc" /Y "..\ActionVerbs\ZoneDoActionTypeOsPageHiberDump.MyDc"
@Echo . 
@Echo - OS Boot ProgramHints
Copy "..\ActionVerbs\Full\ZoneDoActionTypeOsProgramHintsDataFull.MyDc" /Y  "..\ActionVerbs\ZoneDoActionTypeOsProgramHints.MyDc"
Copy "..\ActionVerbs\Full\ZoneDoActionTypeOsProgramHintsFixedFull.MyDc" /Y "..\ActionVerbs\ZoneDoActionTypeOsProgramHintsFixed.MyDc"
@Echo . 
@Echo - Programs
Copy "..\ActionVerbs\Full\ZoneDoActionTypeOsProgramsDataFull.MyDc" /Y      "..\ActionVerbs\ZoneDoActionTypeOsPrograms.MyDc"
Copy "..\ActionVerbs\Full\ZoneDoActionTypeOsProgramsFixedFull.MyDc" /Y     "..\ActionVerbs\ZoneDoActionTypeOsProgramsFixed.MyDc"
@Echo . 
@Echo - Blobs
Copy "..\ActionVerbs\Full\ZoneDoActionTypeBlobsFull.MyDc" /Y               "..\ActionVerbs\ZoneDoActionTypeBlobs.MyDc"
@Echo . 
@Echo - Archives
Copy "..\ActionVerbs\Full\ZoneDoActionTypeArchivesBuFull.MyDc" /Y          "..\ActionVerbs\ZoneDoActionTypeArchivesBu.MyDc"
@Echo . 
@Echo ------------------------------------------------------
@Echo . 
@Echo - End of DoSortFull -----------------
@TIMEOUT /T 1 /NOBREAK
