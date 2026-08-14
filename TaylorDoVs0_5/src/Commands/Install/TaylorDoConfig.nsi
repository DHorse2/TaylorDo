;------------------------------------------------------------
; TaylorDo Drive Role Assignment
;------------------------------------------------------------
; "Author: David G Horsman"
; "Company: dba MacroDM"
; "Named in memory of Matt Taylor."
; "Copyright: 2015, 2019, 2020, 2021 David G Horsman"
; "License: Yet to be determined."

Unicode True

!include "MUI2.nsh"
!include "nsDialogs.nsh"
!include "LogicLib.nsh"
!include "FileFunc.nsh"
!include "WinMessages.nsh"
!include "x64.nsh"
!addplugindir 'C:\Program Files (x86)\NSIS\Plugins\x86-unicode'

SetCompressor lzma
OutFile "..\..\TaylorDoConfig.exe"
RequestExecutionLevel admin

;------------------------------------------------------------
; Function Globals
;------------------------------------------------------------
Var /GLOBAL ScriptState
!define PRODUCT_NAME "Taylor Disk Optimizer"
!define PRODUCT_VERSION "4.0.1.0"
!define PRODUCT_PUBLISHER "David G Horsman"
Var /GLOBAL ProductAppName
Var /GLOBAL ProductAppVersion
Var /GLOBAL ProductAppPublisher
Icon "..\..\resources\Icons\Taylor_Icon_-_DonnaDubinsky.ico"
Var /GLOBAL ProductAppInstallDir
Var /GLOBAL ScriptTimeStamp
Var /GLOBAL ScriptNow
;------------------------------------------------------------
Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
Caption "Matt Taylor Disk Optimizer"

RequestExecutionLevel Admin
XPStyle on
ShowInstDetails show

;------------------------------------------------------------
; Volume Type
Var /GLOBAL DriveLetter
Var /GLOBAL DriveCount
Var /GLOBAL DriveRoleChanged
Var /GLOBAL DriveRoleChangeReverting

;------------------------------------------------------------
; Volume Type
Var /GLOBAL VolumeType
Var /GLOBAL VolumeTypeName
Var /GLOBAL VolumeTypeNameLength

;------------------------------------------------------------
; SelectVolumeTypeForDrive
Var /GLOBAL VolumeTypePath
Var /GLOBAL VolumeTypeFileHandle

;------------------------------------------------------------
; LoadDriveRoles
Var /GLOBAL VolumeTypeHandle
Var /GLOBAL VolumeTypeOpenPath
Var /GLOBAL VolumeTypeLine
Var /GLOBAL VolumeTypeLineName
Var /GLOBAL VolumeTypeMatch

;------------------------------------------------------------
; SelectVolumeTypeForDrive
Var /GLOBAL VolumeTypeFindHandle
Var /GLOBAL VolumeTypeFindFile

;------------------------------------------------------------
; GetVolumeTypeFromName
Var /GLOBAL GvtfnInput
Var /GLOBAL GvtfnChar
Var /GLOBAL GvtfnResult

;------------------------------------------------------------
; PAGES
;------------------------------------------------------------
; Drive Roles Page
Var /GLOBAL DropListHandle
Var /GLOBAL ComboHandle

Var Dialog
Var RowY
Var LabelDrive
Var LabelType
Var LabelRole
Var NextButton

Var DriveLetter0
Var DriveLetter1
Var DriveLetter2
Var DriveLetter3
Var DriveLetter4
Var DriveLetter5
Var DriveLetter6
Var DriveLetter7
Var DriveLetter8
Var DriveLetter9

Var DriveType0
Var DriveType1
Var DriveType2
Var DriveType3
Var DriveType4
Var DriveType5
Var DriveType6
Var DriveType7
Var DriveType8
Var DriveType9

Var Combo0
Var Combo1
Var Combo2
Var Combo3
Var Combo4
Var Combo5
Var Combo6
Var Combo7
Var Combo8
Var Combo9

Var Role0
Var Role1
Var Role2
Var Role3
Var Role4
Var Role5
Var Role6
Var Role7
Var Role8
Var Role9

;------------------------------------------------------------
; Task Scheduler Page
Var CheckboxAllUsers
Var StateAllUsers
Var CheckboxEnableMyDefrag
Var CheckboxTaskRunOnce
Var CheckboxTaskDaily
Var CheckboxTaskWeekly
Var CheckboxTaskMonthly
Var CheckboxTaskYearly

Var EnableMyDefragSelected
Var TaskRunOnceSelected
Var TaskDailySelected
Var TaskWeeklySelected
Var TaskMonthlySelected
Var TaskYearlySelected
Var DriveScheduled

;------------------------------------------------------------
; Change Log Page
Var /GLOBAL MyLogText
Var /GLOBAL LogBox
Var /GLOBAL MyProgressBar
Var /GLOBAL MyStatusLabel
Var /GLOBAL LogLineCount

;------------------------------------------------------------
; Log Control
Var /GLOBAL LogHandle
Var /GLOBAL LogHandleOpen
Var /GLOBAL LogLoadHandle
Var /GLOBAL LogEnabled

;------------------------------------------------------------
; Function MUI Pages
;------------------------------------------------------------
; defines
!define MUI_ICON "..\..\resources\Icons\Taylor_Icon_-_DonnaDubinsky.ico"
!define MUI_UNICON "..\..\resources\Icons\Taylor_Icon_-_DonnaDubinsky.ico"
!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_BITMAP_NOSTRETCH "..\..\MattTaylorAndNumenta\1673821_235x235_ff1b1c - ForeverMissedCom - DonnaDubinsky.bmp"
!define MUI_ABORTWARNING
!define MUI_WELCOMEFINISHPAGE_BITMAP "..\..\Commands\Install\MyDefrag Run Zone 6 Small.bmp"
!define MUI_WELCOMEPAGE_TITLE "TaylorDo ${PRODUCT_VERSION} Configuration Wizard"
!define MUI_WELCOMEPAGE_TEXT "Welcome to the Taylor Disk Optimizer ${PRODUCT_VERSION}. This wizard will configure storage volumes and scheduled optimization for TaylorDo (Taylor Disk Optimizer), the next generation of the Windows disk optimization and defragmentation.$\r$\n$\r$\nTaylorDo works out of the box and tuned for the home user.$\r$\n$\r$\nBut it is designed for network system administration, is highly customizable and easy to change.$\r$\n$\r$\n$_CLICK"
;------------------------------------------------------------
; Function Pages
!insertmacro MUI_PAGE_WELCOME
Page Custom DriveRolesPageCreate DriveRolesPageLeave
Page Custom TaskSchedulerPageCreate TaskSchedulerPageLeave
!insertmacro MUI_PAGE_INSTFILES
Page Custom ChangeLogPageCreate ChangeLogPageLeave
!define MUI_FINISHPAGE_NOAUTOCLOSE
!insertmacro MUI_PAGE_FINISH
!insertmacro MUI_LANGUAGE "English"

;------------------------------------------------------------
; Function Section
;------------------------------------------------------------

Section "Main"
    Call PrintLogFileToDetails
SectionEnd

;------------------------------------------------------------
; Function Macros
;------------------------------------------------------------

!macro GetNow outVar
    Call GetTimeStamp
    Pop ${outVar}
!macroend

Function LogText
    Exch $0          ; $0 = MSG (popped from stack)
    Push $0
    Call Log
FunctionEnd

; !macro LogText MSG
;     Push "${MSG}"
;     Call Log
; !macroend

!macro FuncEntry NAME
    ; Usage:
    ;     !insertmacro FuncEntry "LoadLogFile"
    ; Currently off:
    ; MessageBox MB_OKCANCEL "Function: ${NAME}" IDOK +2
    ;     Abort
    ; Log function
    Push "Function: ${NAME}"
    Call LogText
!macroend

;------------------------------------------------------------
; Functions
;------------------------------------------------------------

