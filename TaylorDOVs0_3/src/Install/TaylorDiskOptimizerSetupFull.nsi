; Title: Taylor Disk Optimizer 
; Program: Taylor Disk Optimizer Full Install
; Author: David G Horsman
; Company: dba MacroDM
; Named in memory of Matt Taylor.
; Copyright: 2015, 2019, 2020, 2021 David G Horsman
; License: Yet to be determined.
;
; Nsis Install Script: TaylorDoSetupFull
; Code Source and style: Numerous sources & online answers.
; Script generated by the HM NIS Edit Script Wizard.
; Taken from: HM NIS Edit Wizard helper defines

; ///////////////////////////////////////////////////////
;--------------- Dependencies -----------------
!include LogicLib.nsh
!include WinVer.nsh
!include x64.nsh

;--------------- Application -----------------
!define PRODUCT_NAME "Taylor Disk Optimizer"
    ; X.X.X.0 - Patch
    ; X.X.0 - Proto/Dev/Alpha/Early, 1 - Beta, 2 - Released
    ; 3.1 Refactor into directories
    ; 3.2 Installer, Refactor ZoneType & Display 
    ; 3.3 ActionVerbs, Fast (Daily) & Regular Optimize
!define PRODUCT_VERSION "3.3.1.0"
!define PRODUCT_PUBLISHER "David G Horsman"
InstType "Full" IT_FULL
; InstType "Minimal" IT_MIN
InstType "Custom" IT_CUSTOM

Var /GLOBAL ProductAppName 
Var /GLOBAL ProductAppVersion 
Var /GLOBAL ProductAppPublisher 
Icon "G:\Dev\MdmDefrag\TaylorDoVs0_2\Resources\Icons\Taylor_Icon_-_DonnaDubinsky.ico"
; Icon "G:\Dev\MdmDefrag\TaylorDoVs0_2\Resources\Icons\MdmControl.ico"

SetCompressor lzma
 
; ///////////////////////////////////////////////////////
;--------------- Main -----------------
Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
Caption "Matt Taylor Disk Optimizer"
InstallDir "$PROGRAMFILES\MyDefrag v4.3.1"
    ; InstallDir "$PROGRAMFILES\MyDefrag"
    ; InstallDir "$PROGRAMFILES\TaylorDo"

; Get installation folder from registry if available
InstallDirRegKey HKCU "Software\${PRODUCT_NAME}" "Install_Dir"
    ; ?InstallDirRegKey HKCU "Software\${PRODUCT_NAME}" ""

Var /GLOBAL InstallDirTaylorDo
Var /GLOBAL InstallDirFull

; var /GLOBAL SetOutPath
; var /GLOBAL InstallDir
; var /GLOBAL $InstallDirTaylorDo
; var /GLOBAL $InstallDirFull

OutFile "TaylorDoSetup.exe"
    ; OutFile "TaylorDiskOptimizerSetup.exe"

RequestExecutionLevel Admin
ShowInstDetails show
Unicode True

; ///////////////////////////////////////////////////////
;--------------- User Interface -----------------
; ///////////////////////////////////////////////////////
; !include "UserManagement.nsh"
; MUI 1.67 compatible ------
!include "MUI.nsh"
 
;--------------------------------
; MUI Settings
    ; !define MUI_ICON "${NSISDIR}\Contrib\Graphics\Icons\modern-install.ico"
    ; !define MUI_ICON "${NSISDIR}\Resources\Icons\MdmControl.ico"
    ; G:\Dev\MdmDefrag\TaylorDoVs0_2
    ; !define MUI_ICON "..\Resources\Icons\MdmControl.ico"
    ; !define MUI_UNICON "..\Resources\Icons\MdmControl.ico"
!define MUI_ICON "..\Resources\Icons\Taylor_Icon_-_DonnaDubinsky.ico"
!define MUI_UNICON "..\Resources\Icons\Taylor_Icon_-_DonnaDubinsky.ico"

; ///////////////////////////////////////////////////////
; Install 
;--------------------------------
;Interface Configuration
!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_BITMAP "..\MattTaylorAndNumenta\1673821_235x235_ff1b1c - ForeverMissedCom - DonnaDubinsky.bmp"
!define MUI_ABORTWARNING

