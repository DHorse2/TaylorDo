@Echo off
@Echo - Command: DoSortFull
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------

@Echo - Do Full Sort for User Zones
Copy "..\ActionVerbs\Full\ZoneDoActionTypeAllFull.MyDc"	        "..\ActionVerbs\ZoneDoActionThis.MyDc" /Y
Copy "..\ActionVerbs\Full\ZoneDoActionTypeAllFull.MyDc"         "..\ActionVerbs\ZoneDoActionTypeAll.MyDc" /Y

@Echo - OS Boot
Copy "..\ActionVerbs\Full\ZoneDoActionTypeOsBootDataFull.MyDc"  "..\ActionVerbs\ZoneDoActionTypeOsBootData.MyDc" /Y
Copy "..\ActionVerbs\Full\ZoneDoActionTypeOsBootFixedFull.MyDc" "..\ActionVerbs\ZoneDoActionTypeOsBootFixed.MyDc" /Y

@Echo - Mft and Dir
Copy "..\ActionVerbs\Full\ZoneDoActionTypeOsDirFull.MyDc"       "..\ActionVerbs\ZoneDoActionTypeOsDir.MyDc" /Y
Copy "..\ActionVerbs\Full\ZoneDoActionTypeOsMftFull.MyDc"       "..\ActionVerbs\ZoneDoActionTypeOsMft.MyDc" /Y
Copy "..\ActionVerbs\Full\ZoneDoActionTypeOsPageHiberDumpFull.MyDc"     "..\ActionVerbs\ZoneDoActionTypeOsPageHiberDump.MyDc" /Y

@Echo - OS Boot ProgramHints
Copy "..\ActionVerbs\Full\ZoneDoActionTypeOsProgramHintsDataFull.MyDc"  "..\ActionVerbs\ZoneDoActionTypeOsProgramHints.MyDc" /Y
Copy "..\ActionVerbs\Full\ZoneDoActionTypeOsProgramHintsFixedFull.MyDc" "..\ActionVerbs\ZoneDoActionTypeOsProgramHintsFixed.MyDc" /Y

@Echo - Programs
Copy "..\ActionVerbs\Full\ZoneDoActionTypeOsProgramsDataFull.MyDc"      "..\ActionVerbs\ZoneDoActionTypeOsPrograms.MyDc" /Y
Copy "..\ActionVerbs\Full\ZoneDoActionTypeOsProgramsFixedFull.MyDc"     "..\ActionVerbs\ZoneDoActionTypeOsProgramsFixed.MyDc" /Y

@Echo - Blobs
Copy "..\ActionVerbs\Full\ZoneDoActionTypeBlobsFull.MyDc"      "..\ActionVerbs\ZoneDoActionTypeBlobs.MyDc"

@Echo - Archives
Copy "..\ActionVerbs\Full\ZoneDoActionTypeArchivesBuFull.MyDc"      "..\ActionVerbs\ZoneDoActionTypeArchivesBu.MyDc"

@Echo - Set Mode to Full
Copy "..\ActionVerbs\Full\ZoneDoActionThisModeFull.txt"         "..\ActionVerbs\ZoneDoActionThisMode.txt"

@Echo ------------------------------------------------------
@Rem @TIMEOUT /T 1 /NOBREAK
@Rem @Echo ------------------------------------------------------
@Rem call "..\Commands\DoStateSave.bat"
@Echo 
@Echo - End of DoSortFull -----------------
@TIMEOUT /T 1 /NOBREAK
