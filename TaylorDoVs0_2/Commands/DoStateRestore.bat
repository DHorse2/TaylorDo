@Echo off
@Echo -------- Command: DoStateRestore
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
@Echo 
@Echo --------------- Common Sort Method (Date, Name, Access)  (Current)
    Copy "..\State\ZoneDoActionThis.MyDc" /Y "..\ActionVerbs\"

@Echo --------------- Fast / Regular
    Copy "..\State\ZoneDoActionThisMode.MyDc" /Y "..\ActionVerbs\"

@Echo --------------- Common Sort Method (Date, Name, Access) (Regular)
    Copy "..\State\ZoneDoActionTypeAll.MyDc" /Y "..\ActionVerbs\"

@Echo --------------- Boot
    Copy "..\State\ZoneDoActionTypeOsBootData.MyDc" /Y "..\ActionVerbs\"

    Copy "..\State\ZoneDoActionTypeOsBootFixed.MyDc" /Y "..\ActionVerbs\"

@Echo --------------- MFT & Dir"s
    Copy "..\State\ZoneDoActionTypeOsDir.MyDc" /Y "..\ActionVerbs\"

    Copy "..\State\ZoneDoActionTypeOsMft.MyDc" /Y "..\ActionVerbs\"

@Echo  not alphabetical order below
@Echo --------------- OS Files
    Copy "..\State\ZoneDoActionTypeOsPageHiberDump.MyDc" /Y "..\ActionVerbs\"

@Echo --------------- Boot Program Hints
    Copy "..\State\ZoneDoActionTypeOsProgramHints.MyDc" /Y "..\ActionVerbs\"

    Copy "..\State\ZoneDoActionTypeOsProgramHintsData.MyDc" /Y "..\ActionVerbs\"
    Copy "..\State\ZoneDoActionTypeOsProgramHintsFixed.MyDc" /Y "..\ActionVerbs\"

@Echo --------------- OS Date files
    Copy "..\State\ZoneDoActionTypeOsPrograms.MyDc" /Y "..\ActionVerbs\"

@Echo --------------- Programs
    Copy "..\State\ZoneDoActionTypeOsProgramsData.MyDc" /Y "..\ActionVerbs\"

    Copy "..\State\ZoneDoActionTypeOsProgramsFixed.MyDc" /Y "..\ActionVerbs\"

@Echo --------------- Gap (Current)

    Copy "..\State\ZoneDoGapThis.MyDc" /Y "..\ActionVerbs\"
@Echo 
@Echo --------------- End of DoStateRestore -----------------
@TIMEOUT /T 1 /NOBREAK