;--------------------------------
!define MUI_WELCOMEFINISHPAGE_BITMAP "..\Install\MyDefrag Run Zone 6 Small.bmp"

    ; Welcome page
!define MUI_WELCOMEPAGE_TITLE "Welcome to the Taylor Disk Optimizer ${PRODUCT_VERSION} Setup Wizard"
!define MUI_WELCOMEPAGE_TEXT "This wizard will guide you through the installation of the TaylorDo (Taylor Disk Optimizer) ${PRODUCT_VERSION}, the next generation of the Windows disk optimization and defragmentation.$\r$\n$\r$\nTaylorDo works out of the box and tuned for the home user.$\r$\n$\r$\nBut it is designed for network system administration, is highly customizable and easy to change.$\r$\n$\r$\n$_CLICK"

!insertmacro MUI_PAGE_WELCOME

;--------------------------------
!insertmacro MUI_PAGE_LICENSE "..\License.txt"

;--------------------------------
!insertmacro MUI_PAGE_COMPONENTS

;--------------------------------
!define MUI_DIRECTORYPAGE_TEXT_TOP $(mydirtoptext)
!define MUI_TEXT_DIRECTORY_TITLE "Destination Folder"
!define MUI_TEXT_DIRECTORY_SUBTITLE "Click Install to install to the default folder or click Browse to choose another"
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

;--------------------------------
Var StartMenuFolder ; Define variable to hold start menu folder
!define MUI_STARTMENUPAGE_DEFAULTFOLDER "${PRODUCT_PUBLISHER}\${PRODUCT_NAME}" ; Set default start menu folder
; Page --------------
!insertmacro MUI_PAGE_STARTMENU Application     $StartMenuFolder    
; Registry Key ---------------- Start Menu Folder
!define MUI_STARTMENUPAGE_REGISTRY_ROOT "HKCU" 
!define MUI_STARTMENUPAGE_REGISTRY_KEY "Software\${PRODUCT_NAME}" 
!define MUI_STARTMENUPAGE_REGISTRY_VALUENAME "StartMenuFolder"

; ///////////////////////////////////////////////////////
; Uninstall
!insertmacro MUI_UNPAGE_WELCOME
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_LICENSE "..\License.txt"
!insertmacro MUI_UNPAGE_COMPONENTS
!insertmacro MUI_UNPAGE_DIRECTORY

!insertmacro MUI_UNPAGE_INSTFILES
!insertmacro MUI_UNPAGE_FINISH
  
;--------------------------------
; Languages
!insertmacro MUI_LANGUAGE "English"
 
;--------------------------------
; Reserve files
!insertmacro MUI_RESERVEFILE_INSTALLOPTIONS
; !insertmacro MUI_RESERVEFILE_LANGDLL

; MUI end ------

; ///////////////////////////////////////////////////////
;--------------- Version Information -----------------
; ///////////////////////////////////////////////////////
VIProductVersion "${PRODUCT_VERSION}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "ProductName" "${PRODUCT_NAME}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "Comments" "An advanced automatic disk optimization library dedicated to Matt Taylor"
VIAddVersionKey /LANG=${LANG_ENGLISH} "CompanyName" "dba MacroDM (David G Horsman)"
VIAddVersionKey /LANG=${LANG_ENGLISH} "InternalName" "MdmDefrag"
VIAddVersionKey /LANG=${LANG_ENGLISH} "LegalTrademarks" "none"
VIAddVersionKey /LANG=${LANG_ENGLISH} "LegalCopyright" "© 2015, 2020, 2021 David G Horsman"
VIAddVersionKey /LANG=${LANG_ENGLISH} "FileDescription" "TaylorDo Application using My Defrag Vs4.3.1"
VIAddVersionKey /LANG=${LANG_ENGLISH} "FileVersion" "3.0"