Function LoadLogFile
    !insertmacro FuncEntry "LoadLogFile"

    StrCpy $LogLineCount 0

    ${If} $LogEnabled == 0
        ${NSD_SetText} $LogBox ""
        Goto Finish
    ${EndIf}

    ${If} $LogHandleOpen == 1
        Call CloseLog
    ${EndIf}

    IfFileExists "$INSTDIR\log\TaylorDo_Config.log" 0 Finish
    FileOpen $LogLoadHandle "$INSTDIR\log\TaylorDo_Config.log" r

Loop:
    FileRead $LogLoadHandle $1
    IfErrors Done

    IntOp $LogLineCount $LogLineCount + 1

    ${NSD_GetText} $LogBox $2
    StrCpy $2 "$2$\r$\n$1"
    ${NSD_SetText} $LogBox "$2"
    Goto Loop

Done:
    FileClose $LogLoadHandle

Finish:
    ClearErrors
    ${If} $LogEnabled == 1
        Call OpenLog
    ${EndIf}
    !insertmacro FuncEntry "LoadLogFile Lines: $LogLineCount"

FunctionEnd

;------------------------------------------------------------

Function PrintLogFileToDetails
    ${If} $LogEnabled == 0
        Return
    ${EndIf}

    ${If} $LogHandleOpen == 1
        Call CloseLog
    ${EndIf}

    IfFileExists "$INSTDIR\log\TaylorDo_Config.log" 0 Finish
    FileOpen $LogLoadHandle "$INSTDIR\log\TaylorDo_Config.log" r

Loop:
    FileRead $LogLoadHandle $1
    IfErrors Done

    DetailPrint "$1"
    Goto Loop

Done:
    FileClose $LogLoadHandle

Finish:
    ClearErrors
    ${If} $LogEnabled == 1
        Call OpenLog
    ${EndIf}
FunctionEnd

;------------------------------------------------------------

Function OpenLog
    ; MessageBox MB_OKCANCEL "Function: OpenLog" IDOK +2
    ;     Abort

    FileOpen $LogHandle "$INSTDIR\log\TaylorDo_Config.log" a
    StrCpy $LogHandleOpen 1
FunctionEnd

;------------------------------------------------------------

Function InitLog
    ; MessageBox MB_OKCANCEL "Function: InitLog" IDOK +2
    ;     Abort
    StrCpy $LogEnabled 1
    CreateDirectory "$INSTDIR\log"
    Delete "$INSTDIR\log\TaylorDo_Config.log"
    Call OpenLog
    FileWrite $LogHandle "===== NEW RUN =====$\r$\n"
    !insertmacro FuncEntry "InitLog"
FunctionEnd

;------------------------------------------------------------

Function Log
    ; NO FuncEntry here - would recurse infinitely
    ; MessageBox MB_OKCANCEL "Function: Log" IDOK +2
    ;     Abort

    Exch $R0

    ${If} $LogEnabled == 0
        Pop $R0
        Return
    ${EndIf}

    ${If} $LogHandleOpen == 0
        Call OpenLog
    ${EndIf}

    Push $R1
    StrCpy $R1 $R0
    !insertmacro GetNow $ScriptNow
    FileWrite $LogHandle "$ScriptNow - $R1$\r$\n"
    Pop $R1
    Pop $R0

FunctionEnd

;------------------------------------------------------------

Function CloseLog
    !insertmacro FuncEntry "CloseLog"
    FileClose $LogHandle
    StrCpy $LogHandleOpen 0
FunctionEnd

;------------------------------------------------------------

Function .onInit
    ; MessageBox MB_OKCANCEL "Function: .onInit" IDOK +2
    ;     Abort

    StrCpy $ScriptTimeStamp $ScriptNow
    StrCpy $ScriptState "Edit"
    StrCpy $LogHandleOpen 0
    ReadRegStr $INSTDIR HKLM "Software\${PRODUCT_NAME}" "Install_Dir"
    ${If} $INSTDIR == ""
        StrCpy $INSTDIR "$EXEDIR"
    ${EndIf}

    Call InitializeSettings

    !insertmacro FuncEntry "onInit"
    Push "TaylorDoConfig started $ScriptTimeStamp"
    Call LogText
    Push "--------------------------------------------------"
    Call LogText
    Push 'EXEDIR = "$EXEDIR"'
    Call LogText
    Push 'INSTDIR initialized to: "$INSTDIR"'
    Call LogText
    Push "Output logging open"
    Call LogText
    Push "--------------------------------------------------"
    Call LogText

FunctionEnd

;------------------------------------------------------------

Function InitializeSettings
    StrCpy $LogEnabled 1
    Call InitLog
    !insertmacro FuncEntry "InitializeSettings"

    StrCpy $ProductAppName "MyDefrag"
    StrCpy $ProductAppVersion "4.3.1"
    StrCpy $ProductAppPublisher "J.C. Kessels"

    ${If} ${RunningX64}
        SetRegView 64
        StrCpy $ProductAppInstallDir "$PROGRAMFILES64\MyDefrag v4.3.1"
    ${Else}
        StrCpy $ProductAppInstallDir "$PROGRAMFILES\MyDefrag v4.3.1"
    ${EndIf}

    StrCpy $DriveRoleChanged 0
    StrCpy $DriveRoleChangeReverting 0
    StrCpy $StateAllUsers ${BST_CHECKED}
    Call LoadTaskSchedulerSettings
FunctionEnd

;------------------------------------------------------------

Function LoadDriveRoles
    !insertmacro FuncEntry "LoadDriveRoles"

    Exch $R0
    StrCpy $ComboHandle $R0

    Push "LoadDriveRoles()"
    Call LogText
    Push "  Combo Handle = $ComboHandle"
    Call LogText

    ${NSD_CB_AddString} $ComboHandle "SKIP"
    Push "  Added dropdown item: SKIP"
    Call LogText

    FindFirst $VolumeTypeHandle $2 "$INSTDIR\VolumeType\VolumeType*.MyDc"

LoopVolumeTypes:
    StrCmp $2 "" DoneVolumeTypes

    Push "  Found file: $2"
    Call LogText

    StrCpy $3 $2 "" 10
    Push "    After prefix strip = $3"
    Call LogText

    StrLen $4 $3
    IntOp $4 $4 - 5
    StrCpy $3 $3 $4

    Push "    Final VolumeType = $3"
    Call LogText

    Push $3
    Call IsAssignableVolumeType
    Pop $4

    Push "    Assignable = $4"
    Call LogText

    ${If} $4 == 1
        ${NSD_CB_AddString} $ComboHandle "$3"
        Push "    Added dropdown item: $3"
        Call LogText
    ${Else}
        Push "    Skipped invalid VolumeType: $3"
        Call LogText
    ${EndIf}

    FindNext $VolumeTypeHandle $2
    Goto LoopVolumeTypes

DoneVolumeTypes:
    FindClose $VolumeTypeHandle
    Push "LoadDriveRoles() complete"
    Call LogText
    Pop $R0
FunctionEnd

;------------------------------------------------------------

