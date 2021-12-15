@Echo off
@Echo . 
@Echo ------------------------------------------------------
@Echo - Command: DoStateRestore
@Echo ------------------------------------------------------
@TIMEOUT /T 1 /NOBREAK
@Echo ------------------------------------------------------
@Echo - Volume Type
    Copy "..\State\VolumeTypeSelect.MyDc" /Y "..\ActionVerbs\"
@Echo . 
@Echo - Automatic / Interactive
    Copy "..\State\ZoneDoActionAutomaticThis.MyDc" /Y "..\ActionVerbs\"
@Echo . 
@Echo - Common Sort Method (Date, Name, Access)  (Current)
@Echo . 

@Echo - Mode (Regular, Full, Fast, FastBoot)
Copy "..\State\Full\ZoneDoActionThisMode.MyDc" /Y "..\ActionVerbs\"

@Echo - Common Sort Method (Date, Name, Access) (Regular)
    Copy "..\State\ZoneDoActionTypeAll.MyDc" /Y "..\ActionVerbs\"
@Echo . 
@Echo - Boot
    Copy "..\State\ZoneDoActionTypeOsBootData.MyDc" /Y "..\ActionVerbs\"
@Echo . 
    Copy "..\State\ZoneDoActionTypeOsBootFixed.MyDc" /Y "..\ActionVerbs\"
@Echo . 
@Echo - MFT & Dir"s
    Copy "..\State\ZoneDoActionTypeOsDir.MyDc" /Y "..\ActionVerbs\"
@Echo . 
    Copy "..\State\ZoneDoActionTypeOsMft.MyDc" /Y "..\ActionVerbs\"

@Echo .  not alphabetical order below
@Echo - OS Files
    Copy "..\State\ZoneDoActionTypeOsPageHiberDump.MyDc" /Y "..\ActionVerbs\"
@Echo . 
@Echo - Boot Program Hints
    Copy "..\State\ZoneDoActionTypeOsProgramHints.MyDc" /Y "..\ActionVerbs\"
@Echo . 
    Copy "..\State\ZoneDoActionTypeOsProgramHintsData.MyDc" /Y "..\ActionVerbs\"
    Copy "..\State\ZoneDoActionTypeOsProgramHintsFixed.MyDc" /Y "..\ActionVerbs\"
@Echo . 
@Echo - OS Date files
    Copy "..\State\ZoneDoActionTypeOsPrograms.MyDc" /Y "..\ActionVerbs\"
@Echo . 
@Echo - Programs
    Copy "..\State\ZoneDoActionTypeOsProgramsData.MyDc" /Y "..\ActionVerbs\"
@Echo . 
    Copy "..\State\ZoneDoActionTypeOsProgramsFixed.MyDc" /Y "..\ActionVerbs\"
@Echo . 
@Echo - Gap (Current)
@Echo . 
    Copy "..\State\ZoneDoGapThis.MyDc" /Y "..\ActionVerbs\"
@Echo . 
@Echo - End of DoStateRestore -----------------
@TIMEOUT /T 1 /NOBREAK