; ///////////////////////////////////////////////////////
; ///////////////// SECTIONS ////////////////////////////
; ///////////////// Section SETTINGS ////////////////////
; InstallDir "$PROGRAMFILES\MyDefrag v4.3.1"
Section -SETTINGS
    SectionInstType ${IT_FULL} ${IT_CUSTOM}
    SetOverwrite ifnewer
    StrCpy $ProductAppName "My Defrag"
    StrCpy $ProductAppVersion "4.3.1"
    StrCpy $ProductAppPublisher "J.C. Kessels"
    ${If} ${RunningX64}
        SetOutPath "$PROGRAMFILES32"
    ${Else}
        SetOutPath "$PROGRAMFILES"
    ${EndIf} 
    ;       InstallDir "$PROGRAMFILES\MyDefrag v4.3.1"
    StrCpy $InstallDirTaylorDo "Scripts\TaylorDo"
    StrCpy $InstallDirFull $INSTDIR"\"$InstallDirTaylorDo
SectionEnd
 

; These are the programs that are needed by the Matt Taylor Disk Optimizer Suite.

; ///////////////////////////////////////////////////////
; ///////////////// Section My Defrag ///////////////////
Section "MyDefrag Section" MyDefrag
    SectionInstType ${IT_FULL} ${IT_CUSTOM}
    SetShellVarContext all
; Check if it exists.
    IfFileExists '$INSTDIR\MyDefrag v4.3.1\MyDefrag.exe' +2 0
        Goto myDefragInstall
        Goto myDefragExists
myDefragExists:
    ; Display message program exists.
    ; Do I want an uninstall/reinstall / repair?
    ; Command here.
Goto myDefragEnd
;
;--------------------------------
myDefragInstall:
    SetOutPath $INSTDIR
    SetOverwrite ifnewer
  ;
; \MyDefragVs4_3_1
    MessageBox MB_YESNO "Installing MyDefrag is required. Okay?" /SD IDYES IDNO myDefragEnd
        File "..\Download\MyDefrag-v4.3.1.exe"
        ExecWait '..\Download\MyDefrag-v4.3.1.exe'
        ; /DIR="x:\dirname"
        ; /SILENT
        ; /VERYSILENT (Hidden)
        ; /LOG "MyDefragInstallLog"
; check for error?
    Goto myDefragEnd
myDefragEnd:

SectionEnd