Function SaveDriveRoles
    !insertmacro FuncEntry "SaveDriveRoles"

    Push "--------------------------------------------------"
    Call LogText
    Push "SaveDriveRoles() INSTDIR = $INSTDIR"
    Call LogText

    CreateDirectory "$INSTDIR\VolumeType"

    ${If} $DriveCount > 0
        ${NSD_GetText} $Combo0 $Role0
        ; StrCpy $Role0 $0
        Push "Processing: $DriveLetter0 => $Role0"
        Call LogText
        WriteINIStr "$INSTDIR\DriveRoles.ini" "DriveRoles" "$DriveLetter0" "$Role0"
        FileOpen $R9 "$INSTDIR\VolumeType\VolumeType$Role0.MyDc" w
        ${If} $Role0 != "SKIP"
            FileWrite $R9 "Name($DriveLetter0)"
            Push "Wrote VolumeType$Role0.MyDc: Name($DriveLetter0)"
            Call LogText
        ${Else}
            FileWrite $R9 "SKIP"
            Push "Skipping $DriveLetter0 (SKIP)"
            Call LogText
        ${EndIf}
        FileClose $R9
    ${EndIf}

    ${If} $DriveCount > 1
        ${NSD_GetText} $Combo1 $Role1
        ; StrCpy $Role1 $0
        Push "Processing: $DriveLetter1 => $Role1"
        Call LogText
        WriteINIStr "$INSTDIR\DriveRoles.ini" "DriveRoles" "$DriveLetter1" "$Role1"
        FileOpen $R9 "$INSTDIR\VolumeType\VolumeType$Role1.MyDc" w
        ${If} $Role1 != "SKIP"
            FileWrite $R9 "Name($DriveLetter1)"
            Push "Wrote VolumeType$Role1.MyDc: Name($DriveLetter1)"
            Call LogText
        ${Else}
            FileWrite $R9 "SKIP"
            Push "Skipping $DriveLetter1 (SKIP)"
            Call LogText
        ${EndIf}
        FileClose $R9
    ${EndIf}

    ${If} $DriveCount > 2
        ${NSD_GetText} $Combo2 $Role2
        ; StrCpy $Role2 $0
        Push "Processing: $DriveLetter2 => $Role2"
        Call LogText
        WriteINIStr "$INSTDIR\DriveRoles.ini" "DriveRoles" "$DriveLetter2" "$Role2"
        FileOpen $R9 "$INSTDIR\VolumeType\VolumeType$Role2.MyDc" w
        ${If} $Role2 != "SKIP"
            FileWrite $R9 "Name($DriveLetter2)"
            Push "Wrote VolumeType$Role2.MyDc: Name($DriveLetter2)"
            Call LogText
        ${Else}
            FileWrite $R9 "SKIP"
            Push "Skipping $DriveLetter2 (SKIP)"
            Call LogText
        ${EndIf}
        FileClose $R9
    ${EndIf}

    ${If} $DriveCount > 3
        ${NSD_GetText} $Combo3 $Role3
        ; StrCpy $Role3 $0
        Push "Processing: $DriveLetter3 => $Role3"
        Call LogText
        WriteINIStr "$INSTDIR\DriveRoles.ini" "DriveRoles" "$DriveLetter3" "$Role3"
        FileOpen $R9 "$INSTDIR\VolumeType\VolumeType$Role3.MyDc" w
        ${If} $Role3 != "SKIP"
            FileWrite $R9 "Name($DriveLetter3)"
            Push "Wrote VolumeType$Role3.MyDc: Name($DriveLetter3)"
            Call LogText
        ${Else}
            FileWrite $R9 "SKIP"
            Push "Skipping $DriveLetter3 (SKIP)"
            Call LogText
        ${EndIf}
        FileClose $R9
    ${EndIf}

    ${If} $DriveCount > 4
        ${NSD_GetText} $Combo4 $Role4
        ; StrCpy $Role4 $0
        Push "Processing: $DriveLetter4 => $Role4"
        Call LogText
        WriteINIStr "$INSTDIR\DriveRoles.ini" "DriveRoles" "$DriveLetter4" "$Role4"
        FileOpen $R9 "$INSTDIR\VolumeType\VolumeType$Role4.MyDc" w
        ${If} $Role4 != "SKIP"
            FileWrite $R9 "Name($DriveLetter4)"
            Push "Wrote VolumeType$Role4.MyDc: Name($DriveLetter4)"
            Call LogText
        ${Else}
            FileWrite $R9 "SKIP"
            Push "Skipping $DriveLetter4 (SKIP)"
            Call LogText
        ${EndIf}
        FileClose $R9
    ${EndIf}

    ${If} $DriveCount > 5
        ${NSD_GetText} $Combo5 $Role5
        ; StrCpy $Role5 $0
        Push "Processing: $DriveLetter5 => $Role5"
        Call LogText
        WriteINIStr "$INSTDIR\DriveRoles.ini" "DriveRoles" "$DriveLetter5" "$Role5"
        FileOpen $R9 "$INSTDIR\VolumeType\VolumeType$Role5.MyDc" w
        ${If} $Role5 != "SKIP"
            FileWrite $R9 "Name($DriveLetter5)"
            Push "Wrote VolumeType$Role5.MyDc: Name($DriveLetter5)"
            Call LogText
        ${Else}
            FileWrite $R9 "SKIP"
            Push "Skipping $DriveLetter5 (SKIP)"
            Call LogText
        ${EndIf}
        FileClose $R9
    ${EndIf}

    ${If} $DriveCount > 6
        ${NSD_GetText} $Combo6 $Role6
        ; StrCpy $Role6 $0
        Push "Processing: $DriveLetter6 => $Role6"
        Call LogText
        WriteINIStr "$INSTDIR\DriveRoles.ini" "DriveRoles" "$DriveLetter6" "$Role6"
        FileOpen $R9 "$INSTDIR\VolumeType\VolumeType$Role6.MyDc" w
        ${If} $Role6 != "SKIP"
            FileWrite $R9 "Name($DriveLetter6)"
            Push "Wrote VolumeType$Role6.MyDc: Name($DriveLetter6)"
            Call LogText
        ${Else}
            FileWrite $R9 "SKIP"
            Push "Skipping $DriveLetter6 (SKIP)"
            Call LogText
        ${EndIf}
        FileClose $R9
    ${EndIf}

    ${If} $DriveCount > 7
        ${NSD_GetText} $Combo7 $Role7
        ; StrCpy $Role7 $0
        Push "Processing: $DriveLetter7 => $Role7"
        Call LogText
        WriteINIStr "$INSTDIR\DriveRoles.ini" "DriveRoles" "$DriveLetter7" "$Role7"
        FileOpen $R9 "$INSTDIR\VolumeType\VolumeType$Role7.MyDc" w
        ${If} $Role7 != "SKIP"
            FileWrite $R9 "Name($DriveLetter7)"
            Push "Wrote VolumeType$Role7.MyDc: Name($DriveLetter7)"
            Call LogText
        ${Else}
            FileWrite $R9 "SKIP"
            Push "Skipping $DriveLetter7 (SKIP)"
            Call LogText
        ${EndIf}
        FileClose $R9
    ${EndIf}

    ${If} $DriveCount > 8
        ${NSD_GetText} $Combo8 $Role8
        ; StrCpy $Role8 $0
        Push "Processing: $DriveLetter8 => $Role8"
        Call LogText
        WriteINIStr "$INSTDIR\DriveRoles.ini" "DriveRoles" "$DriveLetter8" "$Role8"
        FileOpen $R9 "$INSTDIR\VolumeType\VolumeType$Role8.MyDc" w
        ${If} $Role8 != "SKIP"
            FileWrite $R9 "Name($DriveLetter8)"
            Push "Wrote VolumeType$Role8.MyDc: Name($DriveLetter8)"
            Call LogText
        ${Else}
            FileWrite $R9 "SKIP"
            Push "Skipping $DriveLetter8 (SKIP)"
            Call LogText
        ${EndIf}
        FileClose $R9
    ${EndIf}

    ${If} $DriveCount > 9
        ${NSD_GetText} $Combo9 $Role9
        ; StrCpy $Role9 $0
        Push "Processing: $DriveLetter9 => $Role9"
        Call LogText
        WriteINIStr "$INSTDIR\DriveRoles.ini" "DriveRoles" "$DriveLetter9" "$Role9"
        FileOpen $R9 "$INSTDIR\VolumeType\VolumeType$Role9.MyDc" w
        ${If} $Role9 != "SKIP"
            FileWrite $R9 "Name($DriveLetter9)"
            Push "Wrote VolumeType$Role9.MyDc: Name($DriveLetter9)"
            Call LogText
        ${Else}
            FileWrite $R9 "SKIP"
            Push "Skipping $DriveLetter9 (SKIP)"
            Call LogText
        ${EndIf}
        FileClose $R9
    ${EndIf}

Push "SaveDriveRoles() COMPLETE"
Call LogText
Push "--------------------------------------------------"
Call LogText

FunctionEnd

;------------------------------------------------------------

Function IsAssignableVolumeType
    !insertmacro FuncEntry "IsAssignableVolumeType"

    Exch $0
    Push $1
    StrCpy $1 0

    ${If} $0 == "Sys"
        StrCpy $1 1
    ${ElseIf} $0 == "Dev"
        StrCpy $1 1
    ${ElseIf} $0 == "Data"
        StrCpy $1 1
    ${ElseIf} $0 == "Archive"
        StrCpy $1 1
    ${EndIf}

    StrCpy $0 $1
    Pop $1
    Exch $0
