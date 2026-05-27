@Echo Off
SetLocal

@Echo.
@Echo ------------------------------------------------------
@Echo - Command: DoStateSave
@Echo ------------------------------------------------------

@TIMEOUT /T 1 /NOBREAK >NUL

Call :CopyFile "Volume Type" "..\ActionVerbs\VolumeTypeSelect.MyDc"

Call :CopyFile "Automatic / Interactive" "..\ActionVerbs\ZoneDoActionAutomaticThis.MyDc"

Call :CopyFile "Common Sort Method (Date, Name, Access) (Current)" "..\ActionVerbs\ZoneDoActionThis.MyDc"

Rem THIS IS WRONG!!
@REM Call :CopyFile "Mode (Regular, Full, Fast, FastBoot)" "..\ActionVerbs\Full\ZoneDoActionThisModeFull.MyDc" "..\State\ZoneDoActionThisMode.MyDc"
Call :CopyFile "Mode (Regular, Full, Fast, FastBoot)" "..\ActionVerbs\ZoneDoActionThisMode.MyDc"

Call :CopyFile "Common Sort Method (Date, Name, Access) (Regular)" "..\ActionVerbs\ZoneDoActionTypeAll.MyDc"

Call :CopyFile "Boot" "..\ActionVerbs\ZoneDoActionTypeOsBootData.MyDc"
Call :CopyFile "Boot" "..\ActionVerbs\ZoneDoActionTypeOsBootFixed.MyDc"

Call :CopyFile "MFT and Dir's" "..\ActionVerbs\ZoneDoActionTypeOsDir.MyDc"
Call :CopyFile "MFT and Dir's" "..\ActionVerbs\ZoneDoActionTypeOsMft.MyDc"

@Rem not alphabetical order below

Call :CopyFile "OS Files" "..\ActionVerbs\ZoneDoActionTypeOsPageHiberDump.MyDc"

Call :CopyFile "Boot Program Hints" "..\ActionVerbs\ZoneDoActionTypeOsProgramHints.MyDc"
Call :CopyFile "Boot Program Hints" "..\ActionVerbs\ZoneDoActionTypeOsProgramHintsData.MyDc"
Call :CopyFile "Boot Program Hints" "..\ActionVerbs\ZoneDoActionTypeOsProgramHintsFixed.MyDc"

Call :CopyFile "OS Date files" "..\ActionVerbs\ZoneDoActionTypeOsPrograms.MyDc"

Call :CopyFile "Programs" "..\ActionVerbs\ZoneDoActionTypeOsProgramsData.MyDc"
Call :CopyFile "Programs" "..\ActionVerbs\ZoneDoActionTypeOsProgramsFixed.MyDc"

Call :CopyFile "Gap (Current)" "..\ActionVerbs\ZoneDoGapThis.MyDc"

@Echo.
@Echo - End of DoStateSave -----------------

@TIMEOUT /T 1 /NOBREAK >NUL

Goto :EOF


:CopyFile
Rem %1 = Description
Rem %2 = Source file
Rem %3 = Destination folder (optional)
Set "Dest=%~3"
Rem Default destination if empty
If "%Dest%"=="" Set "Dest=..\State\"
@Echo.
@Echo ------------------------------------------------------
@Echo - %~1 - %~nx2
Copy "%~2" /Y "%Dest%" >nul
Exit /B