; ///////////////////////////////////////////////////////
; ///////////////// Section Matt Taylor Libraries ///////
Section "Matt Taylor Libraries" TaylorLibraries
    SectionInstType ${IT_FULL} ${IT_CUSTOM}
    SetShellVarContext all
    ; Initialization
        ; CreateDirectory $INSTDIR\backup
        ; CopyFiles $INSTDIR\*.log $INSTDIR\backup

    ; $OUTDIR 
        SetOutPath $InstallDirFull
        ; SetOutPath $INSTDIR\Scripts\TaylorDo

    ;--------------- Check if it exists ----------------- IT'S THE $ SIGN #2
    IfFileExists '$OUTDIR\$$ Readme.txt' +2 0
        Goto taylorDefragInstall
        Goto taylorDefragExists
    ;
    taylorDefragExists:
        ; Display message program exists.
        ; Do I want an uninstall/reinstall / repair?
        ; Command here.
    Goto taylorDefragEnd
    ;
    ;--------------------------------
    taylorDefragInstall:
    ;--------------------------------
    ;
    ;--------------- Copy Files -----------------
        CreateDirectory $InstallDirFull
        ; File ..\*.*
        File /r ..\*.*
    ;-------- Repair MyDefrag Install

        CopyFiles /SILENT '$INSTDIR\MyDefrag v4.3.1\Scripts\*.MyD' '$INSTDIR\MyDefrag v4.3.1\Example Scripts\'
        ; ExecWait 'copy "$INSTDIR\\MyDefrag v4.3.1\Scripts\*.MyD" "$INSTDIR\MyDefrag v4.3.1\Example Scripts\" /Y'
        Delete '$INSTDIR\MyDefrag v4.3.1\Scripts\*.MyD'

        ; Move '$INSTDIR\MyDefrag v4.3.1\Scripts\
        ; Move '$INSTDIR\MyDefrag v4.3.1\Scripts\AnalyzeOnly.MyD' '$INSTDIR\MyDefrag v4.3.1\ScriptsSaved\'
        ; Move '$INSTDIR\MyDefrag v4.3.1\Scripts\AutomaticDaily.MyD' '$INSTDIR\MyDefrag v4.3.1\ScriptsSaved\'
        ; Move '$INSTDIR\MyDefrag v4.3.1\Scripts\AutomaticMonthly.MyD' '$INSTDIR\MyDefrag v4.3.1\ScriptsSaved\'
        ; Move '$INSTDIR\MyDefrag v4.3.1\Scripts\AutomaticWeekly.MyD' '$INSTDIR\MyDefrag v4.3.1\ScriptsSaved\'

        ; Move '$INSTDIR\MyDefrag v4.3.1\Scripts\ConsolidateFreeSpace.MyD' '$INSTDIR\MyDefrag v4.3.1\ScriptsSaved\'
        ; Move '$INSTDIR\MyDefrag v4.3.1\Scripts\DataDiskDaily.MyD' '$INSTDIR\MyDefrag v4.3.1\ScriptsSaved\'
        ; Move '$INSTDIR\MyDefrag v4.3.1\Scripts\DataDiskMonthly.MyD' '$INSTDIR\MyDefrag v4.3.1\ScriptsSaved\'
        ; Move '$INSTDIR\MyDefrag v4.3.1\Scripts\DataDiskWeekly.MyD' '$INSTDIR\MyDefrag v4.3.1\ScriptsSaved\'

        ; Move '$INSTDIR\MyDefrag v4.3.1\Scripts\DefragmentOnly.MyD' '$INSTDIR\MyDefrag v4.3.1\ScriptsSaved\'
        ; Move '$INSTDIR\MyDefrag v4.3.1\Scripts\FlashMemoryDisks.MyD' '$INSTDIR\MyDefrag v4.3.1\ScriptsSaved\'
        ; Move '$INSTDIR\MyDefrag v4.3.1\Scripts\LogTest.MyD' '$INSTDIR\MyDefrag v4.3.1\ScriptsSaved\'
        ; Move '$INSTDIR\MyDefrag v4.3.1\Scripts\Settings.MyD' '$INSTDIR\MyDefrag v4.3.1\ScriptsSaved\'

        ; Move '$INSTDIR\MyDefrag v4.3.1\Scripts\SystemDiskDaily.MyD' '$INSTDIR\MyDefrag v4.3.1\ScriptsSaved\'
        ; Move '$INSTDIR\MyDefrag v4.3.1\Scripts\SystemDiskMonthly.MyD' '$INSTDIR\MyDefrag v4.3.1\ScriptsSaved\'
        ; Move '$INSTDIR\MyDefrag v4.3.1\Scripts\SystemDiskWeekly.MyD' '$INSTDIR\MyDefrag v4.3.1\ScriptsSaved\'

    ; ///////////////////////////////////////////////////////
    ;--------------------------------
    ; TODO MyDefrag Pointers to TaylorDo Scripts
    ; (The installation directories can be different)

    ;--------------------------------
    ; TODO TaylorDo Pointers to MyDefrag

    ; ///////////////////////////////////////////////////////
    ;--------------- Registry -----------------
      ; Get installation folder from registry if available
      ;InstallDirRegKey HKCU "Software\${PRODUCT_NAME}" "Install_Dir"

      ; Write the installation path into the registry
      WriteRegStr HKLM "Software\${PRODUCT_NAME}" "Install_Dir" "$INSTDIR"
  
      ; Write the uninstall keys for Windows
      WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\$StartMenuFolder" "DisplayName" "$StartMenuFolder (remove only)"
      WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\$StartMenuFolder" "DisplayIcon" "$INSTDIR\Uninstall.exe"
      WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\$StartMenuFolder" "UninstallString" '"$INSTDIR\uninstall.exe"'
      WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\$StartMenuFolder" "NoModify" 1
      WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\$StartMenuFolder" "NoRepair" 0
        ; WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\$StartMenuFolder" "NoRepair" 1
      WriteUninstaller "$INSTDIR\uninstall.exe"

    ;--------------- end of regristry keys -----------------
    ;
    ;--------------------------------
    ; Uninstall
    ;--------------------------------
    WriteUninstaller $INSTDIR\uninstaller.exe

    ;--------------------------------
    taylorDefragEnd:
    ;--------------- end of INSTALL Matt Taylor Libraries -----------------
SectionEnd