FunctionEnd

;------------------------------------------------------------
; GetVolumeTypeFromName
; Input:  full path on stack, e.g. "D:\...\VolumeType\VolumeTypeArchive.txt"
; Output: type name on stack, e.g. "Archive"
;         returns "" if filename doesn't match expected pattern
;------------------------------------------------------------
Function GetVolumeTypeFromName
    Pop $GvtfnInput

    ; !insertmacro LogText "Function: GetVolumeTypeFromName"

    ; strip directory to just filename
    ${GetFileName} "$GvtfnInput" $GvtfnResult

    Push "    -------------------------------------------"
    Call LogText
    ; Push "Function: GetVolumeTypeFromName"
    ; Call LogText
    ; Push "    Name = $GvtfnResult"
    ; Call LogText

    ; $GvtfnResult = "VolumeTypeArchive.txt"
    ; strip leading "VolumeType" (10 chars)
    StrCpy $GvtfnChar $GvtfnResult 10
    StrCmp $GvtfnChar "VolumeType" +2
        StrCpy $GvtfnResult ""
    StrCpy $GvtfnResult $GvtfnResult "" 10
    ; Push "    Name = $GvtfnResult, Suffix = $GvtfnResult"
    ; Call LogText

    ; strip trailing ".MyDc" (5 chars)
    StrLen $GvtfnChar $GvtfnResult
    IntOp $GvtfnChar $GvtfnChar - 5
    StrCpy $GvtfnResult $GvtfnResult $GvtfnChar
    Push "    GetVolumeTypeFromName: Name = $GvtfnResult, Suffix = $GvtfnResult, Type = $GvtfnResult"
    Call LogText

    Push $GvtfnResult
FunctionEnd

;------------------------------------------------------------

Function SelectVolumeTypeForDrive
    ; !insertmacro LogText "Function: SelectVolumeTypeForDrive"

    ;   top    = drive letter
    ; Exch $0
    ; StrCpy $DriveLetter $0
    Pop $DriveLetter

    Push "    Volume = SelectVolumeTypeForDrive: $DriveLetter"
    Call LogText

    ; Not solid. Moved back to calling function.
    ; ${NSD_CB_SelectString} $DropListHandle "SKIP"

    StrCpy $VolumeTypeLineName "Name($DriveLetter)"
    Push "    Search token = $VolumeTypeLineName"
    Call LogText

    FindFirst $VolumeTypeFindHandle $VolumeTypeFindFile \
        "$INSTDIR\VolumeType\VolumeType*.MyDc"

LoopFiles:
    StrCmp $VolumeTypeFindFile "" DoneNotFound

    Push $VolumeTypeFindFile
    Call GetVolumeTypeFromName
    Pop $VolumeType
    
    ; check if VolumeType is a single letter A-Z (invalid role name)
    StrLen $VolumeTypeNameLength $VolumeType
    IntCmp $VolumeTypeNameLength 1 SkipFile SkipFile +1  ; only proceed if length more than 1

ReadLine:
    StrCpy $VolumeTypePath "$INSTDIR\VolumeType\"
    StrCpy $VolumeTypePath "$VolumeTypePath$VolumeTypeFindFile"

;  ReadLine:
    StrCpy $VolumeTypeOpenPath $VolumeTypePath

    Push '  Checking file: "$VolumeTypePath"'
    Call LogText

    FileOpen $VolumeTypeFileHandle $VolumeTypeOpenPath r
    IfErrors SkipFile

    ; Push "    Opened, reading data"
    ; Call LogText
    FileRead $VolumeTypeFileHandle $VolumeTypeLine
    FileClose $VolumeTypeFileHandle

    ; ValidFileData:
    Push "    $VolumeType Closed, Line = $VolumeTypeLine match to $VolumeTypeLineName"
    Call LogText

    Push $VolumeTypeLine
    Push $VolumeTypeLineName
    Call FindSubstring
    Pop $VolumeTypeMatch

    Push "    Match = $VolumeTypeMatch"
    Call LogText

    ${If} $VolumeTypeMatch == 1
       ;------------------------------------------------------------
        Push "  MATCH FOUND: $VolumeTypeLineName"
        Call LogText
        ; FileClose $VolumeTypeFileHandle
        Goto Done
    ${EndIf}

    Goto NextFile

InvalidFileData:
    ; ------------------------------------------------------------
    Push "  INVALID DATA: $VolumeTypeFindFile ($VolumeTypeLine)"
    Call LogText
    Goto NextFile

CloseFile:
    ; FileClose $VolumeTypeFileHandle 

SkipFile:
    Push "      File Skipped: $VolumeType"
    Call LogText

NextFile:
    FindNext $VolumeTypeFindHandle $VolumeTypeFindFile
    StrCmp $VolumeTypeFindFile "" DoneNotFound
    Goto LoopFiles

DoneNotFound:
    StrCpy $VolumeType "SKIP"

Done:
    FindClose $VolumeTypeFindHandle
    StrCpy $VolumeTypeFindHandle ""
    StrCpy $VolumeTypeFindFile ""
    Push "  Finished Volume Type: $VolumeType"
    Call LogText
FunctionEnd

;------------------------------------------------------------
; DetectFixedDriveMediaType
; Input: drive letter on stack, e.g. "C:"
; Output: "SSD", "HDD", or "Fixed" on stack.
;------------------------------------------------------------
Function DetectFixedDriveMediaType
    Exch $0
    Push $1
    Push $2
    Push $3

    StrCpy $1 "Fixed"

    nsExec::ExecToStack 'cmd /c fsutil fsinfo sectorinfo $0 2>nul | find /I "Trim Supported"'
    Pop $2
    Pop $3

    ${If} $2 == 0
        StrCpy $1 "SSD"
        Goto DetectFixedDriveMediaTypeDone
    ${EndIf}

    nsExec::ExecToStack 'cmd /c fsutil fsinfo sectorinfo $0 2>nul | find /I "Trim Not Supported"'
    Pop $2
    Pop $3

    ${If} $2 == 0
        StrCpy $1 "HDD"
    ${EndIf}

DetectFixedDriveMediaTypeDone:
    StrCpy $0 $1

    Pop $3
    Pop $2
    Pop $1
    Exch $0
FunctionEnd

;------------------------------------------------------------
; Task Scheduler Configuration
;------------------------------------------------------------

Function LoadTaskSchedulerSettings
    ; Defaults used when TaylorDo has not been configured yet.
    StrCpy $EnableMyDefragSelected ${BST_CHECKED}
    StrCpy $TaskRunOnceSelected ${BST_CHECKED}
    StrCpy $TaskDailySelected ${BST_UNCHECKED}
    StrCpy $TaskWeeklySelected ${BST_CHECKED}
    StrCpy $TaskMonthlySelected ${BST_CHECKED}
    StrCpy $TaskYearlySelected ${BST_CHECKED}

    IfFileExists "$INSTDIR\DriveRoles.ini" 0 LoadTaskSchedulerSettingsDone

    ReadINIStr $0 "$INSTDIR\DriveRoles.ini" "DriveScheduled" "WindowsDefrag"
    ${If} $0 == "ENABLED"
        StrCpy $EnableMyDefragSelected ${BST_UNCHECKED}
    ${ElseIf} $0 == "DISABLED"
        StrCpy $EnableMyDefragSelected ${BST_CHECKED}
    ${EndIf}

    ReadINIStr $0 "$INSTDIR\DriveRoles.ini" "DriveScheduled" "TaylorDoRunOnce"
    ${If} $0 == "ENABLED"
        StrCpy $TaskRunOnceSelected ${BST_CHECKED}
    ${ElseIf} $0 == "DISABLED"
        StrCpy $TaskRunOnceSelected ${BST_UNCHECKED}
    ${EndIf}

    ReadINIStr $0 "$INSTDIR\DriveRoles.ini" "DriveScheduled" "TaylorDoDaily"
    ${If} $0 == "ENABLED"
        StrCpy $TaskDailySelected ${BST_CHECKED}
    ${ElseIf} $0 == "DISABLED"
        StrCpy $TaskDailySelected ${BST_UNCHECKED}
    ${EndIf}

    ReadINIStr $0 "$INSTDIR\DriveRoles.ini" "DriveScheduled" "TaylorDoWeekly"
    ${If} $0 == "ENABLED"
        StrCpy $TaskWeeklySelected ${BST_CHECKED}
    ${ElseIf} $0 == "DISABLED"
        StrCpy $TaskWeeklySelected ${BST_UNCHECKED}
    ${EndIf}

    ReadINIStr $0 "$INSTDIR\DriveRoles.ini" "DriveScheduled" "TaylorDoMonthly"
    ${If} $0 == "ENABLED"
        StrCpy $TaskMonthlySelected ${BST_CHECKED}
    ${ElseIf} $0 == "DISABLED"
        StrCpy $TaskMonthlySelected ${BST_UNCHECKED}
    ${EndIf}

    ; Preserve compatibility with the existing key name containing a space.
    ReadINIStr $0 "$INSTDIR\DriveRoles.ini" "DriveScheduled" "TaylorDo Yearly"
    ${If} $0 == "ENABLED"
        StrCpy $TaskYearlySelected ${BST_CHECKED}
    ${ElseIf} $0 == "DISABLED"
        StrCpy $TaskYearlySelected ${BST_UNCHECKED}
    ${EndIf}

