CreateTray:
menu,tray,icon,,,1
menu,tray,DeleteAll
menu,tray,NoStandard
menu,tray,UseErrorLevel
menu,tray,click,1
menu,tray,tip,Power Keys
menu,tray,add,Power Keys %v% by %_Author%,About
menu,tray,disable,Power Keys %v% by %_Author%
;menu,tray,add,%_Author%,Author
menu,tray,disable,%_Author%
menu,tray,add
menu,tray,add,%_StartUp%,StartUp
if StartUp
menu,tray,check,%_StartUp%
menu,tray,add,%_Help%,Help
menu,tray,add,%_Feedback%,Feedback
menu,tray,add
menu,tray,add,%_Exit%,Exit
menu,tray,add,%_Restart%,Restart
menu,tray,add
menu,tray,add,%_Config%,Config
menu,tray,add,%_EnableGameMode%,EnableGameMode
if !SpaceDisabled
{
    menu,tray,add,%_DisableSpace%,ToggleSpace
}
else
{
    menu,tray,add,%_EnableSpace%,ToggleSpace
}
Return

Author:
About:
License:
return

EnableGameMode:
RegWrite, REG_dword, HKLM\Software\szzhiyang\Power Keys,GameMode,1
GameMode=1
menu,tray,icon,,,1
menu,tray,DeleteAll
menu,tray,NoStandard
menu,tray,UseErrorLevel
menu,tray,click,1
menu,tray,tip,Power Keys
menu,tray,add,Power Keys %v% by %_Author%,About
menu,tray,disable,Power Keys %v% by %_Author%
menu,tray,add
menu,tray,add,%_DisableGameMode%,DisableGameMode
menu,tray,default,%_DisableGameMode%
Gosub,GameModeEnabled
return

DisableGameMode:
RegWrite, REG_dword, HKLM\Software\szzhiyang\Power Keys,GameMode,0
GameMode=0
Gosub,CreateTray
Gosub,GameModeDisabled
return

Startup:
if Startup
{
    RegDelete, HKLM\Software\Microsoft\Windows\CurrentVersion\Run, Power Keys
    StartUp=0
    menu,tray,uncheck,%_StartUp%
}
else
{
    RegWrite, REG_SZ, HKLM\Software\Microsoft\Windows\CurrentVersion\Run, Power Keys, %A_ScriptFullPath%
    StartUp=1
    menu,tray,check,%_StartUp%
}
return

ToggleSpace:
if SpaceDisabled
{
    SpaceDisabled=0
    RegWrite, REG_dword, HKLM\Software\szzhiyang\Power Keys,SpaceDisabled,0
    menu,tray,rename,%_EnableSpace%,%_DisableSpace%
    gosub,SpaceEnabled
}
else
{
    SpaceDisabled=1
    RegWrite, REG_dword, HKLM\Software\szzhiyang\Power Keys,SpaceDisabled,1
    menu,tray,rename,%_DisableSpace%,%_EnableSpace%
    gosub,SpaceDisabled
}
return

Help:
HelpLink=https://github.com/szzhiyang/PerfectWindows/wiki/Power-Keys
ShellRun(HelpLink)
return

Feedback:
FeedbackLink=https://github.com/szzhiyang/PerfectWindows/issues
ShellRun(FeedbackLink)
return

Restart:
RunWait, %A_WinDir%\system32\taskkill.exe /im Power-Keys-Updater.exe,,Hide
FileRemoveDir,%UpdateDir%,1
run,"%A_ScriptFullPath%" /restart,,UseErrorLevel
return

Config:
FileCreateDir,F1
FileCreateDir,F2
FileCreateDir,F3
FileCreateDir,F4
FileCreateDir,F5
FileCreateDir,F6
FileCreateDir,F7
FileCreateDir,F8
FileCreateDir,F9
FileCreateDir,F10
FileCreateDir,F11
FileCreateDir,F12
run,%A_WorkingDir%
return

Exit:
RunWait, %A_WinDir%\system32\taskkill.exe /im Power-Keys-Updater.exe,,Hide
FileRemoveDir,%UpdateDir%,1
exitapp
Return