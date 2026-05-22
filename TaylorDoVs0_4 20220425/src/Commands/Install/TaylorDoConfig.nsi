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
Icon "..\..\Resources\Icons\Taylor_Icon_-_DonnaDubinsky.ico"
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
!define MUI_ICON "..\..\Resources\Icons\Taylor_Icon_-_DonnaDubinsky.ico"
!define MUI_UNICON "..\..\Resources\Icons\Taylor_Icon_-_DonnaDubinsky.ico"
!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_BITMAP_NOSTRETCH "..\..\MattTaylorAndNumenta\1673821_235x235_ff1b1c - ForeverMissedCom - DonnaDubinsky.bmp"
!define MUI_ABORTWARNING
!define MUI_WELCOMEFINISHPAGE_BITMAP "..\..\Commands\Install\MyDefrag Run Zone 6 Small.bmp"
!define MUI_WELCOMEPAGE_TITLE "TaylorDo ${PRODUCT_VERSION} Volume Configuration Wizard"
!define MUI_WELCOMEPAGE_TEXT "Welcome to the Taylor Disk Optimizer ${PRODUCT_VERSION}. This wizard will configure your storage volumes for TaylorDo (Taylor Disk Optimizer), the next generation of the Windows disk optimization and defragmentation.$\r$\n$\r$\nTaylorDo works out of the box and tuned for the home user.$\r$\n$\r$\nBut it is designed for network system administration, is highly customizable and easy to change.$\r$\n$\r$\n$_CLICK"
;------------------------------------------------------------
; Function Pages
!insertmacro MUI_PAGE_WELCOME
Page Custom DriveRolesPageCreate DriveRolesPageLeave
Page Custom ChangeLogPageCreate ChangeLogPageLeave
!define MUI_FINISHPAGE_NOAUTOCLOSE
!insertmacro MUI_PAGE_FINISH
!insertmacro MUI_LANGUAGE "English"

;------------------------------------------------------------
; Function Section
;------------------------------------------------------------

Section "Main"
    Call LoadLogFile
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
    MessageBox MB_OKCANCEL "Function: ${NAME}" IDOK +2
        Abort
    Push "Function: ${NAME}"
    Call Log
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

    IfFileExists "$INSTDIR\Logs\TaylorDo_Config.log" 0 Finish
    FileOpen $LogLoadHandle "$INSTDIR\Logs\TaylorDo_Config.log" r

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

Function OpenLog
    ; MessageBox MB_OKCANCEL "Function: OpenLog" IDOK +2
    ;     Abort

    FileOpen $LogHandle "$INSTDIR\Logs\TaylorDo_Config.log" a
    StrCpy $LogHandleOpen 1
FunctionEnd

;------------------------------------------------------------

Function InitLog
    ; MessageBox MB_OKCANCEL "Function: InitLog" IDOK +2
    ;     Abort

    StrCpy $LogEnabled 1
    CreateDirectory "$INSTDIR\Logs"
    Delete "$INSTDIR\Logs\TaylorDo_Config.log"
    Call OpenLog
    FileWrite $LogHandle "===== NEW RUN =====$\r$\n"
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
    StrCpy $INSTDIR "$EXEDIR"

    Call InitializeSettings

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
    ; !insertmacro FuncEntry "InitializeSettings"

    StrCpy $ProductAppName "MyDefrag"
    StrCpy $ProductAppVersion "4.3.1"
    StrCpy $ProductAppPublisher "J.C. Kessels"

    System::Call "kernel32::GetCurrentProcess() p .r9"
    System::Call "kernel32::IsWow64Process(p r9, *i .r0)"

    ${If} $R0 == 1
        SetRegView 64
        StrCpy $ProductAppInstallDir "$INSTDIR\MyDefrag v4.3.1"
    ${Else}
        StrCpy $ProductAppInstallDir "$INSTDIR\MyDefrag v4.3.1"
    ${EndIf}

    StrCpy $DriveRoleChanged 0
FunctionEnd

;------------------------------------------------------------