LoadTaskSchedulerSettingsDone:
FunctionEnd

Function TaskSchedulerPageCreate
    !insertmacro MUI_HEADER_TEXT \
        "TaylorDo Scheduled Tasks" \
        "Configure automatic TaylorDo optimization. These settings can be changed whenever TaylorDoConfig is run."

    nsDialogs::Create 1018
    Pop $Dialog

    ${If} $Dialog == error
        Abort
    ${EndIf}

    ${NSD_CreateLabel} 0 0 100% 12u "Select scheduled optimization options:"
    Pop $0

    ${NSD_CreateCheckbox} 0 20u 100% 12u "Enable MyDefrag in Task Scheduler"
    Pop $CheckboxEnableMyDefrag
    ${NSD_SetState} $CheckboxEnableMyDefrag $EnableMyDefragSelected
    ${NSD_OnClick} $CheckboxEnableMyDefrag TaskSchedulerMyDefragChanged

    ${NSD_CreateCheckbox} 10u 35u 100% 12u "Run once overnight (recommended)"
    Pop $CheckboxTaskRunOnce
    ${NSD_SetState} $CheckboxTaskRunOnce $TaskRunOnceSelected
    ${NSD_OnClick} $CheckboxTaskRunOnce TaskSchedulerRunOnceChanged

    ${NSD_CreateCheckbox} 10u 50u 100% 12u "Daily Optimization (not recommended)"
    Pop $CheckboxTaskDaily
    ${NSD_SetState} $CheckboxTaskDaily $TaskDailySelected
    ${NSD_OnClick} $CheckboxTaskDaily TaskSchedulerDailyChanged

    ${NSD_CreateCheckbox} 10u 65u 100% 12u "Weekly Optimization"
    Pop $CheckboxTaskWeekly
    ${NSD_SetState} $CheckboxTaskWeekly $TaskWeeklySelected
    ${NSD_OnClick} $CheckboxTaskWeekly TaskSchedulerWeeklyChanged

    ${NSD_CreateCheckbox} 10u 80u 100% 12u "Monthly Optimization (recommended)"
    Pop $CheckboxTaskMonthly
    ${NSD_SetState} $CheckboxTaskMonthly $TaskMonthlySelected
    ${NSD_OnClick} $CheckboxTaskMonthly TaskSchedulerMonthlyChanged

    ${NSD_CreateCheckbox} 10u 95u 100% 12u "Yearly Optimization (recommended)"
    Pop $CheckboxTaskYearly
    ${NSD_SetState} $CheckboxTaskYearly $TaskYearlySelected
    ${NSD_OnClick} $CheckboxTaskYearly TaskSchedulerYearlyChanged

    ${NSD_CreateCheckbox} 0u 120u 100% 12u "Configure for all users"
    Pop $CheckboxAllUsers
    ${NSD_SetState} $CheckboxAllUsers $StateAllUsers
    ${NSD_OnClick} $CheckboxAllUsers TaskSchedulerAllUsersChanged

    Call SetTaskSchedulerChildState
    nsDialogs::Show
FunctionEnd

Function SetTaskSchedulerChildState
    ${NSD_GetState} $CheckboxEnableMyDefrag $0

    ${If} $0 == ${BST_CHECKED}
        EnableWindow $CheckboxTaskRunOnce 1
        EnableWindow $CheckboxTaskDaily 1
        EnableWindow $CheckboxTaskWeekly 1
        EnableWindow $CheckboxTaskMonthly 1
        EnableWindow $CheckboxTaskYearly 1
    ${Else}
        EnableWindow $CheckboxTaskRunOnce 0
        EnableWindow $CheckboxTaskDaily 0
        EnableWindow $CheckboxTaskWeekly 0
        EnableWindow $CheckboxTaskMonthly 0
        EnableWindow $CheckboxTaskYearly 0
    ${EndIf}
FunctionEnd

Function TaskSchedulerMyDefragChanged
    Pop $0
    ${NSD_GetState} $0 $EnableMyDefragSelected
    ${If} $EnableMyDefragSelected == ${BST_CHECKED}
        Push "Task Scheduler setting changed: Enable MyDefrag in Task Scheduler = ENABLED"
    ${Else}
        Push "Task Scheduler setting changed: Enable MyDefrag in Task Scheduler = DISABLED"
    ${EndIf}
    Call LogText
    Call SetTaskSchedulerChildState
FunctionEnd

Function TaskSchedulerRunOnceChanged
    Pop $0
    ${NSD_GetState} $0 $TaskRunOnceSelected
    ${If} $TaskRunOnceSelected == ${BST_CHECKED}
        Push "Task Scheduler setting changed: Run once overnight = ENABLED"
    ${Else}
        Push "Task Scheduler setting changed: Run once overnight = DISABLED"
    ${EndIf}
    Call LogText
FunctionEnd

Function TaskSchedulerDailyChanged
    Pop $0
    ${NSD_GetState} $0 $TaskDailySelected
    ${If} $TaskDailySelected == ${BST_CHECKED}
        Push "Task Scheduler setting changed: Daily Optimization = ENABLED"
    ${Else}
        Push "Task Scheduler setting changed: Daily Optimization = DISABLED"
    ${EndIf}
    Call LogText
FunctionEnd

Function TaskSchedulerWeeklyChanged
    Pop $0
    ${NSD_GetState} $0 $TaskWeeklySelected
    ${If} $TaskWeeklySelected == ${BST_CHECKED}
        Push "Task Scheduler setting changed: Weekly Optimization = ENABLED"
    ${Else}
        Push "Task Scheduler setting changed: Weekly Optimization = DISABLED"
    ${EndIf}
    Call LogText
FunctionEnd

Function TaskSchedulerMonthlyChanged
    Pop $0
    ${NSD_GetState} $0 $TaskMonthlySelected
    ${If} $TaskMonthlySelected == ${BST_CHECKED}
        Push "Task Scheduler setting changed: Monthly Optimization = ENABLED"
    ${Else}
        Push "Task Scheduler setting changed: Monthly Optimization = DISABLED"
    ${EndIf}
    Call LogText
FunctionEnd

Function TaskSchedulerYearlyChanged
    Pop $0
    ${NSD_GetState} $0 $TaskYearlySelected
    ${If} $TaskYearlySelected == ${BST_CHECKED}
        Push "Task Scheduler setting changed: Yearly Optimization = ENABLED"
    ${Else}
        Push "Task Scheduler setting changed: Yearly Optimization = DISABLED"
    ${EndIf}
    Call LogText
FunctionEnd

Function TaskSchedulerAllUsersChanged
    Pop $0
    ${NSD_GetState} $0 $StateAllUsers
    ${If} $StateAllUsers == ${BST_CHECKED}
        Push "Task Scheduler setting changed: Configure for all users = ENABLED"
    ${Else}
        Push "Task Scheduler setting changed: Configure for all users = DISABLED"
    ${EndIf}
    Call LogText
