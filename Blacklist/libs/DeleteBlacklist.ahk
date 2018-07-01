DeleteBlacklist:
FileDelete,Delete.Blacklist
loop,reg,HKLM\SOFTWARE\Policies\Microsoft\Windows\Safer,kvr
{
    FileAppend, %A_LoopRegKey%\%A_LoopRegSubKey% [1 7 17]`n`n, Delete.Blacklist
}
FileAppend,
(
HKEY_CLASSES_ROOT\Directory\Background\shell\VirusTotal [1 7 17]
HKEY_CLASSES_ROOT\Directory\Background\shell\VirusTotal\command [1 7 17]
HKEY_CLASSES_ROOT\Directory\Background\shell\edit [1 7 17]
HKEY_CLASSES_ROOT\Directory\Background\shell\edit\command [1 7 17]
HKLM\SOFTWARE\Policies\Microsoft\Windows\Safer [1 7 17]
HKLM\SOFTWARE\Policies\Microsoft\SystemCertificates\TrustedPublisher\Safer [1 7 17]
HKLM\SOFTWARE\Policies\Microsoft\Windows\Safer [DELETE]
HKEY_CLASSES_ROOT\Directory\Background\shell\VirusTotal [DELETE]
HKEY_CLASSES_ROOT\Directory\Background\shell\edit [DELETE]
HKLM\SOFTWARE\Policies\Microsoft\SystemCertificates\TrustedPublisher\Safer [DELETE]

),Delete.Blacklist
RunWait,regini.exe Delete.Blacklist,,Hide UseErrorLevel
if ErrorLevel
{
    MsgBox,0x40010,Blacklist,%_RuntimeError%
    ExitApp
}
FileDelete,Delete.Blacklist
Return