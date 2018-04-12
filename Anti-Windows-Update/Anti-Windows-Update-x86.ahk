#SingleInstance ignore
#MaxHotkeysPerInterval 1000
#Persistent
#NoTrayIcon

v:="0.0.2"

if A_Is64bitOS
{
    msgbox,0x40130,Anti Windows Update,您必须使用本工具的 64 位版本`n以禁用或启用 Windows 自动更新！
    exitapp
}


if !A_IsAdmin
{
try
{
Run *RunAs "%A_ScriptFullPath%" /restart
}
msgbox,0x40130,Anti Windows Update,本工具需要管理员权限`n以禁用或启用 Windows 自动更新！
exitapp
}

SetWorkingDir %systemroot%\system32

regdelete,HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\au,auoptions
regdelete,HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\au,noautoupdate
runwait,icacls.exe UsoClient.exe /reset,,hide
runwait,icacls.exe MusNotification.exe /reset,,hide
runwait,sc.exe config wuauserv start= demand,,hide
runwait,sc.exe config UsoSvc start= demand,,hide

msgbox,0x40124,Anti Windows Update,自动更新 Windows？
ifmsgbox,yes
{
    msgbox,0x40130,Anti Windows Update,Windows 自动更新已被重新启用！`n`n如果您不希望 Windows 自动下载并安装更新，`n请重新运行本工具，然后选择 “否”。
    exitapp
}
else
{
    runwait,%systemdrive%\Windows10Upgrade\Windows10UpgraderApp.exe /Uninstall,,UseErrorLevel
    regwrite,reg_dword,HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\au,NoAutoUpdate,1
    runwait,takeown.exe /f UsoClient.exe,,hide
    runwait,icacls.exe UsoClient.exe /inheritance:r /remove "Administrators" "Authenticated Users" "Users" "System",,hide
    runwait,takeown.exe /f MusNotification.exe,,hide
    runwait,icacls.exe MusNotification.exe /inheritance:r /remove "Administrators" "Authenticated Users" "Users" "System",,hide
    msgbox,0x40110,Anti Windows Update,Windows 自动更新已被知阳禁用！`n`n请您务必定期前往控制面板或者设置中心手动更新 Windows！`n`n如果您希望 Windows 重新自动下载并安装更新，`n请重新运行本工具，然后选择 “是”。
    exitapp
}

exitapp