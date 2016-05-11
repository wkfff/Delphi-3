; WMS.nsi
;
; This script is based on example1.nsi, but it remember the directory, 
; has uninstall support and (optionally) installs start menu shortcuts.
;
; It will install WMS.nsi into a directory that the user selects,

;--------------------------------
;Include Modern UI

  !include "MUI2.nsh"

;--------------------------------

; The name of the installer
Name "WMS"

; The file to write
OutFile "SETUP_WMS_FULL.exe"

; The default installation directory
InstallDir \WMS

; Registry key to check for directory (so if you install again, it will 
; overwrite the old one automatically)
InstallDirRegKey HKLM "Software\NSIS_WMS" "Install_Dir"

; Request application privileges for Windows Vista
RequestExecutionLevel admin

;--------------------------------
;Interface Settings

  !define MUI_ABORTWARNING

;--------------------------------
;Pages

;  !insertmacro MUI_PAGE_LICENSE "${NSISDIR}\Docs\Modern UI\License.txt"
  !insertmacro MUI_PAGE_COMPONENTS
  !insertmacro MUI_PAGE_DIRECTORY
  !insertmacro MUI_PAGE_INSTFILES

; Finish page
  !define MUI_FINISHPAGE_RUN "$INSTDIR\BDESetup.EXE"
;  !define MUI_FINISHPAGE_RUN_PARAMETERS "/i"
;  !define MUI_FINISHPAGE_RUN "$INSTDIR\MS-SQL_Native_Client_2008.msi"
;  !define MUI_FINISHPAGE_RUN "$INSTDIR\WMS.exe"
  !insertmacro MUI_PAGE_FINISH
  
  !insertmacro MUI_UNPAGE_CONFIRM
  !insertmacro MUI_UNPAGE_INSTFILES

;--------------------------------
; Pages

;Page components
;Page directory
;Page instfiles

;UninstPage uninstConfirm
;UninstPage instfiles

;--------------------------------
;Languages
 
  !insertmacro MUI_LANGUAGE "English"
;--------------------------------

; The stuff to install
Section "WMS (required)" SecDummy

  ; Set output path to the installation directory.
  SetOutPath $INSTDIR
  SetOverwrite on

  ; Put file there
  File "DAIHAN.exe"
  File "DBCNF.ini"
  File "..\..\..\..\BDESetup.EXE"
 
  ; Write the installation path into the registry
  WriteRegStr HKLM SOFTWARE\NSIS_WMS "Install_Dir" "$INSTDIR"
  
  ; Write the uninstall keys for Windows
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\WMS" "DisplayName" "NSIS WMS"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\WMS" "UninstallString" '"$INSTDIR\uninstall.exe"'
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\WMS" "NoModify" 1
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\WMS" "NoRepair" 1
  WriteUninstaller "uninstall.exe"
  
SectionEnd

; Optional section (can be disabled by the user)
Section "Start Menu Shortcuts"

  CreateDirectory "$SMPROGRAMS\WMS"
  CreateShortCut "$SMPROGRAMS\WMS\Uninstall.lnk" "$INSTDIR\uninstall.exe" "" "$INSTDIR\uninstall.exe" 0
  CreateShortCut "$SMPROGRAMS\WMS\WMS.lnk" "$INSTDIR\DAIHAN.exe" "" "$INSTDIR\DAIHAN.exe" 0
  CreateShortCut "$DESKTOP\WMS.lnk" "$INSTDIR\DAIHAN.exe"
  
SectionEnd

;--------------------------------
;Descriptions

  ;Language strings
  LangString DESC_SecDummy ${LANG_ENGLISH} "A test section."

  ;Assign language strings to sections
  !insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
    !insertmacro MUI_DESCRIPTION_TEXT ${SecDummy} $(DESC_SecDummy)
  !insertmacro MUI_FUNCTION_DESCRIPTION_END

;--------------------------------

; Uninstaller

Section "Uninstall"
  
  ; Remove registry keys
  DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\WMS"
  DeleteRegKey HKLM SOFTWARE\NSIS_WMS

  ; Remove files and uninstaller
  Delete $INSTDIR\DAIHAN.exe
  Delete $INSTDIR\DBCNF.ini
  Delete $INSTDIR\BDESetup.EXE
 
  Delete $INSTDIR\uninstall.exe

  ; Remove shortcuts, if any
  Delete "$SMPROGRAMS\WMS\*.*"
  Delete "$DESKTOP\WMS.lnk"

  ; Remove directories used
  RMDir "$SMPROGRAMS\WMS"
  RMDir "$INSTDIR"

SectionEnd
