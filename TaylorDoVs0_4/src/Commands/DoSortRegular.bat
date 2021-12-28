@Echo off
@Echo . 
@Echo ------------------------------------------------------
@Echo - Command: DoSortRegular
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
@Echo ------------------------------------------------------
@Echo - Do Regular Sort for User Zones  (Regular, standard or normal)
@Echo ------------------------------------------------------
@Echo - Regular Zones
Copy "..\ActionVerbs\Regular\ZoneDoActionTypeAllRegular.MyDc" /Y           "..\ActionVerbs\ZoneDoActionThis.MyDc"
Copy "..\ActionVerbs\Regular\ZoneDoActionTypeAllRegular.MyDc"  /Y          "..\ActionVerbs\ZoneDoActionTypeAll.MyDc"
@Echo . 
@Echo - Set Mode to Regular
Copy "..\ActionVerbs\Regular\ZoneDoActionThisModeRegular.MyDc" /Y "..\ActionVerbs\ActionVerbs\ZoneDoActionThisMode
@Echo . 
@Echo - OS Boot
Copy "..\ActionVerbs\Regular\ZoneDoActionTypeOsBootDataRegular.MyDc" /Y    "..\ActionVerbs\ZoneDoActionTypeOsBootData.MyDc"
Copy "..\ActionVerbs\Regular\ZoneDoActionTypeOsBootFixedRegular.MyDc" /Y   "..\ActionVerbs\ZoneDoActionTypeOsBootFixed.MyDc"
@Echo . 
@Echo - Mft and Dir
Copy "..\ActionVerbs\Regular\ZoneDoActionTypeOsDirRegular.MyDc" /Y         "..\ActionVerbs\ZoneDoActionTypeOsDir.MyDc"
Copy "..\ActionVerbs\Regular\ZoneDoActionTypeOsMftRegular.MyDc"  /Y        "..\ActionVerbs\ZoneDoActionTypeOsMft.MyDc"
Copy "..\ActionVerbs\Regular\ZoneDoActionTypeOsPageHiberDumpRegular.MyDc" /Y   "..\ActionVerbs\ZoneDoActionTypeOsPageHiberDump.MyDc"
@Echo . 
@Echo - OS Boot ProgramHints
Copy "..\ActionVerbs\Regular\ZoneDoActionTypeOsProgramHintsDataRegular.MyDc" /Y   "..\ActionVerbs\ZoneDoActionTypeOsProgramHints.MyDc"
Copy "..\ActionVerbs\Regular\ZoneDoActionTypeOsProgramHintsFixedRegular.MyDc" /Y  "..\ActionVerbs\ZoneDoActionTypeOsProgramHintsFixed.MyDc"
@Echo . 
@Echo - Programs
Copy "..\ActionVerbs\Regular\ZoneDoActionTypeOsProgramsDataRegular.MyDc" /Y   "..\ActionVerbs\ZoneDoActionTypeOsPrograms.MyDc"
Copy "..\ActionVerbs\Regular\ZoneDoActionTypeOsProgramsFixedRegular.MyDc" /Y  "..\ActionVerbs\ZoneDoActionTypeOsProgramsFixed.MyDc"
@Echo . 
@Echo - Blobs
Copy "..\ActionVerbs\Regular\ZoneDoActionTypeBlobsRegular.MyDc" /Y            "..\ActionVerbs\ZoneDoActionTypeBlobs.MyDc"
@Echo . 
@Echo - Archives
Copy "..\ActionVerbs\Regular\ZoneDoActionTypeArchivesBuRegular.MyDc" /Y       "..\ActionVerbs\ZoneDoActionTypeArchivesBu.MyDc"
@Echo . 
@Echo ------------------------------------------------------
@Echo . 
@Echo - End of DoSortRegular -----------------
@TIMEOUT /T 1 /NOBREAK