Function LoadDriveRoles
    ; Has stack arg - MessageBox before Exch
    MessageBox MB_OKCANCEL "Function: LoadDriveRoles" IDOK +2
        Abort
    Push "Function: LoadDriveRoles"
    Call LogText

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

    Delete "$INSTDIR\DriveRoles.ini"
    Push "Deleted previous DriveRoles.ini"
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
    ; Has stack arg - MessageBox before Exch
    MessageBox MB_OKCANCEL "Function: IsAssignableVolumeType" IDOK +2
        Abort
    Push "Function: IsAssignableVolumeType"
    Call LogText
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
; Input:  full path on stack, e.g. "D:\...\VolumeType\VolumeTypeArchive.MyDc"
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
    ; Push "    Name = $GvtfnResult"
    ; Call LogText

    ; $GvtfnResult = "VolumeTypeArchive.MyDc"
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
            StrCpy $Combo0 $DropListHandle
        ${Break}

        ${Case} 1
            StrCpy $DriveLetter1 "$DriveLetter"
            StrCpy $Combo1 $DropListHandle
        ${Break}

        ${Case} 2
            StrCpy $DriveLetter2 "$DriveLetter"
            StrCpy $Combo2 $DropListHandle
        ${Break}

        ${Case} 3
            StrCpy $DriveLetter3 "$DriveLetter"
            StrCpy $Combo3 $DropListHandle
        ${Break}

        ${Case} 4
            StrCpy $DriveLetter4 "$DriveLetter"
            StrCpy $Combo4 $DropListHandle
        ${Break}

        ${Case} 5
            StrCpy $DriveLetter5 "$DriveLetter"
            StrCpy $Combo5 $DropListHandle
        ${Break}

        ${Case} 6
            StrCpy $DriveLetter6 "$DriveLetter"
            StrCpy $Combo6 $DropListHandle
        ${Break}

        ${Case} 7
            StrCpy $DriveLetter7 "$DriveLetter"
            StrCpy $Combo7 $DropListHandle
        ${Break}

        ${Case} 8
            StrCpy $DriveLetter8 "$DriveLetter"
            StrCpy $Combo8 $DropListHandle
        ${Break}

        ${Case} 9
            StrCpy $DriveLetter9 "$DriveLetter"
            StrCpy $Combo9 $DropListHandle
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

Function GetDriveForCombo
    ; Has stack arg - MessageBox before Exch
    MessageBox MB_OKCANCEL "Function: GetDriveForCombo" IDOK +2
        Abort
    Push "Function: GetDriveForCombo"
    Call LogText
    Exch $0

    StrCpy $1 "Unknown"

    ${If} $0 == $Combo0
        StrCpy $1 $DriveLetter0
    ${ElseIf} $0 == $Combo1
        StrCpy $1 $DriveLetter1
    ${ElseIf} $0 == $Combo2
        StrCpy $1 $DriveLetter2
    ${ElseIf} $0 == $Combo3
        StrCpy $1 $DriveLetter3
    ${ElseIf} $0 == $Combo4
        StrCpy $1 $DriveLetter4
    ${ElseIf} $0 == $Combo5
        StrCpy $1 $DriveLetter5
    ${ElseIf} $0 == $Combo6
        StrCpy $1 $DriveLetter6
    ${ElseIf} $0 == $Combo7
        StrCpy $1 $DriveLetter7
    ${ElseIf} $0 == $Combo8
        StrCpy $1 $DriveLetter8
    ${ElseIf} $0 == $Combo9
        StrCpy $1 $DriveLetter9
    ${Else}
        StrCpy $1 "Unknown"
    ${EndIf}

    Pop $0
    Push $1

FunctionEnd

;------------------------------------------------------------

Function OnRoleChanged
    !insertmacro FuncEntry "OnRoleChanged"

    StrCpy $DriveRoleChanged 1

    ${NSD_GetState} $0 $1
    ${NSD_GetText} $0 $2

    Push $0
    Call GetDriveForCombo
    Pop $3

    Push "Drive $3 changed to $2"
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
    ; Has stack args - MessageBox before Exch
    ; MessageBox MB_OKCANCEL "Function: FindSubstring" IDOK +2
    ;     Abort
    ; Push "Function: FindSubstring"
    ; Call LogText

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
    ; Has stack return - MessageBox only
    ; MessageBox MB_OKCANCEL "Function: GetTimeStamp" IDOK +2
    ;     Abort

    System::Alloc 16
    Pop $0
    System::Call 'kernel32::GetLocalTime(p r0)'
    System::Call '*$0(&i2,&i2,&i2,&i2,&i2,&i2,&i2,&i2)(r1,r2,r3,r4,r5,r6,,)'
    System::Free $0

    StrCpy $9 "$4:$5:$6"
    Exch $9

FunctionEnd