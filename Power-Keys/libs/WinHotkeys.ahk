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

Lwin & \::
Rwin & \::
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