FunctionEnd

Function LogTaskSchedulerFinalSettings
    Push "Task Scheduler settings final selection:"
    Call LogText

    ${If} $EnableMyDefragSelected == ${BST_CHECKED}
        Push "  Enable MyDefrag in Task Scheduler = ENABLED"
        Call LogText
        Push "  Windows Defrag Schedule = DISABLED"
        Call LogText
    ${Else}
        Push "  Enable MyDefrag in Task Scheduler = DISABLED"
        Call LogText
        Push "  Windows Defrag Schedule = ENABLED"
        Call LogText
    ${EndIf}

    ${If} $TaskRunOnceSelected == ${BST_CHECKED}
        Push "  Run once overnight = ENABLED"
    ${Else}
        Push "  Run once overnight = DISABLED"
    ${EndIf}
    Call LogText

    ${If} $TaskDailySelected == ${BST_CHECKED}
        Push "  Daily Optimization = ENABLED"
    ${Else}
        Push "  Daily Optimization = DISABLED"
    ${EndIf}
    Call LogText

    ${If} $TaskWeeklySelected == ${BST_CHECKED}
        Push "  Weekly Optimization = ENABLED"
    ${Else}
        Push "  Weekly Optimization = DISABLED"
    ${EndIf}
    Call LogText

    ${If} $TaskMonthlySelected == ${BST_CHECKED}
        Push "  Monthly Optimization = ENABLED"
    ${Else}
        Push "  Monthly Optimization = DISABLED"
    ${EndIf}
    Call LogText

    ${If} $TaskYearlySelected == ${BST_CHECKED}
        Push "  Yearly Optimization = ENABLED"
    ${Else}
        Push "  Yearly Optimization = DISABLED"
    ${EndIf}
    Call LogText

    ${If} $StateAllUsers == ${BST_CHECKED}
        Push "  Configure for all users = ENABLED"
    ${Else}
        Push "  Configure for all users = DISABLED"
    ${EndIf}
    Call LogText
FunctionEnd

Function TaskSchedulerPageLeave
    ${NSD_GetState} $CheckboxAllUsers $StateAllUsers
    ${NSD_GetState} $CheckboxEnableMyDefrag $EnableMyDefragSelected
    ${NSD_GetState} $CheckboxTaskRunOnce $TaskRunOnceSelected
    ${NSD_GetState} $CheckboxTaskDaily $TaskDailySelected
    ${NSD_GetState} $CheckboxTaskWeekly $TaskWeeklySelected
    ${NSD_GetState} $CheckboxTaskMonthly $TaskMonthlySelected
    ${NSD_GetState} $CheckboxTaskYearly $TaskYearlySelected

    Call LogTaskSchedulerFinalSettings
    Call TaskSchedulerApply
FunctionEnd

Function TaskSchedulerApply
    Push "Applying Task Scheduler settings"
    Call LogText

    ${If} $StateAllUsers == ${BST_CHECKED}
        SetShellVarContext all
    ${Else}
        SetShellVarContext current
    ${EndIf}

    StrCpy $0 "$INSTDIR\Commands\TaskScheduler\DoTaskScheduleInstall.bat"
    IfFileExists "$0" 0 TaskSchedulerBaseMissing
        nsExec::ExecToLog 'cmd /c ""$0""'
        Pop $0
        Push "DoTaskScheduleInstall.bat exit code: $0"
        Call LogText
        Goto TaskSchedulerBaseDone
TaskSchedulerBaseMissing:
        Push "Missing: $INSTDIR\Commands\TaskScheduler\DoTaskScheduleInstall.bat"
        Call LogText
TaskSchedulerBaseDone:

    ; Preserve the file and update only scheduler keys.
    StrCpy $DriveScheduled "TaylorDoRunOnce"
    ${If} $EnableMyDefragSelected == ${BST_CHECKED}
    ${AndIf} $TaskRunOnceSelected == ${BST_CHECKED}
        WriteINIStr "$INSTDIR\DriveRoles.ini" "DriveScheduled" "$DriveScheduled" "ENABLED"
        nsExec::ExecToLog 'cmd /c "$INSTDIR\Commands\TaskScheduler\DoEnableRunOnce.bat"'
    ${Else}
        WriteINIStr "$INSTDIR\DriveRoles.ini" "DriveScheduled" "$DriveScheduled" "DISABLED"
        nsExec::ExecToLog 'cmd /c "$INSTDIR\Commands\TaskScheduler\DoDisableRunOnce.bat"'
    ${EndIf}
    Pop $0
    Push "Run Once task exit code: $0"
    Call LogText

    StrCpy $DriveScheduled "TaylorDoDaily"
    ${If} $EnableMyDefragSelected == ${BST_CHECKED}
    ${AndIf} $TaskDailySelected == ${BST_CHECKED}
        WriteINIStr "$INSTDIR\DriveRoles.ini" "DriveScheduled" "$DriveScheduled" "ENABLED"
        nsExec::ExecToLog 'cmd /c "$INSTDIR\Commands\TaskScheduler\DoEnableDaily.bat"'
    ${Else}
        WriteINIStr "$INSTDIR\DriveRoles.ini" "DriveScheduled" "$DriveScheduled" "DISABLED"
        nsExec::ExecToLog 'cmd /c "$INSTDIR\Commands\TaskScheduler\DoDisableDaily.bat"'
    ${EndIf}
    Pop $0
    Push "Daily task exit code: $0"
    Call LogText

    StrCpy $DriveScheduled "TaylorDoWeekly"
    ${If} $EnableMyDefragSelected == ${BST_CHECKED}
    ${AndIf} $TaskWeeklySelected == ${BST_CHECKED}
        WriteINIStr "$INSTDIR\DriveRoles.ini" "DriveScheduled" "$DriveScheduled" "ENABLED"
        nsExec::ExecToLog 'cmd /c "$INSTDIR\Commands\TaskScheduler\DoEnableWeekly.bat"'
    ${Else}
        WriteINIStr "$INSTDIR\DriveRoles.ini" "DriveScheduled" "$DriveScheduled" "DISABLED"
        nsExec::ExecToLog 'cmd /c "$INSTDIR\Commands\TaskScheduler\DoDisableWeekly.bat"'
    ${EndIf}
    Pop $0
    Push "Weekly task exit code: $0"
    Call LogText

    StrCpy $DriveScheduled "TaylorDoMonthly"
    ${If} $EnableMyDefragSelected == ${BST_CHECKED}
    ${AndIf} $TaskMonthlySelected == ${BST_CHECKED}
        WriteINIStr "$INSTDIR\DriveRoles.ini" "DriveScheduled" "$DriveScheduled" "ENABLED"
        nsExec::ExecToLog 'cmd /c "$INSTDIR\Commands\TaskScheduler\DoEnableMonthly.bat"'
    ${Else}
        WriteINIStr "$INSTDIR\DriveRoles.ini" "DriveScheduled" "$DriveScheduled" "DISABLED"
        nsExec::ExecToLog 'cmd /c "$INSTDIR\Commands\TaskScheduler\DoDisableMonthly.bat"'
    ${EndIf}
    Pop $0
    Push "Monthly task exit code: $0"
    Call LogText

    StrCpy $DriveScheduled "TaylorDo Yearly"
    ${If} $EnableMyDefragSelected == ${BST_CHECKED}
    ${AndIf} $TaskYearlySelected == ${BST_CHECKED}
        WriteINIStr "$INSTDIR\DriveRoles.ini" "DriveScheduled" "$DriveScheduled" "ENABLED"
        nsExec::ExecToLog 'cmd /c "$INSTDIR\Commands\TaskScheduler\DoEnableYearly.bat"'
    ${Else}
        WriteINIStr "$INSTDIR\DriveRoles.ini" "DriveScheduled" "$DriveScheduled" "DISABLED"
        nsExec::ExecToLog 'cmd /c "$INSTDIR\Commands\TaskScheduler\DoDisableYearly.bat"'
    ${EndIf}
    Pop $0
    Push "Yearly task exit code: $0"
    Call LogText

    StrCpy $DriveScheduled "WindowsDefrag"
    ${If} $EnableMyDefragSelected != ${BST_CHECKED}
        WriteINIStr "$INSTDIR\DriveRoles.ini" "DriveScheduled" "$DriveScheduled" "ENABLED"
        nsExec::ExecToLog 'cmd /c "$INSTDIR\Commands\TaskScheduler\DoEnableWindowsDefrag.bat"'
    ${Else}
        WriteINIStr "$INSTDIR\DriveRoles.ini" "DriveScheduled" "$DriveScheduled" "DISABLED"
        nsExec::ExecToLog 'cmd /c "$INSTDIR\Commands\TaskScheduler\DoDisableWindowsDefrag.bat"'
    ${EndIf}
    Pop $0
    Push "Windows Defrag task exit code: $0"
    Call LogText

    Push "Task Scheduler settings applied"
    Call LogText
