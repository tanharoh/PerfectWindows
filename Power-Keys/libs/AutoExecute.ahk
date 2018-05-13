AutoExecute:

if A_Is64bitOS&(bit=86)
{
    msgbox,0x40010,Power Keys,%_Require64%
    exitapp
}

if !A_IsAdmin
{
    try
    {
        Run *RunAs "%A_ScriptFullPath%" /restart
    }
    ExitApp
}

Suspend,off

regread,temp,HKLM\Software\Microsoft\Windows\CurrentVersion\Run, Power Keys
if !ErrorLevel
StartUp=1

regread,temp,HKLM\Software\szzhiyang\Power Keys,SpaceDisabled
if temp
SpaceDisabled=1

EnvGet,AppDataLocal,LocalAppData

FileCreateDir,%AppDataLocal%\Power Keys
SetWorkingDir,%AppDataLocal%\Power Keys

gosub,update

SetNumLockState, alwayson

Gui,welcome: +LastFound +AlwaysOnTop -Caption +ToolWindow
Gui,welcome: Color, red
Gui,welcome: Font,cwhite s30 wbold q5,Segoe UI
Gui,welcome: Add, Text, ,Power Keys
if 1!=silent
{
    Gui,welcome: Show,AutoSize Center NoActivate
    sleep 1000
    Gui,welcome: Hide
}
Gui,indicator: Color, red
Gui,indicator2: Color, yellow

RegDelete, HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run, Power Keys
RegDelete, HKCU\Software\Microsoft\Windows\CurrentVersion\Run, Power Keys
RegDelete, HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run, Power Keys

Gosub, Createtray

return

Update:
Loop,5
{
    Process,Close,Power-Keys-Updater.exe
    FileCreateDir,%UpdateDir%
    filecopy,%A_ScriptFullPath%,%UpdateDir%\Power-Keys-Updater.exe,1
}
run,"%UpdateDir%\Power-Keys-Updater.exe" update "%A_ScriptName%" "%A_ScriptFullPath%",,UseErrorLevel
return