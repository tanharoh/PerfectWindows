ProtectBlacklist:
FileDelete,Protect.Blacklist
loop,reg,HKLM\SOFTWARE\Policies\Microsoft\Windows\Safer,kvr
{
    FileAppend, %A_LoopRegKey%\%A_LoopRegSubKey% [2 8 19]`n`n, Protect.Blacklist
}
FileAppend,
(
HKEY_CLASSES_ROOT\Directory\Background\shell\VirusTotal [2 8 19]
HKEY_CLASSES_ROOT\Directory\Background\shell\edit [2 8 19]
HKEY_CLASSES_ROOT\Directory\Background\shell\VirusTotal\command [2 8 19]
HKEY_CLASSES_ROOT\Directory\Background\shell\edit\command [2 8 19]

),Protect.Blacklist
RunWait,regini.exe Protect.Blacklist,,Hide UseErrorLevel
if ErrorLevel
{
    MsgBox,0x40010,Blacklist,%_RuntimeError%
    ExitApp
}
FileDelete,Protect.Blacklist
Return

