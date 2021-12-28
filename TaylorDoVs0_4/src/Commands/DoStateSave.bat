@Echo off
@Echo .
@Echo ------------------------------------------------------
@Echo - Command: DoStateSave
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
@Echo - Volume Type
    Copy "..\ActionVerbs\VolumeTypeSelect.MyDc" /Y "..\State\"
@Echo . 
@Echo - Automatic / Interactive
    Copy "..\ActionVerbs\ZoneDoActionAutomaticThis.MyDc" /Y "..\State\"
@Echo . 
@Echo - Common Sort Method (Date, Name, Access)  (Current)
    Copy "..\ActionVerbs\ZoneDoActionThis.MyDc" /Y "..\State\"
@Echo . 
@Echo - Mode (Regular, Full, Fast, FastBoot)
Copy "..\ActionVerbs\Full\ZoneDoActionThisMode.MyDc" /Y "..\State\"
@Echo . 
@Echo - Common Sort Method (Date, Name, Access) (Regular)
    Copy "..\ActionVerbs\ZoneDoActionTypeAll.MyDc" /Y "..\State\"
@Echo . 
@Echo - Boot
    Copy "..\ActionVerbs\ZoneDoActionTypeOsBootData.MyDc" /Y "..\State\"
    Copy "..\ActionVerbs\ZoneDoActionTypeOsBootFixed.MyDc" /Y "..\State\"
@Echo . 
@Echo - MFT and Dir"s
    Copy "..\ActionVerbs\ZoneDoActionTypeOsDir.MyDc" /Y "..\State\"
    Copy "..\ActionVerbs\ZoneDoActionTypeOsMft.MyDc" /Y "..\State\"
@Echo . 
@Rem  not alphabetical order below
@Echo - OS Files
    Copy "..\ActionVerbs\ZoneDoActionTypeOsPageHiberDump.MyDc" /Y "..\State\"
@Echo . 
@Echo - Boot Program Hints
    Copy "..\ActionVerbs\ZoneDoActionTypeOsProgramHints.MyDc" /Y "..\State\"
    Copy "..\ActionVerbs\ZoneDoActionTypeOsProgramHintsData.MyDc" /Y "..\State\"
    Copy "..\ActionVerbs\ZoneDoActionTypeOsProgramHintsFixed.MyDc" /Y "..\State\"
@Echo . 
@Echo - OS Date files
    Copy "..\ActionVerbs\ZoneDoActionTypeOsPrograms.MyDc" /Y "..\State\"
@Echo . 
@Echo - Programs
    Copy "..\ActionVerbs\ZoneDoActionTypeOsProgramsData.MyDc" /Y "..\State\"
@Echo . 
    Copy "..\ActionVerbs\ZoneDoActionTypeOsProgramsFixed.MyDc" /Y "..\State\"
@Echo . 
@Echo - Gap (Current)
@Echo . 
    Copy "..\ActionVerbs\ZoneDoGapThis.MyDc" /Y "..\State\"
@Echo - End of DoStateSave -----------------
@TIMEOUT /T 1 /NOBREAK
