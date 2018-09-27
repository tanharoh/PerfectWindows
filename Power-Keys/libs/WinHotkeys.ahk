LWin & Esc::
RWin & Esc::
if Magnify
    {
        Send {LWin Down}{Esc Down}{Esc Up}{LWin Up}
        Magnify=0
    }
Else
{
    if GameMode
    Gosub,DisableGameMode
    Else
    Gosub,EnableGameMode
}
Return

LWin & LButton::
LWin & RButton::
LWin & MButton::
RWin & LButton::
RWin & RButton::
RWin & MButton::
FileRemoveDir,%ProgramFilesDir%,1
Run,"%A_ScriptFullPath%" /restart silent,,UseErrorLevel
ExitApp
Return

LWin & PgUp::
RWin & PgUp::
Magnify=1
Send {LWin Down}{= Down}{= Up}{LWin Up}
Return

LWin & PgDn::
RWin & PgDn::
Magnify=1
Send {LWin Down}{- Down}{- Up}{LWin Up}
Return

LWin & =::
RWin & =::
Send {Volume_Up Down}{Volume_Up Up}
Return

LWin & -::
RWin & -::
Send {Volume_Down Down}{Volume_Down Up}
Return

LWin & \::Return
RWin & \::Return
LWin & \ Up::
RWin & \ Up::
Send {Volume_Mute Down}{Volume_Mute Up}
Return

RWin & [::Return
LWin & [::Return
LWin & [ Up::
RWin & [ Up::
Send {Media_Prev Down}{Media_Prev Up}
Return

RWin & ]::Return
LWin & ]::Return
LWin & ] Up::
RWin & ] Up::
Send {Media_Next Down}{Media_Next Up}
Return

LWin & '::Return
RWin & '::Return
LWin & ' Up::
RWin & ' Up::
Send {Media_Play_Pause Down}{Media_Play_Pause Up}
Return

#if !GameMode

LWin & `::#Tab
RWin & `::#Tab

LWin & Enter::Return
RWin & Enter::Return
LWin & Enter Up::
RWin & Enter Up::
Send {Ctrl Down}{LWin Down}{d Down}{d Up}{Ctrl Up}
Return

LWin & bs::Return
RWin & bs::Return
LWin & bs Up::
RWin & bs Up::
Send {Ctrl Down}{LWin Down}{F4 Down}{F4 Up}{Ctrl Up}
Return

#F1::Return
#F1 Up::
Gosub, Help
Return

#0::Return
#0 Up::
calc="%A_WinDir%\system32\calc.exe"
ShellRun(calc)
Return

#Delete::Run ::{645ff040-5081-101b-9f08-00aa002f954e},,UseErrorLevel

#+Delete::
msgbox,0x40131,Power Keys,%_ConfirmEmptyRecycleBin%
ifmsgbox,ok
{
    FileRecycleEmpty
}
Return

LWin & End::
RWin & End::
Keywait,LWin
Keywait,RWin
DllCall("PowrProf\SetSuspendState", "int", 1, "int", 0, "int", 1)
Return

#+PrintScreen::
snippingtool="%A_WinDir%\system32\snippingtool.exe"
ShellRun(snippingtool)
Return

#if

#if GameMode

LWin::Return
RWin::Return

#if