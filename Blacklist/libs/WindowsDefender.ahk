DisableWD:
FileDelete,DisableWD.Blacklist
FileAppend,
(
HKLM\SOFTWARE\Policies\Microsoft\Windows Defender [1 7 17]
HKLM\SOFTWARE\Policies\Microsoft\Windows Defender
DisableAntispyware=reg_dword 1
HKLM\SOFTWARE\Policies\Microsoft\Windows Defender [2 8 19]

),DisableWD.Blacklist
RunWait,regini.exe DisableWD.Blacklist,,Hide UseErrorLevel
if ErrorLevel
{
    MsgBox,0x40010,Blacklist,%_RuntimeError%
    ExitApp
}
FileDelete,DisableWD.Blacklist
Return

EnableWD:
FileDelete,EnableWD.Blacklist
FileAppend,
(
HKLM\SOFTWARE\Policies\Microsoft\Windows Defender [1 7 17]
HKLM\SOFTWARE\Policies\Microsoft\Windows Defender
DisableAntispyware=DELETE
HKLM\SOFTWARE\Policies\Microsoft\Windows Defender [2 8 19]

),EnableWD.Blacklist
RunWait,regini.exe EnableWD.Blacklist,,Hide UseErrorLevel
if ErrorLevel
{
    MsgBox,0x40010,Blacklist,%_RuntimeError%
    ExitApp
}
FileDelete,EnableWD.Blacklist
Return