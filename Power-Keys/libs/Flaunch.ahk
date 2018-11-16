#if !GameMode&&!Space1&&!Space2&&!Space3

F1::
F2::
F3::
F4::
F5::
F6::
F7::
F8::
F9::
F10::
F11::
F12::
settimer,disablefn,500,2018
fn=%A_ThisLabel%
flaunch=1
launchcode=null
Keywait,%fn%
Keywait,%launchcode%
flaunch=0
if (launchcode="null")
{
    SendCtrlW=0
    Send {%fn% Down}{%fn% Up}
    Return
}
else if (launchcode="terminate")
{
    SendCtrlW=0
    Return
}
else
{
    lnk=%A_workingdir%\%fn%\%launchcode%.lnk
    url=%A_workingdir%\%fn%\%launchcode%.url
    FileGetAttrib,temp,%lnk%
    if !ErrorLevel
    {
        SendCtrlW=0
        settimer,disableCtrlW,delete
        FileGetAttrib,temp,%url%
        if !ErrorLevel
        {
            FileCreateDir,F1
            FileCreateDir,F2
            FileCreateDir,F3
            FileCreateDir,F4
            FileCreateDir,F5
            FileCreateDir,F6
            FileCreateDir,F7
            FileCreateDir,F8
            FileCreateDir,F9
            FileCreateDir,F10
            FileCreateDir,F11
            FileCreateDir,F12
            Run,%fn%
        } else {
            ShellRun(lnk)
        }
    }
    else
    {
        FileGetAttrib,temp,%url%
        if !ErrorLevel
        {
            SendCtrlW=1
            settimer,disableCtrlW,5000,4096
            ShellRun(url)
        }
        else
        {
            FileCreateDir,F1
            FileCreateDir,F2
            FileCreateDir,F3
            FileCreateDir,F4
            FileCreateDir,F5
            FileCreateDir,F6
            FileCreateDir,F7
            FileCreateDir,F8
            FileCreateDir,F9
            FileCreateDir,F10
            FileCreateDir,F11
            FileCreateDir,F12
            Run,%fn%
        }
    }
}
Return

#if

#if flaunch
a::
b::
c::
d::
e::
f::
g::
h::
i::
j::
k::
l::
m::
n::
o::
p::
q::
r::
s::
t::
u::
v::
w::
x::
y::
z::
1::
2::
3::
4::
5::
6::
7::
8::
9::
0::
,::
.::
'::
[::
]::
\::
-::
=::
BackSpace::
Delete::
Insert::
Home::
End::
PgUp::
PgDn::
Up::
Down::
Left::
Right::
Tab::
Gosub, disablefn
launchcode=%A_ThisLabel%
Return

`;::
Gosub, disablefn
launchcode=`;
Return

`::
Gosub, disablefn
launchcode=``
Return

Space::
Gosub, disablefn
if SendCtrlW
{
    Send {Ctrl Down}{w Down}{w Up}{Ctrl Up}
    SendCtrlW=0
}
else
{
    Send {Alt Down}{F4 Down}{F4 Up}{Alt Up}
}
Return

enter::
Gosub, disablefn
FileCreateDir,F1
FileCreateDir,F2
FileCreateDir,F3
FileCreateDir,F4
FileCreateDir,F5
FileCreateDir,F6
FileCreateDir,F7
FileCreateDir,F8
FileCreateDir,F9
FileCreateDir,F10
FileCreateDir,F11
FileCreateDir,F12
Run,%A_workingdir%\%fn%
Return

PrintScreen::
Gosub, disablefn
Send {Ctrl Down}{Shift Down}{Alt Down}{%fn% Down}{%fn% Up}{Alt Up}{Shift Up}{Ctrl Up}
Return

Esc::
Gosub, disablefn
Return

CapsLock::
Gosub, disablefn
WinSet,AlwaysOnTop,On,A
Transparent:=(13-SubStr(fn,2))*21.25
WinSet,Transparent,%Transparent%,A
Return

F1 & Shift::F1
F2 & Shift::F2
F3 & Shift::F3
F4 & Shift::F4
F5 & Shift::F5
F6 & Shift::F6
F7 & Shift::F7
F8 & Shift::F8
F9 & Shift::F9
F10 & Shift::F10
F11 & Shift::F11
F12 & Shift::F12

#if

disablefn:
settimer,disablefn,delete
launchcode=terminate
Return

disableCtrlW:
settimer,disableCtrlW,delete
SendCtrlW=0
Return