@Echo off
@Echo -------- Command: DoSortFastBoot
@Echo -------- Sort User Zones as Regular
@Rem copy "..\ActionVerbs\Fast\XFast.MyDc" "..\ActionVerbs\X.MyDc" /Y
@copy "..\ActionVerbs\Regular\ZoneDoActionTypeAllRegular.MyDc"	        "..\ActionVerbs\ZoneDoActionThis.MyDc" /Y
@copy "..\ActionVerbs\Regular\ZoneDoActionTypeAllRegular.MyDc"         "..\ActionVerbs\ZoneDoActionTypeAll.MyDc" /Y
@Echo -------- Set Boot Zone to Fast
@copy "..\ActionVerbs\Fast\ZoneDoActionTypeOsBootDataFast.MyDc"  "..\ActionVerbs\ZoneDoActionTypeOsBootData.MyDc" /Y
@copy "..\ActionVerbs\Fast\ZoneDoActionTypeOsBootFixedFast.MyDc" "..\ActionVerbs\ZoneDoActionTypeOsBootFixed.MyDc" /Y
@Echo -------- Set Mft and DIR to Fast
@copy "..\ActionVerbs\Fast\ZoneDoActionTypeOsDirFast.MyDc"       "..\ActionVerbs\ZoneDoActionTypeOsDir.MyDc" /Y
@copy "..\ActionVerbs\Fast\ZoneDoActionTypeOsMftFast.MyDc"       "..\ActionVerbs\ZoneDoActionTypeOsMft.MyDc" /Y

@Echo -------- Set OS Files to Fast
@copy "..\ActionVerbs\Fast\ZoneDoActionTypeOsPageHiberDumpFast.MyDc"     "..\ActionVerbs\ZoneDoActionTypeOsPageHiberDump.MyDc" /Y
@copy "..\ActionVerbs\Fast\ZoneDoActionTypeOsProgramHintsDataFast.MyDc"  "..\ActionVerbs\ZoneDoActionTypeOsProgramHints.MyDc" /Y
@copy "..\ActionVerbs\Fast\ZoneDoActionTypeOsProgramHintsFixedFast.MyDc" "..\ActionVerbs\ZoneDoActionTypeOsProgramHintsFixed.MyDc" /Y
@Echo -------- Set OS Programs to Fast
@copy "..\ActionVerbs\Fast\ZoneDoActionTypeOsProgramsDataFast.MyDc"      "..\ActionVerbs\ZoneDoActionTypeOsPrograms.MyDc" /Y
@copy "..\ActionVerbs\Fast\ZoneDoActionTypeOsProgramsFixedFast.MyDc"     "..\ActionVerbs\ZoneDoActionTypeOsProgramsFixed.MyDc" /Y

@Echo -------- Set Action Mode to FastBoot
@copy "..\ActionVerbs\Fast\ZoneDoActionThisModeFastBoot.txt"         "..\ActionVerbs\ZoneDoActionThisMode.txt"
@copy "..\ActionVerbs\Fast\ZoneDoAction$ USING FAST MODE.txt"    "..\ActionVerbs\ZoneDoAction$ USING FAST BOOT MODE.txt"

@Rem copy "..\ActionVerbs\Fast\ZoneDoActionTypeOsXFast.MyDc" "..\ActionVerbs\ZoneDoActionTypeOsX.MyDc" /Y
