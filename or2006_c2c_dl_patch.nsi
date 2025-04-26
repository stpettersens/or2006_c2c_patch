; OutRun 2006 Coast 2 Coast Patch installer
; Patches incorrectly placed effects and
; provides a no disc game required executable.
; Also provides additional tweaks provided by:
; https://github.com/emoose/OutRun2006Tweaks
;
; This version dowloads the ZIP patch from GitHub.
;
; This installer script was written by Sam Saint-Pettersen

;--------------------------------
;Include Modern UI

  !include "MUI2.nsh"

;--------------------------------
;General

  ;Name and file
  Name "OutRun 2006 Coast 2 Coast Patch"
  OutFile "or2006_c2c_dl_patch_0.6.1.exe"
  Unicode True

  ;Default installation folder
  InstallDir "C:\Program Files (x86)\Sega\OutRun2006 Coast 2 Coast"

  ; Show install details.
  ShowInstDetails show

  ;Get installation folder from registry if available
  InstallDirRegKey HKCU "Software\or2006_c2c_patch" ""

  ;Request application privileges for Windows Vista
  RequestExecutionLevel admin

;--------------------------------
;Interface Settings

  !define MUI_ABORTWARNING

;--------------------------------
;Pages

  !insertmacro MUI_PAGE_WELCOME
  !insertmacro MUI_PAGE_DIRECTORY
  !insertmacro MUI_PAGE_INSTFILES

  !insertmacro MUI_UNPAGE_WELCOME
  !insertmacro MUI_UNPAGE_CONFIRM
  !insertmacro MUI_UNPAGE_INSTFILES
  !insertmacro MUI_UNPAGE_FINISH

;--------------------------------
;Languages

  !insertmacro MUI_LANGUAGE "English"

;--------------------------------
;Installer Sections

Section "Dummy Section" SecDummy

  ; Check that base game has been installed first.
  ${If} ${FileExists} `$INSTDIR\OR2006C2C.EXE`
    DetailPrint "Detected game executable..."
    DetailPrint "Done."
  ${Else}
    DetailPrint "Please install OutRun 2006 Coast 2 Coast game first."
    Abort "Patch installation aborted."
  ${EndIf}

  ; Check that patch has not already been installed first.
  ${If} ${FileExists} `$INSTDIR\patch\OR2006C2C.exe`
    DetailPrint "Patch has already been installed."
    Abort "Patch installation aborted."
  ${EndIf}

  ; Install patch files.
  DetailPrint "Installing patch files..."
  SetOutPath "$INSTDIR"
  File "patch_exe.cmd"
  File "restore_exe.cmd"
  File "fix_effects.cmd"

  InitPluginsDir

  ; Define ZIP file and save path.
  StrCpy $R0 "0.6.1"
  StrCpy $R1 "OutRun2006Tweaks-$R0.zip"
  StrCpy $R2 "$INSTDIR\$R1"

  ; Download ZIP patch from GitHub.
  DetailPrint "Downloading $R1..."
  inetc::get /SILENT /URL "https://github.com/emoose/OutRun2006Tweaks/releases/download/v$R0/$R1" "$R2"
  Pop $0
  DetailPrint "Download result: $0"
  StrCmp $0 "OK" downloaded
  DetailPrint "Failed to download zipped patch files."
  Abort "Patch installation aborted."

  downloaded:
  DetailPrint "Downloaded to $R2"
  DetailPrint "Done."

  ; Extract ZIP file to \patch.
  DetailPrint "Unzipping $R1..."
  SetOutPath "$INSTDIR\patch"
  nsisunz::UnzipToLog "$R2" "$INSTDIR\patch"
  Pop $0
  StrCmp $0 "success" unzipped
  DetailPrint "$0" ; Print error message to log
  Delete "$R2" ; Delete ZIP as unzip failed.
  DetailPrint "Failed to unzip patch files."
  Abort "Patch installation aborted."

  unzipped:
  DetailPrint "Done."

  ; Patch original game executable.
  DetailPrint "Patching game executable..."
  nsExec::ExecToStack "$INSTDIR\patch_exe.cmd"
  DetailPrint "Done."

  ; Patch missing lens flare and bloom...
  DetailPrint "Patching to fix missing lens flare and bloom..."
  nsExec::ExecToStack "$INSTDIR\fix_effects.cmd"
  DetailPrint "Done."

  ; Delete ZIP as it has been extracted by this point.
  Delete "$R2"

  ;Store installation folder
  WriteRegStr HKCU "Software\or2006_c2c_patch" "" $INSTDIR

  ;Create uninstaller
  WriteUninstaller "$INSTDIR\Uninstall.exe"

SectionEnd

;--------------------------------
;Uninstaller Section

Section "Uninstall"

  Delete "$INSTDIR\patch_exe.cmd"
  Delete "$INSTDIR\restore_exe.cmd"

  Delete "$INSTDIR\patch\dinput8.dll"
  Delete "$INSTDIR\patch\OR2006C2C.exe"
  Delete "$INSTDIR\patch\OutRun2006Tweaks.ini"
  RMDir "$INSTDIR\patch"

  Delete "$INSTDIR\Uninstall.exe"

  RMDir "$INSTDIR"

  DeleteRegKey /ifempty HKCU "Software\or2006_c2c_patch"

SectionEnd