FunctionEnd

;------------------------------------------------------------
; DriveRolesPageCreate
;------------------------------------------------------------
Function DriveRolesPageCreate

    !insertmacro FuncEntry "DriveRolesPageCreate"

    !insertmacro MUI_HEADER_TEXT \
        "TaylorDo ${PRODUCT_VERSION} Volume Configuration Wizard" \
        "Choose which disk volumes will be defragmented and what type of volume they are."

    nsDialogs::Create 1018
    Pop $Dialog

    ${If} $Dialog == error
        Abort
    ${EndIf}

    GetDlgItem $NextButton $HWNDPARENT 1
    SendMessage $NextButton ${WM_SETTEXT} 0 "STR:Update"

    Push "DriveRolesPageCreate()"
    Call LogText

    ${NSD_CreateLabel} 0 0 100% 12u \
        "Assign a role to each detected drive"
    Pop $0

    ${NSD_CreateLabel} 5u 18u 30u 12u "Drive"
    Pop $LabelDrive

    ${NSD_CreateLabel} 45u 18u 50u 12u "Type"
    Pop $LabelType

    ${NSD_CreateLabel} 110u 18u 80u 12u "Role"
    Pop $LabelRole

    StrCpy $RowY 46
    StrCpy $DriveCount 0

    Push "RowY initialized to $RowY"
    Call LogText
    Push "DriveCount initialized to $DriveCount"
    Call LogText

    ; ----------------------------------------------------
    ; SAFE DRIVE ENUMERATION
    ; ----------------------------------------------------

    Push "----------------------------------------"
    Call LogText
    StrCpy $R6 65   ; ASCII 'A'

DriveLoop:
    IntCmp $R6 91 DoneDriveLoop +1 DoneDriveLoop

    IntFmt $DriveLetter "%c" $R6
    StrCpy $DriveLetter "$DriveLetter:"
    StrCpy $R3 "$DriveLetter\"

    ; check drive type first - returns 1 (DRIVE_NO_ROOT_DIR) if drive doesn't exist
    System::Call 'kernel32::GetDriveType(t "$R3") i .R4'

    Push "------------------------------------------------------------"
    Call LogText
    Push "Enumerating drive ID = $DriveLetter, Root = $R3, Type = $R4"
    Call LogText
    Push "------------------------------------------------------------"
    Call LogText

    StrCpy $R5 "Unknown"

    ${If} $R4 == 1
        ; StrCpy $R5 "Unattached"
        Goto NextDrive

    ${ElseIf} $R4 == 3
        StrCpy $R5 "Fixed"
        Push "$DriveLetter"
        Call DetectFixedDriveMediaType
        Pop $R5

    ${ElseIf} $R4 == 2
        StrCpy $R5 "Removable"

    ${ElseIf} $R4 == 4
        StrCpy $R5 "Network"

    ${ElseIf} $R4 == 5
        Push "  Skipping CD/DVD drive"
        Call LogText
        Goto NextDrive

    ${ElseIf} $R4 == 6
        Push "  Skipping RAM disk"
        Call LogText
        Goto NextDrive

    ${EndIf}

    ; ----------------------------------------------------
    ; CREATE UI ROW
    ; ----------------------------------------------------

    ${NSD_CreateLabel} 5u $RowY 30u 12u "$DriveLetter"
    Pop $0

    ${NSD_CreateLabel} 45u $RowY 55u 12u "$R5"
    Pop $1

    ${NSD_CreateDropList} 110u $RowY 80u 120u ""
    Pop $DropListHandle

    ${NSD_OnChange} $DropListHandle OnRoleChanged

    ; Push "Created dropdown handle = $DropListHandle for drive $DriveLetter"
    ; Call LogText

    ${NSD_CB_AddString} $DropListHandle "SKIP"
    ${NSD_CB_AddString} $DropListHandle "Sys"
    ${NSD_CB_AddString} $DropListHandle "Dev"
    ${NSD_CB_AddString} $DropListHandle "Data"
    ${NSD_CB_AddString} $DropListHandle "Archive"

    ; Push "  Added dropdown values"
    ; Call LogText

    ; ----------------------------------------------------
    ; AUTO-DETECT EXISTING ROLE
    ; ----------------------------------------------------

    Push "  Calling SelectVolumeTypeForDrive for $DriveLetter"
    Call LogText

    Push "$DriveLetter"
    ; Push $DropListHandle
    Call SelectVolumeTypeForDrive
    ; $VolumeType set (or SKIP)
    ${NSD_CB_SelectString} $DropListHandle $VolumeType

    Push "  Dropdown selection after scan = $VolumeType"
    Call LogText

    ; ----------------------------------------------------
    ; STORE REFERENCES
    ; ----------------------------------------------------

    ${Switch} $DriveCount

        ${Case} 0
            StrCpy $DriveLetter0 "$DriveLetter"
            StrCpy $DriveType0 "$R5"
            StrCpy $Combo0 $DropListHandle
            StrCpy $Role0 "$VolumeType"
        ${Break}

        ${Case} 1
            StrCpy $DriveLetter1 "$DriveLetter"
            StrCpy $DriveType1 "$R5"
            StrCpy $Combo1 $DropListHandle
            StrCpy $Role1 "$VolumeType"
        ${Break}

        ${Case} 2
            StrCpy $DriveLetter2 "$DriveLetter"
            StrCpy $DriveType2 "$R5"
            StrCpy $Combo2 $DropListHandle
            StrCpy $Role2 "$VolumeType"
        ${Break}

        ${Case} 3
            StrCpy $DriveLetter3 "$DriveLetter"
            StrCpy $DriveType3 "$R5"
            StrCpy $Combo3 $DropListHandle
            StrCpy $Role3 "$VolumeType"
        ${Break}

        ${Case} 4
            StrCpy $DriveLetter4 "$DriveLetter"
            StrCpy $DriveType4 "$R5"
            StrCpy $Combo4 $DropListHandle
            StrCpy $Role4 "$VolumeType"
        ${Break}

        ${Case} 5
            StrCpy $DriveLetter5 "$DriveLetter"
            StrCpy $DriveType5 "$R5"
            StrCpy $Combo5 $DropListHandle
            StrCpy $Role5 "$VolumeType"
        ${Break}

        ${Case} 6
            StrCpy $DriveLetter6 "$DriveLetter"
            StrCpy $DriveType6 "$R5"
            StrCpy $Combo6 $DropListHandle
            StrCpy $Role6 "$VolumeType"
        ${Break}

        ${Case} 7
            StrCpy $DriveLetter7 "$DriveLetter"
            StrCpy $DriveType7 "$R5"
            StrCpy $Combo7 $DropListHandle
            StrCpy $Role7 "$VolumeType"
        ${Break}

        ${Case} 8
            StrCpy $DriveLetter8 "$DriveLetter"
            StrCpy $DriveType8 "$R5"
            StrCpy $Combo8 $DropListHandle
            StrCpy $Role8 "$VolumeType"
        ${Break}

        ${Case} 9
            StrCpy $DriveLetter9 "$DriveLetter"
            StrCpy $DriveType9 "$R5"
            StrCpy $Combo9 $DropListHandle
            StrCpy $Role9 "$VolumeType"
        ${Break}

    ${EndSwitch}

    IntOp $DriveCount $DriveCount + 1
    IntOp $RowY $RowY + 20

    Push "  DriveCount: $DriveCount, RowY: $RowY"
    Call LogText

