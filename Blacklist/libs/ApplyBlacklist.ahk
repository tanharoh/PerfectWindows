ApplyBlacklist:
FileDelete,Apply.Blacklist
DriveGet, DriveList,List,Fixed
Loop, Parse,DriveList,,
{
    num:=A_Index+10
    FileAppend,HKLM\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\262144\Paths\{91fc058a-3015-4608-b3a6-4a8ba079c0%num%}`n,Apply.Blacklist
    FileAppend,SaferFlags=reg_dword 0`n,Apply.Blacklist
    FileAppend,ItemData="%A_LoopField%:\"`n`n,Apply.Blacklist
    FileAppend,HKLM\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\0\Paths\{91fc058a-3015-4608-b3a6-4a8ba079c1%num%}`n,Apply.Blacklist
    FileAppend,SaferFlags=reg_dword 0`n,Apply.Blacklist
    FileAppend,ItemData="%A_LoopField%:\Blacklist"`n`n,Apply.Blacklist
}
FileAppend,
(
HKLM\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\262144\Paths\{91fc058a-3015-4608-b3a6-4a8ba079c000}
SaferFlags=reg_dword 0
ItemData="%OSDrive%\"

HKLM\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\262144\Paths\{91fc058a-3015-4608-b3a6-4a8ba079c007}
SaferFlags=reg_dword 0
ItemData="X:\"

HKLM\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\262144\Paths\{91fc058a-3015-4608-b3a6-4a8ba079c008}
SaferFlags=reg_dword 0
ItemData="Y:\"

HKLM\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\262144\Paths\{91fc058a-3015-4608-b3a6-4a8ba079c009}
SaferFlags=reg_dword 0
ItemData="Z:\"

HKLM\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\0\Paths\{91fc058a-3015-4608-b3a6-4a8ba079c002}
SaferFlags=reg_dword 0
ItemData="%OSDrive%\Users\*\AppData\Local\Microsoft\Windows\I*\*"

HKLM\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\0\Paths\{91fc058a-3015-4608-b3a6-4a8ba079c003}
SaferFlags=reg_dword 0
ItemData="%OSDrive%\Users\*\AppData\Local\Packages\*"

HKLM\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\0\Paths\{91fc058a-3015-4608-b3a6-4a8ba079c201}
SaferFlags=reg_dword 0
ItemData="%OSDrive%\Users\*\AppData\Local\Temp\7zO*"

HKLM\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\262144\Paths\{91fc058a-3015-4608-b3a6-4a8ba079c202}
SaferFlags=reg_dword 0
ItemData="%OSDrive%\Users\*\AppData\Local\Temp\7z*.tmp\*"

HKLM\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\0\Paths\{91fc058a-3015-4608-b3a6-4a8ba079c203}
SaferFlags=reg_dword 0
ItemData="%OSDrive%\Users\*\AppData\Local\Temp\Temp1*.zip\*"

HKLM\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers
AuthenticodeEnabled=reg_dword 0
DefaultLevel=reg_dword 0
TransparentEnabled=reg_dword 1
PolicyScope=reg_dword 0
ExecutableTypes=reg_multi_sz "WSC" "VB" "URL" "SHS" "SCR" "RUBY" "REG" "RB" "PYTHON" "PY" "PS1" "PL" "PIF" "PHP" "PCD" "OCX" "MST" "MSP" "MSI" "MSC" "MDE" "MDB" "LUA" "LNK" "JSP" "ISP" "INS" "INF" "HTML" "HTM" "HTA" "HLP" "EXE" "CSS" "CRT" "CPL" "COM" "CMD" "CHM" "BAT" "BAS" "ASP" "AHK" "ADP" "ADE"

HKEY_CLASSES_ROOT\Directory\Background\shell\VirusTotal\command
@=mshta vbscript:CreateObject("Shell.Application").ShellExecute("https://www.virustotal.com")(window.close)

HKEY_CLASSES_ROOT\Directory\Background\shell\VirusTotal
HasLUAShield=""

HKEY_CLASSES_ROOT\Directory\Background\shell\edit
icon=notepad.exe

HKEY_CLASSES_ROOT\Directory\Background\shell\edit\command
@=notepad.exe

),Apply.Blacklist
RunWait,regini.exe Apply.Blacklist,,Hide UseErrorLevel
if ErrorLevel
{
    MsgBox,0x40010,Blacklist,ERROR!
    ExitApp
}
FileDelete,Apply.Blacklist
Return