@Echo off
@Echo -------- Command: DoStateSave
@Rem copy "..\ActionVerbs\Regular\XRegular.MyDc" "..\ActionVerbs\X.MyDc"
@Echo -------- Do Regular Sort for User Zones
@copy "..\ActionVerbs\Regular\ZoneDoActionTypeAllRegular.MyDc"              "..\ActionVerbs\ZoneDoActionThis.MyDc"
@copy "..\ActionVerbs\Regular\ZoneDoActionTypeAllRegular.MyDc"              "..\ActionVerbs\ZoneDoActionTypeAll.MyDc"
@Echo -------- OS Boot
@copy "..\ActionVerbs\Regular\ZoneDoActionTypeOsBootDataRegular.MyDc"       "..\ActionVerbs\ZoneDoActionTypeOsBootData.MyDc"
@copy "..\ActionVerbs\Regular\ZoneDoActionTypeOsBootFixedRegular.MyDc"      "..\ActionVerbs\ZoneDoActionTypeOsBootFixed.MyDc"
@Echo -------- Mft and Dir
@copy "..\ActionVerbs\Regular\ZoneDoActionTypeOsDirRegular.MyDc"            "..\ActionVerbs\ZoneDoActionTypeOsDir.MyDc"
@copy "..\ActionVerbs\Regular\ZoneDoActionTypeOsMftRegular.MyDc"            "..\ActionVerbs\ZoneDoActionTypeOsMft.MyDc"
@copy "..\ActionVerbs\Regular\ZoneDoActionTypeOsPageHiberDumpRegular.MyDc"  "..\ActionVerbs\ZoneDoActionTypeOsPageHiberDump.MyDc"
@Echo -------- OS Boot ProgramHints
@copy "..\ActionVerbs\Regular\ZoneDoActionTypeOsProgramHintsDataRegular.MyDc"  "..\ActionVerbs\ZoneDoActionTypeOsProgramHints.MyDc"
@copy "..\ActionVerbs\Regular\ZoneDoActionTypeOsProgramHintsFixedRegular.MyDc" "..\ActionVerbs\ZoneDoActionTypeOsProgramHintsFixed.MyDc"
@Echo -------- Programs
@copy "..\ActionVerbs\Regular\ZoneDoActionTypeOsProgramsDataRegular.MyDc"      "..\ActionVerbs\ZoneDoActionTypeOsPrograms.MyDc"
@copy "..\ActionVerbs\Regular\ZoneDoActionTypeOsProgramsFixedRegular.MyDc"     "..\ActionVerbs\ZoneDoActionTypeOsProgramsFixed.MyDc"

@Echo -------- Set Mode to Regular
@copy "..\ActionVerbs\Regular\ZoneDoActionThisModeRegular.txt"                  "..\ActionVerbs\ZoneDoActionThisMode.txt"
@del "..\ActionVerbs\ZoneDoAction$ USING FAST MODE.txt" /Q

@Rem copy "..\ActionVerbs\Regular\ZoneDoActionTypeOsXRegular.MyDc" "..\ActionVerbs\ZoneDoActionTypeOsX.MyDc"
