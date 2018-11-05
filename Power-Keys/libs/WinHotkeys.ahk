$#Esc::Return
$#Esc Up::
Process,Exist,Magnify.exe
if ErrorLevel
{
    Send {LWin Down}{Esc Down}{Esc Up}{LWin Up}
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

$#=::Volume_Up
$#-::Volume_Down

$#\::Return
$#\ Up::Send {Volume_Mute}

$#[::Return
$#[ Up::Send {Media_Prev}

$#]::Return
$#] Up::Send {Media_Next}

$#'::Return
$#' Up::Send {Media_Play_Pause}

#if !GameMode

$#`::#Tab

$#PgUp::#=
$#PgDn::#-

$#Enter::Return
$#Enter Up::Send {Ctrl Down}{LWin Down}{d Down}{d Up}{LWin Up}{Ctrl Up}

$#bs::Return
$#bs Up::Send {Ctrl Down}{LWin Down}{F4 Down}{F4 Up}{LWin Up}{Ctrl Up}

$#F1::Return
$#F1 Up::Gosub, Help

$#Delete::Return
$#Delete Up::Run ::{645ff040-5081-101b-9f08-00aa002f954e},,UseErrorLevel

$#+Delete::Return
$#+Delete Up::
msgbox,0x40131,Power Keys,%_ConfirmEmptyRecycleBin%
ifmsgbox,ok
{
    FileRecycleEmpty
}
Return

$#0::Return
$#0 Up::
calc="%A_WinDir%\system32\calc.exe"
ShellRun(calc)
Return

$#+PrintScreen::Return
$#+PrintScreen Up::
snippingtool="%A_WinDir%\system32\snippingtool.exe"
ShellRun(snippingtool)
Return

$#End::
Keywait,LWin
Keywait,RWin
DllCall("PowrProf\SetSuspendState", "int", 1, "int", 0, "int", 1)
Return

#if

#if GameMode

LWin::Return
RWin::Return

#if