NextDrive:
    IntOp $R6 $R6 + 1
    Goto DriveLoop

DoneDriveLoop:

    Push "  Drive enumeration complete. ($DriveCount)"
    Call LogText

    ${If} $DriveRoleChanged == 1
        SendMessage $NextButton \
            ${WM_SETTEXT} 0 "STR:Update"
    ${Else}
        SendMessage $NextButton \
            ${WM_SETTEXT} 0 "STR:Next >"
    ${EndIf}

    nsDialogs::Show

FunctionEnd

;------------------------------------------------------------

Function DriveRolesPageLeave
    !insertmacro FuncEntry "DriveRolesPageLeave"

    Push "--------------------------------------------------"
    Call LogText
    Push "DriveRolesPageLeave()"
    Call LogText
    Push "INSTDIR = $INSTDIR"
    Call LogText
    Push "Drive count: $DriveCount"
    Call LogText

    ${If} $DriveRoleChanged == 1
    Push "Applying drive role updates"
    Call LogText
        Call SaveDriveRoles
        StrCpy $DriveRoleChanged 0
        GetDlgItem $NextButton $HWNDPARENT 1
        SendMessage $NextButton ${WM_SETTEXT} 0 "STR:Next >"
        Abort
    ${EndIf}

FunctionEnd

;------------------------------------------------------------

Function OnRoleChanged
    !insertmacro FuncEntry "OnRoleChanged"

    Pop $0

    ${If} $DriveRoleChangeReverting == 1
        Return
    ${EndIf}

    ${NSD_GetText} $0 $2

    StrCpy $3 "Unknown"
    StrCpy $4 "Unknown"
    StrCpy $5 "Unknown"

    ${If} $0 == $Combo0
        StrCpy $3 $DriveLetter0
        StrCpy $4 $Role0
        StrCpy $5 $DriveType0
    ${ElseIf} $0 == $Combo1
        StrCpy $3 $DriveLetter1
        StrCpy $4 $Role1
        StrCpy $5 $DriveType1
    ${ElseIf} $0 == $Combo2
        StrCpy $3 $DriveLetter2
        StrCpy $4 $Role2
        StrCpy $5 $DriveType2
    ${ElseIf} $0 == $Combo3
        StrCpy $3 $DriveLetter3
        StrCpy $4 $Role3
        StrCpy $5 $DriveType3
    ${ElseIf} $0 == $Combo4
        StrCpy $3 $DriveLetter4
        StrCpy $4 $Role4
        StrCpy $5 $DriveType4
    ${ElseIf} $0 == $Combo5
        StrCpy $3 $DriveLetter5
        StrCpy $4 $Role5
        StrCpy $5 $DriveType5
    ${ElseIf} $0 == $Combo6
        StrCpy $3 $DriveLetter6
        StrCpy $4 $Role6
        StrCpy $5 $DriveType6
    ${ElseIf} $0 == $Combo7
        StrCpy $3 $DriveLetter7
        StrCpy $4 $Role7
        StrCpy $5 $DriveType7
    ${ElseIf} $0 == $Combo8
        StrCpy $3 $DriveLetter8
        StrCpy $4 $Role8
        StrCpy $5 $DriveType8
    ${ElseIf} $0 == $Combo9
        StrCpy $3 $DriveLetter9
        StrCpy $4 $Role9
        StrCpy $5 $DriveType9
    ${EndIf}

    ${If} $2 != "SKIP"
    ${AndIf} $5 != "HDD"
    ${AndIf} $5 != "Fixed"
        Push "Drive role setting rejected: $3 is $5 and cannot be assigned $2; restored $4"
        Call LogText
        MessageBox MB_ICONSTOP|MB_OK "Drive $3 is $5.$\r$\n$\r$\nTaylorDo cannot assign a defragmentation role to SSD, removable, network, or unsupported drives.$\r$\n$\r$\nIt will be igonored by the system OS, SKIP is more accurate."
        ; StrCpy $DriveRoleChangeReverting 1
        ; ${NSD_CB_SelectString} $0 $4
        ; StrCpy $DriveRoleChangeReverting 0
        Return
    ${EndIf}

    StrCpy $DriveRoleChanged 1

    ${If} $0 == $Combo0
        StrCpy $Role0 $2
    ${ElseIf} $0 == $Combo1
        StrCpy $Role1 $2
    ${ElseIf} $0 == $Combo2
        StrCpy $Role2 $2
    ${ElseIf} $0 == $Combo3
        StrCpy $Role3 $2
    ${ElseIf} $0 == $Combo4
        StrCpy $Role4 $2
    ${ElseIf} $0 == $Combo5
        StrCpy $Role5 $2
    ${ElseIf} $0 == $Combo6
        StrCpy $Role6 $2
    ${ElseIf} $0 == $Combo7
        StrCpy $Role7 $2
    ${ElseIf} $0 == $Combo8
        StrCpy $Role8 $2
    ${ElseIf} $0 == $Combo9
        StrCpy $Role9 $2
    ${EndIf}

    Push "Drive role setting changed: $3 = $4 -> $2"
    Call LogText

    ${If} $DriveRoleChanged == 1
        SendMessage $NextButton ${WM_SETTEXT} 0 "STR:Update"
    ${Else}
        SendMessage $NextButton ${WM_SETTEXT} 0 "STR:Next >"
    ${EndIf}

FunctionEnd

;------------------------------------------------------------

Function ChangeLogPageCreate
    !insertmacro FuncEntry "ChangeLogPageCreate"

    !insertmacro MUI_HEADER_TEXT \
        "TaylorDo ${PRODUCT_VERSION} Volume Configuration Wizard" \
        "This is a log of your activity modifiying the configuration."

    nsDialogs::Create 1018
    Pop $0

    ${If} $0 == error
        Abort
    ${EndIf}

    ${NSD_CreateLabel} 0 0 100% 12u "TaylorDo Installation"
    Pop $1

    ${NSD_CreateProgressBar} 0 18u 100% 12u ""
    Pop $MyProgressBar

    ${NSD_CreateLabel} 0 36u 100% 12u "Log output"
    Pop $MyStatusLabel

    nsDialogs::CreateControl "EDIT" \
        "${WS_CHILD}|${WS_VISIBLE}|${ES_MULTILINE}|${ES_AUTOVSCROLL}|${ES_READONLY}|${WS_VSCROLL}" \
        0 0 52u 100% 140u ""
    Pop $LogBox

    Call LoadLogFile
    nsDialogs::Show

FunctionEnd

;------------------------------------------------------------

Function ChangeLogPageLeave
    !insertmacro FuncEntry "ChangeLogPageLeave"
    Push "Proceeding to finish."
    Call LogText
FunctionEnd

;------------------------------------------------------------

Function FindSubstring
    ; !insertmacro FuncEntry "FindSubstring"

    Exch $1
    Exch
    Exch $0

    Push $2
    Push $3
    Push $4
    Push $5
    Push $6

    StrCpy $2 0

Loop:
    StrCpy $4 $1 1 $2
    StrCmp $4 "" NotFound

    StrCpy $5 $1 "" $2
    StrLen $6 $0
    StrCpy $5 $5 $6
    StrCmp $5 $0 Found

    IntOp $2 $2 + 1
    Goto Loop

Found:
    StrCpy $0 1
    Goto Done

NotFound:
    StrCpy $0 0

Done:
    Pop $6
    Pop $5
    Pop $4
    Pop $3
    Pop $2
    Pop $1
    Exch $0
FunctionEnd

;------------------------------------------------------------
Var /GLOBAL var_name
Function GetTimeStamp
    ; !insertmacro FuncEntry "GetTimeStamp"

    System::Alloc 16
    Pop $0
    System::Call 'kernel32::GetLocalTime(p r0)'
    System::Call '*$0(&i2,&i2,&i2,&i2,&i2,&i2,&i2,&i2)(r1,r2,r3,r4,r5,r6,,)'
    System::Free $0

    StrCpy $9 "$4:$5:$6"
    Exch $9

FunctionEnd
