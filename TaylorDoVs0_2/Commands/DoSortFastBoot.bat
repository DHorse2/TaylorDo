@Echo off
@Echo -------- Command: DoSortFastBoot
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
Copy "..\ActionVerbs\Regular\ZoneDoActionTypeAllRegular.MyDc"	        "..\ActionVerbs\ZoneDoActionThis.MyDc" /Y
Copy "..\ActionVerbs\Regular\ZoneDoActionTypeAllRegular.MyDc"         "..\ActionVerbs\ZoneDoActionTypeAll.MyDc" /Y

@Echo -------- Set Boot Zone to Fast
Copy "..\ActionVerbs\Fast\ZoneDoActionTypeOsBootDataFast.MyDc"  "..\ActionVerbs\ZoneDoActionTypeOsBootData.MyDc" /Y
Copy "..\ActionVerbs\Fast\ZoneDoActionTypeOsBootFixedFast.MyDc" "..\ActionVerbs\ZoneDoActionTypeOsBootFixed.MyDc" /Y

@Echo -------- Set Mft and DIR to Fast
Copy "..\ActionVerbs\Fast\ZoneDoActionTypeOsDirFast.MyDc"       "..\ActionVerbs\ZoneDoActionTypeOsDir.MyDc" /Y
Copy "..\ActionVerbs\Fast\ZoneDoActionTypeOsMftFast.MyDc"       "..\ActionVerbs\ZoneDoActionTypeOsMft.MyDc" /Y

@Echo -------- Set OS Files to Fast
Copy "..\ActionVerbs\Fast\ZoneDoActionTypeOsPageHiberDumpFast.MyDc"     "..\ActionVerbs\ZoneDoActionTypeOsPageHiberDump.MyDc" /Y
Copy "..\ActionVerbs\Fast\ZoneDoActionTypeOsProgramHintsDataFast.MyDc"  "..\ActionVerbs\ZoneDoActionTypeOsProgramHints.MyDc" /Y
Copy "..\ActionVerbs\Fast\ZoneDoActionTypeOsProgramHintsFixedFast.MyDc" "..\ActionVerbs\ZoneDoActionTypeOsProgramHintsFixed.MyDc" /Y

@Echo -------- Set OS Programs to Fast
Copy "..\ActionVerbs\Fast\ZoneDoActionTypeOsProgramsDataFast.MyDc"      "..\ActionVerbs\ZoneDoActionTypeOsPrograms.MyDc" /Y
Copy "..\ActionVerbs\Fast\ZoneDoActionTypeOsProgramsFixedFast.MyDc"     "..\ActionVerbs\ZoneDoActionTypeOsProgramsFixed.MyDc" /Y

@Echo -------- Set Action Mode to FastBoot
Copy "..\ActionVerbs\Fast\ZoneDoActionThisModeFastBoot.txt"         "..\ActionVerbs\ZoneDoActionThisMode.txt"

@Echo 
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
call "..\Commands\DoStateSave.bat"
@Echo 
@Echo --------------- End of DoSortFastBoot -----------------
@TIMEOUT /T 1 /NOBREAK