; ///////////////////////////////////////////////////////
Section "TalyorDo Startmenu" TaylorStartMenu
    ;--------------------------------
    ; TODO Start Menu
    ; $INSTDIR\?\?

    ;--------------- CREATE SHORT CUTS -----------------
MessageBox MB_YESNO|MB_ICONQUESTION "Do you wish to create start-menu shortcuts for ${MUI_PRODUCT}?" IDNO NoShortcuts

    ; Var /GLOBAL StartMenuFolder 
    StrCpy $StartMenuFolder "${PRODUCT_NAME}"

      ;Remember the Start Menu Folder
      ;!define MUI_STARTMENUPAGE_REGISTRY_ROOT "HKCU" 
      ;!define MUI_STARTMENUPAGE_REGISTRY_KEY "Software\${PRODUCT_NAME}"
      ;!define MUI_STARTMENUPAGE_REGISTRY_VALUENAME "StartMenuFolder"

    ; CreateDirectory "$SMPROGRAMS\$StartMenuFolder"

    ; !insertmacro MUI_STARTMENU_WRITE_BEGIN
        ; Create shortcuts
        ; CreateDirectory "$SMPROGRAMS\${MUI_STARTMENUPAGE_VARIABLE}"
        ; CreateShortCut "$SMPROGRAMS\${MUI_STARTMENUPAGE_VARIABLE}\<yourapp>.lnk" "$INSTDIR\<yourfile>.<ext>"
    ; !insertmacro MUI_STARTMENU_WRITE_END

    ;!insertmacro MUI_STARTMENU_WRITE_BEGIN
        ;CreateDirectory "$SMPROGRAMS\${COMPANY_NAME}"
        ;CreateDirectory "$SMPROGRAMS\${COMPANY_NAME}\${MUI_PRODUCT}"
        ;CreateShortCut "$SMPROGRAMS\${COMPANY_NAME}\${MUI_PRODUCT}\Uninstall.lnk" "$INSTDIR\uninstall.exe" "" "$INSTDIR\uninstall.exe" 0
        ;CreateShortCut "$SMPROGRAMS\${COMPANY_NAME}\${MUI_PRODUCT}\${MUI_PRODUCT}.lnk" "$INSTDIR\${EXE_NAME}" "" "$INSTDIR\${EXE_NAME}" 0
    ;!insertmacro MUI_STARTMENU_WRITE_END

    ;--------------------------------
    CreateDirectory "$SMPROGRAMS\$StartMenuFolder"

    CreateShortCut "$SMPROGRAMS\$StartMenuFolder\ScriptCommands.lnk" '$SYSDIR\explorer.exe -root, "$InstallDirFull\Commands"'
    ; CreateShortCut "$SMPROGRAMS\$StartMenuFolder\ScriptCommands.lnk" '$SYSDIR\explorer.exe -root, "$INSTDIR\MyDefrag v4.3.1\Commands"'

    CreateShortCut "$SMPROGRAMS\$StartMenuFolder\ScriptsByDrive.lnk" '$SYSDIR\explorer.exe -root, "$INSTDIR\MyDefrag v4.3.1\Scripts\ScriptsByDrive"'

    CreateShortCut "$SMPROGRAMS\$StartMenuFolder\ScriptsAutomatic.lnk" '$SYSDIR\explorer.exe -root, "$INSTDIR\MyDefrag v4.3.1\Scripts\ScriptsAutomatic"'

    CreateShortCut "$SMPROGRAMS\$StartMenuFolder\Daily.lnk" '$SYSDIR\explorer.exe -root, "$INSTDIR\MyDefrag v4.3.1\Scripts\ScriptDaily"'

    CreateShortCut "$SMPROGRAMS\$StartMenuFolder\Weekly.lnk" '$SYSDIR\explorer.exe -root, "$INSTDIR\MyDefrag v4.3.1\Scripts\ScriptWeekly"'

    CreateShortCut "$SMPROGRAMS\$StartMenuFolder\Monthly.lnk" '$SYSDIR\explorer.exe -root, "$INSTDIR\MyDefrag v4.3.1\Scripts\ScriptMonthly"'

    CreateShortCut "$SMPROGRAMS\$StartMenuFolder\Yearly.lnk" '$SYSDIR\explorer.exe -root, "$INSTDIR\MyDefrag v4.3.1\Scripts\ScriptYearly"'

    ; CopyFiles /SILENT '$SMPROGRAMS\$StartMenuFolder\*.lnk' '$INSTDIR\MyDefrag v4.3.1\Scripts\'

    ; CreateShortCut "$SMPROGRAMS\$StartMenuFolder\Run NSIS Example Application 1.lnk" "$SYSDIR\javaw.exe" "NSISExampleApplication1"

    ; ///////////////////////////////////////////////////////
    ;--------------------------------
    ; Uninstall
    CreateShortCut "$SMPROGRAMS\$StartMenuFolder\Uninstall Example Application 1.lnk" "$INSTDIR\Uninstall.exe"

    ;--------------- end of shortcuts -----------------
    NoShortcuts:

