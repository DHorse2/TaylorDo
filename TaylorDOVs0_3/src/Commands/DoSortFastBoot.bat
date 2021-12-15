@Echo off
@Echo . 
@Echo ------------------------------------------------------
@Echo - Command: DoSortFastBoot
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
@Echo - Do Fast Sort within Boot then Full Sort for User Zones
@Echo ------------------------------------------------------
@Echo - Regular Zones
Copy "..\ActionVerbs\Regular\ZoneDoActionTypeAllRegular.MyDc"	        "..\ActionVerbs\ZoneDoActionThis.MyDc" /Y
Copy "..\ActionVerbs\Regular\ZoneDoActionTypeAllRegular.MyDc"         "..\ActionVerbs\ZoneDoActionTypeAll.MyDc" /Y
@Echo . 
@Echo - Set Action Mode to FastBoot
Copy "..\ActionVerbs\Fast\ZoneDoActionThisModeFastBoot.MyDc"         "..\ActionVerbs\ZoneDoActionThisMode.MyDc" /Y
@Echo . 
@Echo - Set Boot Zone to Fast
Copy "..\ActionVerbs\Fast\ZoneDoActionTypeOsBootDataFast.MyDc"  "..\ActionVerbs\ZoneDoActionTypeOsBootData.MyDc" /Y
Copy "..\ActionVerbs\Fast\ZoneDoActionTypeOsBootFixedFast.MyDc" "..\ActionVerbs\ZoneDoActionTypeOsBootFixed.MyDc" /Y

@Echo - Set Mft and DIR to Fast
Copy "..\ActionVerbs\Fast\ZoneDoActionTypeOsDirFast.MyDc"       "..\ActionVerbs\ZoneDoActionTypeOsDir.MyDc" /Y
Copy "..\ActionVerbs\Fast\ZoneDoActionTypeOsMftFast.MyDc"       "..\ActionVerbs\ZoneDoActionTypeOsMft.MyDc" /Y
@Echo . 
@Echo - Set OS Files to Fast
Copy "..\ActionVerbs\Fast\ZoneDoActionTypeOsPageHiberDumpFast.MyDc"     "..\ActionVerbs\ZoneDoActionTypeOsPageHiberDump.MyDc" /Y
Copy "..\ActionVerbs\Fast\ZoneDoActionTypeOsProgramHintsDataFast.MyDc"  "..\ActionVerbs\ZoneDoActionTypeOsProgramHints.MyDc" /Y
Copy "..\ActionVerbs\Fast\ZoneDoActionTypeOsProgramHintsFixedFast.MyDc" "..\ActionVerbs\ZoneDoActionTypeOsProgramHintsFixed.MyDc" /Y
@Echo . 
@Echo - Set OS Programs to Fast
Copy "..\ActionVerbs\Fast\ZoneDoActionTypeOsProgramsDataFast.MyDc"      "..\ActionVerbs\ZoneDoActionTypeOsPrograms.MyDc" /Y
Copy "..\ActionVerbs\Fast\ZoneDoActionTypeOsProgramsFixedFast.MyDc"     "..\ActionVerbs\ZoneDoActionTypeOsProgramsFixed.MyDc" /Y
@Echo . 
@Echo ------------------------------------------------------
@Echo . 
@Echo - End of DoSortFastBoot -----------------
@TIMEOUT /T 1 /NOBREAK
