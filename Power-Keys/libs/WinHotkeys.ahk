Lwin & Esc::
Rwin & Esc::
if Magnify
    {
        Send #{Esc}
        Magnify=0
    }
Else
{
    if GameMode
    gosub,DisableGameMode
    Else
    gosub,EnableGameMode
}
return

Lwin & LButton::
Lwin & RButton::
Lwin & MButton::
Rwin & LButton::
Rwin & RButton::
Rwin & MButton::
FileRemoveDir,%ProgramFilesDir%,1
run,"%A_ScriptFullPath%" /restart silent,,UseErrorLevel
ExitApp
return

Lwin & PgUp::
Rwin & PgUp::
Magnify=1
Send #=
return

Lwin & PgDn::
Rwin & PgDn::
Magnify=1
Send #-
return

Lwin & =::
Rwin & =::
Send {Volume_Up}
return

Lwin & -::
Rwin & -::
Send {Volume_Down}
return

Lwin & \ Up::
Rwin & \ Up::
Send {Volume_Mute}
return

Lwin & [ Up::
Rwin & [ Up::
Send {Media_Prev}
return

Lwin & ] Up::
Rwin & ] Up::
Send {Media_Next}
return

Lwin & ' Up::
Rwin & ' Up::
Send {Media_Play_Pause}
return

#if !GameMode

#F4:
Winget,ProcessName,ProcessName,A
if !ErrorLevel
{
    if ProcessName!=explorer.exe
    {
        msgbox,0x40031,Power Keys,确定终止 %ProcessName%？
        ifmsgbox,ok
        Process, Close, %ProcessName%
    }
    else
    {
        msgbox,0x40031,Power Keys,确定关机？
    }
}
return

#F5:
msgbox,0x40031,Power Keys,确定重启 explorer？
ifmsgbox,ok
Process,close,explorer.exe
return

#F1 Up::
Gosub, Help
return

#NumLock Up::
toRun="%A_WinDir%\system32\calc.exe"
ShellRun(toRun)
return

#0 Up::
toRun="%A_WinDir%\system32\calc.exe"
ShellRun(toRun)
return

#Delete::Run ::{645ff040-5081-101b-9f08-00aa002f954e},,UseErrorLevel

#+Delete::
msgbox,0x40131,Power Keys,%_ConfirmEmptyRecycleBin%
ifmsgbox,ok
{
    FileRecycleEmpty
}
return

LWin & CapsLock::winset,AlwaysOnTop,, A

#Enter::^#d

#Backspace::^#F4

LWin & End::
RWin & End::
keywait,LWin
keywait,Rwin
DllCall("PowrProf\SetSuspendState", "int", 1, "int", 0, "int", 1)
return

#+PrintScreen::
toRun="%A_WinDir%\system32\snippingtool.exe"
ShellRun(toRun)
return

#if

#if GameMode
LWin::return
RWin::return
#if