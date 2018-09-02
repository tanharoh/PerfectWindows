ApplyBlacklist:
FileDelete,Apply.Blacklist
DriveGet,DriveList,List,Fixed
Loop,Parse,DriveList,,
{
    num:=A_Index+10
    FileCreateDir, %A_LoopField%:\Blacklist

    FileAppend,HKLM\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\262144\Paths\{91fc058a-3015-4608-b3a6-4a8ba079c0%num%}`n,Apply.Blacklist
    FileAppend,SaferFlags=reg_dword 0`n,Apply.Blacklist
    FileAppend,ItemData="%A_LoopField%:\"`n`n,Apply.Blacklist

    FileAppend,HKLM\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\262144\Paths\{91fc058a-3015-4608-b3a6-4a8ba179c0%num%}`n,Apply.Blacklist
    FileAppend,SaferFlags=reg_dword 0`n,Apply.Blacklist
    FileAppend,ItemData="\\?\%A_LoopField%:\"`n`n,Apply.Blacklist

    FileAppend,HKLM\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\0\Paths\{91fc058a-3015-4608-b3a6-4a8ba079c1%num%}`n,Apply.Blacklist
    FileAppend,SaferFlags=reg_dword 0`n,Apply.Blacklist
    FileAppend,ItemData="%A_LoopField%:\Blacklist"`n`n,Apply.Blacklist

    FileAppend,HKLM\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\0\Paths\{91fc058a-3015-4608-b3a6-4a8ba179c1%num%}`n,Apply.Blacklist
    FileAppend,SaferFlags=reg_dword 0`n,Apply.Blacklist
    FileAppend,ItemData="\\?\%A_LoopField%:\Blacklist"`n`n,Apply.Blacklist
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

HKLM\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\0\Paths\{91fc058a-3015-4608-b3a6-4a8ba079c203}
SaferFlags=reg_dword 0
ItemData="%OSDrive%\Users\*\AppData\Roaming\Foxmail*\Temp*"

HKLM\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\262144\Paths\{91fc058a-3015-4608-b3a6-4a8ba179c000}
SaferFlags=reg_dword 0
ItemData="\\?\%OSDrive%\"

HKLM\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\262144\Paths\{91fc058a-3015-4608-b3a6-4a8ba179c007}
SaferFlags=reg_dword 0
ItemData="\\?\X:\"

HKLM\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\262144\Paths\{91fc058a-3015-4608-b3a6-4a8ba179c008}
SaferFlags=reg_dword 0
ItemData="\\?\Y:\"

HKLM\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\262144\Paths\{91fc058a-3015-4608-b3a6-4a8ba179c009}
SaferFlags=reg_dword 0
ItemData="\\?\Z:\"

HKLM\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\0\Paths\{91fc058a-3015-4608-b3a6-4a8ba179c002}
SaferFlags=reg_dword 0
ItemData="\\?\%OSDrive%\Users\*\AppData\Local\Microsoft\Windows\I*\*"

HKLM\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\0\Paths\{91fc058a-3015-4608-b3a6-4a8ba179c003}
SaferFlags=reg_dword 0
ItemData="\\?\%OSDrive%\Users\*\AppData\Local\Packages\*"

HKLM\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\0\Paths\{91fc058a-3015-4608-b3a6-4a8ba179c201}
SaferFlags=reg_dword 0
ItemData="\\?\%OSDrive%\Users\*\AppData\Local\Temp\7zO*"

HKLM\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\262144\Paths\{91fc058a-3015-4608-b3a6-4a8ba179c202}
SaferFlags=reg_dword 0
ItemData="\\?\%OSDrive%\Users\*\AppData\Local\Temp\7z*.tmp\*"

HKLM\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\0\Paths\{91fc058a-3015-4608-b3a6-4a8ba179c203}
SaferFlags=reg_dword 0
ItemData="\\?\%OSDrive%\Users\*\AppData\Local\Temp\Temp1*.zip\*"

HKLM\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\0\Paths\{91fc058a-3015-4608-b3a6-4a8ba179c203}
SaferFlags=reg_dword 0
ItemData="\\?\%OSDrive%\Users\*\AppData\Roaming\Foxmail*\Temp*"

HKLM\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers
AuthenticodeEnabled=reg_dword 0
DefaultLevel=reg_dword 0
TransparentEnabled=reg_dword 1
PolicyScope=reg_dword 0
ExecutableTypes=reg_multi_sz "WSH" "WSF" "WSC" "WS" "VSW" "VST" "VSS" "VSMACROS" "VBS" "VBE" "VB" "URL" "TMP" "SHS" "SHB" "SCT" "SCR" "SCF" "RUBY" "REG" "RB" "PYTHON" "PY" "PST" "PS1" "PRG" "PRF" "PL" "PIF" "PHP" "PCD" "OPS" "OCX" "MST" "MSP" "MSI" "MSC" "MDZ" "MDW" "MDT" "MDE" "MDB" "MDA" "MAW" "MAV" "MAU" "MAT" "MAS" "MAR" "MAQ" "MAM" "MAG" "MAF" "MAD" "LUA" "LNK" "KSH" "JSP" "JSE" "JS" "ITS" "ISP" "INS" "INF" "HTA" "HLP" "FXP" "EXE" "CSH" "CRT" "CPL" "COM" "CMD" "CHM" "CER" "BAT" "BAS" "ASP" "APP" "AHK" "ADP" "ADE"

HKEY_CLASSES_ROOT\Directory\Background\shell\VirusTotal\command
@=mshta vbscript:CreateObject("Shell.Application").ShellExecute("https://www.virustotal.com/#/home/upload")(window.close)

HKEY_CLASSES_ROOT\Directory\Background\shell\VirusTotal
HasLUAShield=""

HKEY_CLASSES_ROOT\Directory\Background\shell\edit
icon=notepad.exe

HKEY_CLASSES_ROOT\Directory\Background\shell\edit\command
@=notepad.exe

HKLM\SOFTWARE\Policies\Microsoft\SystemCertificates\TrustedPublisher\Safer [1 8 17]
HKLM\SOFTWARE\Policies\Microsoft\SystemCertificates\TrustedPublisher\Safer
AuthenticodeFlags=reg_dword 0

HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer [1 8 17]
HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer
NoDriveTypeAutoRun=reg_dword 255
NoAutorun=reg_dword 1

HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer [1 7 17]
NoDriveTypeAutoRun=reg_dword 255
NoAutorun=reg_dword 1

HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System [1 8 17]
EnableLUA=reg_dword 1
ValidateAdminCodeSignatures=reg_dword 0
ConsentPromptBehaviorAdmin=reg_dword 5
ConsentPromptBehaviorUser=reg_dword 3
PromptOnSecureDesktop=reg_dword 1
EnableUIADesktopToggle=reg_dword 0
FilterAdministratorToken=reg_dword 1
EnableSecureUIAPaths=reg_dword 1
EnableInstallerDetection=reg_dword 1
EnableVirtualization=reg_dword 1

),Apply.Blacklist
RunWait,regini.exe Apply.Blacklist,,Hide
if ErrorLevel
{
    MsgBox,0x40010,Blacklist,%_RuntimeError%
    ExitApp
}
FileDelete,Apply.Blacklist
Return