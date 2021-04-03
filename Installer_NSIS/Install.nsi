# Modern UI
!include MUI2.nsh
# nsDialogs
!include nsDialogs.nsh
# LogicLib
!include LogicLib.nsh

Name "NBT Explorer Japanese"
OutFile "NBTExplorerJ_Install.exe"
InstallDir "$PROGRAMFILES\NBTExplorerJ"
SetCompressor lzma
RequestExecutionLevel admin

XPStyle on 
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE "..\LICENSE.txt"
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH
# UnInst
!insertmacro MUI_UNPAGE_WELCOME
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES
!insertmacro MUI_UNPAGE_FINISH
# JPUI
!insertmacro MUI_LANGUAGE "Japanese"
# IFCE
!define MUI_ABORTWARNING

Section 
    SetOutPath "$INSTDIR"
    File "..\Staging\NBTExplorer.exe"
    File "..\Staging\NBTExplorer.exe.config"
    File "..\Staging\NBTUtil.exe"
    File "..\Staging\NBTUtil.exe.config"
    File "..\Staging\NBTModel.dll"
    File "..\Staging\Substrate.dll"
    File "..\Staging\Windows\NBTExplorer.visualelementsmanifest.xml"
    File "..\LICENSE.txt"
    WriteUninstaller "$INSTDIR\Uninstall.exe"
    CreateDirectory "$SMPROGRAMS\NBTExplorerJ"
    SetOutPath "$INSTDIR"
    CreateShortcut "$SMPROGRAMS\NBTExplorerJ\NBT Explorer Japanese.lnk" "$INSTDIR\NBTExplorer.exe" ""
    CreateShortcut "$SMPROGRAMS\NBTExplorerJ\Uninstall.lnk" "$INSTDIR\Uninstall.exe" ""
  
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\NBTExplorerJ" "DisplayName" "NBT Explorer Japanese"
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\NBTExplorerJ" "DisplayVersion" "2.8.0"
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\NBTExplorerJ" "UninstallString" '"$INSTDIR\Uninstall.exe"'
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\NBTExplorerJ" "DisplayIcon" '"$INSTDIR\NBTExplorer.exe"'
SectionEnd
Section "Uninstall"
    Delete "$INSTDIR\Uninstall.exe"
    Delete "$INSTDIR\NBTExplorer.exe"
    Delete "$INSTDIR\NBTExplorer.exe.config"
    Delete "$INSTDIR\NBTUtil.exe"
    Delete "$INSTDIR\NBTUtil.exe.config"
    Delete "$INSTDIR\NBTModel.dll"
    Delete "$INSTDIR\Substrate.dll"
    Delete "$INSTDIR\LICENSE.txt"
    Delete "$INSTDIR\NBTExplorer.visualelementsmanifest.xml"
    Delete "$SMPROGRAMS\NBTExplorerJ\NBT Explorer Japanese.lnk"
    Delete "$SMPROGRAMS\NBTExplorerJ\Uninstall.lnk"
    RMDir "$SMPROGRAMS\NBTExplorerJ"
    RMDir "$INSTDIR"
    DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\NBTExplorerJ"
SectionEnd