SectionEnd

    ;--------------- Task Manager -----------------
Section "TalyorDo Task Manager" TaylorTaskMgr
MessageBox MB_YESNO|MB_ICONQUESTION "Do you wish to disable (required) the Windows defragger?" IDNO NoTaskDisable

; ToDo

    NoTaskDisable:

MessageBox MB_YESNO|MB_ICONQUESTION "Do you wish to schedule regular optimiations by ${MUI_PRODUCT}?" IDNO NoTaskSchedule


; ToDo

    ;--------------- end of Task Manager -----------------
    NoTaskSchedule:

SectionEnd

; ///////////////////////////////////////////////////////
;---------------- Descriptions ----------------
;Language strings
LangString DESC_MyDefrag ${LANG_ENGLISH} "Required executable libraries."
LangString DESC_TaylorLibraries ${LANG_ENGLISH} "Required script libraries."

;Assign language strings to sections
!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
!insertmacro MUI_DESCRIPTION_TEXT ${MyDefrag} $(DESC_MyDefrag)
!insertmacro MUI_DESCRIPTION_TEXT ${TaylorLibraries} $(DESC_TaylorLibraries)
!insertmacro MUI_FUNCTION_DESCRIPTION_END

; ///////////////////////////////////////////////////////
; ///////////////// UNISTALL ///////////////////////////

;--------------------------------
; Uninstaller Section

Section Uninstall
    SectionInstType ${IT_FULL} ${IT_CUSTOM}
    SetShellVarContext all

  ;ADD YOUR OWN FILES HERE...
unTaylorDefrag:

    Delete "$INSTDIR\Uninstall.exe"

    RMDir "$INSTDIR"

    ; Start Menu

    ; Registry
    DeleteRegKey /ifempty HKCU "Software\${PRODUCT_NAME}"

unMyDefrag:
; Check if it exists.
    IfFileExists '$INSTDIR\MyDefrag v4.3.1\MyDefrag.exe' +2 0
        Goto unMyDefragEnd
        Goto unMyDefragExists

unMyDefragExists:
    ExecWait '$INSTDIR\unins000.exe'
;Goto unMyDefragEnd
unMyDefragEnd:

SectionEnd

; ;Uninstaller Section
  ; ;must be the first in this sektion
  ; ;when you are going to delete the whole key later
  ; ; DeleteRegKey HKCU "Software\<yoursoft>"

  ; ; Remove shortcuts
  ; Push $R0
  ; ;ReadRegStr $R0 HKCU "Software\<yoursoft>" "StartMenuFolder"
  ; ReadRegStr $R0 ${MUI_STARTMENUPAGE_REGISTRY_ROOT} ${MUI_STARTMENUPAGE_REGISTRY_KEY} ${MUI_STARTMENUPAGE_REGISTRY_VALUENAME}
  ; StrCmp $R0 "" noshortcuts
    ; RMDir /r "$SMPROGRAMS\$R0"
  ; Pop $R0
; noshortcuts:
; ///////////////////////////////////////////////////////
; Source: Scheduled Tasks https://nsis.sourceforge.io/Scheduled_Tasks
; Author: First: brainsucker, This: 
; ///////////////////////////////////////////////////////
; Adds a scheduled task running as a different user than the one
; running the installer. Modified from a script by brainsucker
; 
; (c) Justin Dearing <zippy1981@gmail.com>, 2006
; (c) brainsucker, 2002
 
 
