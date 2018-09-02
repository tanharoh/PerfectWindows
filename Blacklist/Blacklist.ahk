#Include libs\Language.ahk
#SingleInstance ignore
#MaxHotkeysPerInterval 1000
#Persistent
#NoTrayIcon
#NoEnv

EnvGet, OSDrive, systemdrive

version:="1.7"
BlacklistStatus=%_WillBeDisabled%
WDStatus=%_WillBeEnabled%
HelpLink="https://WindowsBlacklist.github.io"

if !A_IsAdmin
{
    Try
    {
        Run *RunAs "%A_ScriptFullPath%" /restart
    }
    ExitApp
}

SetWorkingDir, %A_WinDir%\system32
FileCreateDir, %OSDrive%:\Blacklist
RegDelete,HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System,DisableRegistryTools
Runwait,takeown.exe /F regini.exe /A,,hide
Runwait,takeown.exe /F mshta.exe /A,,hide
Runwait,icacls.exe regini.exe /reset,,hide UseErrorLevel
if ErrorLevel
{
    MsgBox,0x40010,Blacklist,%_RuntimeError%
    ExitApp
}
Runwait,icacls.exe mshta.exe /reset,,hide UseErrorLevel
if ErrorLevel
{
    MsgBox,0x40010,Blacklist,%_RuntimeError%
    ExitApp
}
Gosub,DeleteBlacklist
Gosub,EnableWD
MsgBox, 0x40024, Blacklist %version%,%_EnableBlacklist%
IfMsgBox, Yes
{
    Gosub,ApplyBlacklist
    Gosub,ProtectBlacklist
    BlacklistStatus=%_WillBeEnabled%
}
MsgBox, 0x40124, Blacklist %version%,%_DisableWD%
IfMsgBox,Yes
{
    Gosub,DisableWD
    WDStatus=%_WillBeDisabled%
}
MsgBox,0x40030, Blacklist %version%,%_AfterRestart%`n`nWindows Defender %WDStatus%`n`nBlacklist %BlacklistStatus%
ShellRun(HelpLink)
ExitApp
Return

#Include libs\ShellRun.ahk
#Include libs\WindowsDefender.ahk
#Include libs\ApplyBlacklist.ahk
#Include libs\DeleteBlacklist.ahk
#Include libs\ProtectBlacklist.ahk