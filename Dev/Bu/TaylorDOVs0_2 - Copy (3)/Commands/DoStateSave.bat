@Echo off
@Echo -------- Command: DoStateSave
@Echo -------- Repair MyDefrag Install

@Echo --------------- Common Sort Method (Date, Name, Access)  (Current)
    @Copy "..\ActionVerbs\ZoneDoActionThis.MyDc" /Y "..\State\"

@Echo --------------- Fast / Regular
    @Copy "..\ActionVerbs\ZoneDoActionThisMode.txt" /Y "..\State\"

@Echo --------------- Common Sort Method (Date, Name, Access) (Regular)
    @Copy "..\ActionVerbs\ZoneDoActionTypeAll.MyDc" /Y "..\State\"

@Echo --------------- Boot
    @Copy "..\ActionVerbs\ZoneDoActionTypeOsBootData.MyDc" /Y "..\State\"

    @Copy "..\ActionVerbs\ZoneDoActionTypeOsBootFixed.MyDc" /Y "..\State\"

@Echo --------------- MFT and Dir"s
    @Copy "..\ActionVerbs\ZoneDoActionTypeOsDir.MyDc" /Y "..\State\"

    @Copy "..\ActionVerbs\ZoneDoActionTypeOsMft.MyDc" /Y "..\State\"

@Rem  not alphabetical order below
@Echo --------------- OS Files
    @Copy "..\ActionVerbs\ZoneDoActionTypeOsPageHiberDump.MyDc" /Y "..\State\"

@Echo --------------- Boot Program Hints
    @Copy "..\ActionVerbs\ZoneDoActionTypeOsProgramHints.MyDc" /Y "..\State\"

    @Copy "..\ActionVerbs\ZoneDoActionTypeOsProgramHintsData.MyDc" /Y "..\State\"
    @Copy "..\ActionVerbs\ZoneDoActionTypeOsProgramHintsFixed.MyDc" /Y "..\State\"

@Echo --------------- OS Date files
    @Copy "..\ActionVerbs\ZoneDoActionTypeOsPrograms.MyDc" /Y "..\State\"

@Echo --------------- Programs
    @Copy "..\ActionVerbs\ZoneDoActionTypeOsProgramsData.MyDc" /Y "..\State\"

    @Copy "..\ActionVerbs\ZoneDoActionTypeOsProgramsFixed.MyDc" /Y "..\State\"

@Echo --------------- Gap (Current)

    @Copy "..\ActionVerbs\ZoneDoGapThis.MyDc" /Y "..\State\"

@Echo --------------- End -----------------
@pause
