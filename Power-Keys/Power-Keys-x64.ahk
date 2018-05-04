bit=64
#SingleInstance ignore
#MaxHotkeysPerInterval 1000
#Persistent
#InstallKeybdHook
#NoTrayIcon
#NoEnv
SendMode Input
setkeydelay -1
SetBatchLines -1
ListLines Off
Process, Priority, , High

v:="6.0.1"
CurrentVersion=601

Suspend, on

if A_Is64bitOS&(bit=86)
{
    msgbox,0x40010,Power Keys,必须使用 64 位 Power Keys。
    exitapp
}

EnvGet,AppDataLocal,LocalAppData

FileCreateDir,%AppDataLocal%\Power Keys
SetWorkingDir,%AppDataLocal%\Power Keys

if !A_IsAdmin
{
    try
    {
        Run *RunAs "%A_ScriptFullPath%" /restart
    }
    ExitApp
}

SetNumLockState, alwayson

Gui,welcome: +LastFound +AlwaysOnTop -Caption +ToolWindow
Gui,welcome: Color, red
Gui,welcome: Font,cwhite s30 wbold q5,Segoe UI
Gui,welcome: Add, Text, ,Power Keys %v%
Gui,welcome: Show,AutoSize Center NoActivate
Gui,updating: +LastFound +AlwaysOnTop -Caption +ToolWindow
Gui,updating: Color, red
Gui,updating: Font,cwhite s30 wbold q5,Segoe UI
Gui,updating: Add, Text, ,Power Keys 正在更新...
Gui,GameMode: +LastFound +AlwaysOnTop -Caption +ToolWindow
Gui,GameMode: Color, red
Gui,GameMode: Font,cwhite s30 wbold q5,Segoe UI
Gui,GameMode: Add, Text, ,游戏模式已启用
Gui,indicator: +LastFound +AlwaysOnTop -Caption +ToolWindow
Gui,indicator: Color, red
h:=A_ScreenHeight*0.01
y:=A_ScreenHeight*0.99

ShellRun(prms*)
{
    shellWindows := ComObjCreate("{9BA05972-F6A8-11CF-A442-00A0C90A8F39}")
    
    desktop := shellWindows.Item(ComObj(19, 8))
   
    if ptlb := ComObjQuery(desktop
        , "{4C96BE40-915C-11CF-99D3-00AA004AE837}"
        , "{000214E2-0000-0000-C000-000000000046}")
    {
        if DllCall(NumGet(NumGet(ptlb+0)+15*A_PtrSize), "ptr", ptlb, "ptr*", psv:=0) = 0
        {
            VarSetCapacity(IID_IDispatch, 16)
            NumPut(0x46000000000000C0, NumPut(0x20400, IID_IDispatch, "int64"), "int64")
           
            DllCall(NumGet(NumGet(psv+0)+15*A_PtrSize), "ptr", psv
                , "uint", 0, "ptr", &IID_IDispatch, "ptr*", pdisp:=0)
           
            shell := ComObj(9,pdisp,1).Application
            shell.ShellExecute(prms*)
           
            ObjRelease(psv)
        }
        ObjRelease(ptlb)
    }
}

GameMode=0
isenabled=1
isenabled2=1
spaceenabled=1
space1=0
space2=0
oneenabled=1
one1=0
one2=0
twoenabled=1
two1=0
two2=0
flaunch=0
launchcode=null
fn=0

RegWrite, REG_SZ, HKLM\Software\Microsoft\Windows\CurrentVersion\Run, Power Keys, %A_ScriptFullPath%
RegWrite, REG_SZ, HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run, Power Keys, %A_ScriptFullPath%
RegDelete, HKCU\Software\Microsoft\Windows\CurrentVersion\Run, Power Keys
RegDelete, HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run, Power Keys

FileRemoveDir,update,1
FileCreateDir,update
UrlDownloadToFile, https://raw.githubusercontent.com/szzhiyang/PerfectWindows/master/Power-Keys/Version.txt,update\version.txt
if errorlevel
{
    sleep 1000
    gui,welcome:hide
    FileRemoveDir,update,1
    Suspend,off
}
else
{
    FileReadLine, latestversion, update\version.txt, 1
    sleep 500
    gui,welcome:hide
    if (latestversion>CurrentVersion)
    {
        gui,updating:Show,AutoSize Center NoActivate
        UrlDownloadToFile, https://raw.githubusercontent.com/szzhiyang/PerfectWindows/master/Power-Keys/Power-Keys-x%bit%.exe,update\latest.exe
        FileAppend,
        (
            :start
            taskkill /im "%A_scriptname%" /f
            move /y "%A_workingdir%\update\latest.exe" "%A_scriptfullpath%"
            if exist "%A_workingdir%\update\latest.exe" (goto start)
            start "" "%A_scriptfullpath%"
            exit
        ),update/update.bat
        runwait,%ComSpec% /c start "" /B "%A_workingdir%\update\update.bat",,hide
    }
    else
    {
        FileRemoveDir,update,1
        Suspend,off
    }
}

return

Lwin & =::
Rwin & =::
Send {Volume_Up}
return

Lwin & -::
Rwin & -::
Send {Volume_Down}
return

Lwin & , Up::
Rwin & , Up::
Send {Media_Prev}
return

Lwin & . Up::
Rwin & . Up::
Send {Media_Next}
return

Lwin & ' Up::
Rwin & ' Up::
Send {Media_Play_Pause}
return

#NumLock Up::
toRun="%A_WinDir%\system32\calc.exe"
ShellRun(toRun)
return

#0 Up::
toRun="%A_WinDir%\system32\calc.exe"
ShellRun(toRun)
return

#Delete::
Run ::{645ff040-5081-101b-9f08-00aa002f954e},,UseErrorLevel
return

#+Delete::
msgbox,0x40131,Power Keys,确定清空回收站？
ifmsgbox,ok
{
    FileRecycleEmpty
}
return

#CapsLock::
winset,AlwaysOnTop,, A
return

#Enter Up::
Send ^#d
return

#Backspace Up::
Send ^#{F4}
return

#[ Up::
Send ^#{Left}
return

#] Up::
Send ^#{Right}
return

LWin & F1::
RWin & F1::
toRun="https://github.com/szzhiyang/PerfectWindows/blob/master/Power-Keys/Power-Keys.md"
ShellRun(toRun)
return

Lwin & F4::
Rwin & F4::
MsgBox,0x40131,Power Keys,确定退出 Power Keys？
ifMsgBox,ok
{
    RegDelete, HKLM\Software\Microsoft\Windows\CurrentVersion\Run, Power Keys
    RegDelete, HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run, Power Keys
    RegDelete, HKCU\Software\Microsoft\Windows\CurrentVersion\Run, Power Keys
    RegDelete, HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run, Power Keys
    FileRemoveDir,update,1
    ExitApp
}
return

LWin & F5::
RWin & F5::
keywait,LWin
keywait,Rwin
Run,"%A_ScriptFullPath%" /restart
return

LWin & End::
RWin & End::
keywait,LWin
keywait,Rwin
DllCall("PowrProf\SetSuspendState", "int", 1, "int", 0, "int", 1)
return

#if GameMode=1

LWin::return
RWin::return

LWin & F1::
RWin & F1::
return

#if

#if !flaunch&&spaceenabled&&isenabled

space::
settimer,spacetimer,300
oneenabled=0
twoenabled=0
spacesent=0
space1=0
space2=1
isenabled2=0
keywait,space
settimer,spacetimer,delete
if (!space1)&(!spacesent)
send {space} 
space1=0 
space2=0
spacesent=1
isenabled2=1
oneenabled=1
twoenabled=1
Gui,indicator: Hide
return

spacetimer:
settimer,spacetimer,delete
space1=1
space2=0
Gui,indicator: +LastFound +AlwaysOnTop -Caption +ToolWindow
Gui,indicator: Show, xCenter y%y% h%h% w%A_ScreenWidth% NoActivate
return

#If

#if !flaunch&&oneenabled&&!two1&&!two2&&isenabled

1::
settimer,onetimer,300
spaceenabled=0
onesent=0
one1=0
one2=1
isenabled2=0
keywait,1
settimer,onetimer,delete
BlockInput,off
if (!one1)&(!onesent)
send {1} 
one1=0 
one2=0
onesent=1
isenabled2=1
spaceenabled=1
Gui,indicator: Hide
return

onetimer:
BlockInput,on
settimer,onetimer,delete
one1=1
one2=0
Gui,indicator: +LastFound +AlwaysOnTop -Caption +ToolWindow
Gui,indicator: Show, xCenter y%y% h%h% w%A_ScreenWidth% NoActivate
return

#if

#if !flaunch&&twoenabled&&!one1&&!one2&&isenabled

2::
settimer,twotimer,300
spaceenabled=0
twosent=0
two1=0
two2=1
isenabled2=0
keywait,2
settimer,twotimer,delete
BlockInput,off
if (!two1)&(!twosent)
send {2} 
two1=0 
two2=0
twosent=1
isenabled2=1
spaceenabled=1
send {alt up}
Gui,indicator: Hide
return

twotimer:
BlockInput,on
settimer,twotimer,delete
send {alt down}
two1=1
two2=0
Gui,indicator: +LastFound +AlwaysOnTop -Caption +ToolWindow
Gui,indicator: Show, xCenter y%y% h%h% w%A_ScreenWidth% NoActivate
return

#if

#if isenabled

#+PrintScreen::
toRun="%A_WinDir%\system32\snippingtool.exe"
ShellRun(toRun)
return

Lwin & PgUp::
Rwin & PgUp::
Send #=
return

Lwin & PgDn::
Rwin & PgDn::
Send #-
return

Lwin & G::
Rwin & G::
GameMode=1
isenabled=0
gui,GameMode:show,center NoActivate
sleep 1000
gui,GameMode:hide
return

#if

#if space1
Space & F::Send {Left}
Space & J::Send {Right}
Space & H::Send +{F10}
Space & G::Send {Esc}
Space & 9::Send +{WheelUp}
Space & 0::Send +{WheelDown}
Space & '::Send {Enter}
Space & A::Send {Home}
Space & `;::Send {End}
Space & K::Send +{Right}
Space & D::Send +{Left}
Space & Q::Send ^{Home}
Space & /::Send ^{End}
Space & R::Send {Up}
Space & T::Send {PgUp}
Space & E::Send +{Up}
Space & M::Send {Down}
Space & N::Send {PgDn}
Space & ,::Send +{Down}
Space & S::Send +{Home}
Space & L::Send +{End}
Space & W::Send ^+{Home}
Space & .::Send ^+{End}
Space & B::Send ^{b}
Space & I::Send ^{i}
Space & U::Send ^{u}
Space & Z::Send ^{z}
Space & X::Send ^{x}
Space & C::Send ^{c}
Space & V::Send ^{v}
Space & Y::Send ^{y}
Space & 5::Send ^{l}
Space & 6::Send ^{e}
Space & 7::Send ^{r}
Space & Tab::Send ^{a}
Space & O::Send ^+{,}
Space & P::Send ^+{.}
Space & =::Send ^{WheelUp}
Space & -::Send ^{WheelDown}
Space & LCtrl::Send {BackSpace}
Space & RCtrl::Send {BackSpace}
Space & CapsLock::Send {BackSpace}
Space & Shift::Space
Space & ]::Send {Tab}
Space & [::Send +{Tab}
Space & 1::Send ^{s}
Space & 3::Send +{3}
Space & `::Send {``}
Space & 8::Send +{8}
Space & Enter::Send +{Enter}
Space & bs::Send {Delete}
Space & Esc::Send !{F4}
Space & F1::Send {F1}
Space & F2::Send {F2}
Space & F3::Send {F3}
Space & F4::Send {F4}
Space & F5::Send {F5}
Space & F6::Send {F6}
Space & F7::Send {F7}
Space & F8::Send {F8}
Space & F9::Send {F9}
Space & F10::Send {F10}
Space & F11::Send {F11}
Space & F12::Send {F12}

#if

#if one1
1 & n::Send {Numpad1}
1 & m::Send {Numpad2}
1 & ,::Send {Numpad3}
1 & h::Send {Numpad4}
1 & j::Send {Numpad5}
1 & k::Send {Numpad6}
1 & y::Send {Numpad7}
1 & u::Send {Numpad8}
1 & i::Send {Numpad9}
1 & Space::Send {Numpad0}
1 & Alt::Send {NumpadDot}
1 & Ctrl::Send {NumpadEnter}
1 & .::Send {NumpadEnter}
1 & Enter::Send {NumpadEnter}
1 & l::Send {NumpadAdd}
1 & o::Send {NumpadAdd}
1 & =::Send {NumpadAdd}
1 & -::Send {NumpadSub}
1 & 9::Send {NumpadSub}
1 & 8::Send {NumpadMult}
1 & /::Send {NumpadDiv}
1 & 7::Send {NumpadDiv}
1 & Backspace::Send {bs}
#if

#if two1
2 & n::Numpad1
2 & m::Numpad2
2 & ,::Numpad3
2 & h::Numpad4
2 & j::Numpad5
2 & k::Numpad6
2 & y::Numpad7
2 & u::Numpad8
2 & i::Numpad9
2 & Space::Numpad0
#if

#if space2&(spacesent=0)

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
Enter::
Backspace::
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
PrintScreen::
spacesent=1
Send {space}{%A_ThisLabel%}
return

`::
spacesent=1
Send {Space}{``}
return

`;::
spacesent=1
Send {Space}{;}
return

#if

#if one2&(onesent=0)

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
space::
Enter::
Backspace::
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
PrintScreen::
onesent=1
Send {1}{%A_ThisLabel%}
return

`::
onesent=1
Send {1}{``}
return

`;::
onesent=1
Send {1}{;}
return

#if

#if two2&(twosent=0)

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
Enter::
Space::
Backspace::
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
PrintScreen::
twosent=1
Send {2}{%A_ThisLabel%}
return

`::
twosent=1
Send {2}{``}
return

`;::
twosent=1
Send {2}{;}
return

#if

#if isenabled&&isenabled2&&!flaunch

SetStoreCapsLockMode, Off

CapsLock::
GetKeyState,caps,CapsLock,T
if caps=D
setcapslockstate,off
else
setcapslockstate,on
return

CapsLock & Tab::AltTab
CapsLock & `::Send !{Esc}
CapsLock & Esc::Send !{F4}
CapsLock & a::Send ^+!{a}
CapsLock & b::Send ^+!{b}
CapsLock & c::Send ^+!{c}
CapsLock & d::Send ^+!{d}
CapsLock & e::Send ^+!{e}
CapsLock & f::Send ^+!{f}
CapsLock & g::Send ^+!{g}
CapsLock & h::Send ^+!{h}
CapsLock & i::Send ^+!{i}
CapsLock & j::Send ^+!{j}
CapsLock & k::Send ^+!{k}
CapsLock & l::Send ^+!{l}
CapsLock & m::Send ^+!{m}
CapsLock & n::Send ^+!{n}
CapsLock & o::Send ^+!{o}
CapsLock & p::Send ^+!{p}
CapsLock & q::Send ^+!{q}
CapsLock & r::Send ^+!{r}
CapsLock & s::Send ^+!{s}
CapsLock & t::Send ^+!{t}
CapsLock & u::Send ^+!{u}
CapsLock & v::Send ^+!{v}
CapsLock & w::Send ^+!{w}
CapsLock & x::Send ^+!{x}
CapsLock & y::Send ^+!{y}
CapsLock & z::Send ^+!{z}
CapsLock & 1::Send ^+!{1}
CapsLock & 2::Send ^+!{2}
CapsLock & 3::Send ^+!{3}
CapsLock & 4::Send ^+!{4}
CapsLock & 5::Send ^+!{5}
CapsLock & 6::Send ^+!{6}
CapsLock & 7::Send ^+!{7}
CapsLock & 8::Send ^+!{8}
CapsLock & 9::Send ^+!{9}
CapsLock & 0::Send ^+!{0}
CapsLock & F1::Send ^+!{F1}
CapsLock & F2::Send ^+!{F2}
CapsLock & F3::Send ^+!{F3}
CapsLock & F4::Send ^+!{F4}
CapsLock & F5::Send ^+!{F5}
CapsLock & F6::Send ^+!{F6}
CapsLock & F7::Send ^+!{F7}
CapsLock & F8::Send ^+!{F8}
CapsLock & F9::Send ^+!{F9}
CapsLock & F10::Send ^+!{F10}
CapsLock & F11::Send ^+!{F11}
CapsLock & F12::Send ^+!{F12}
CapsLock & ,::Send ^+!{,}
CapsLock & .::Send ^+!{.}
CapsLock & /::Send ^+!{/}
CapsLock & '::Send ^+!{'}
CapsLock & [::Send ^+!{[}
CapsLock & ]::Send ^+!{]}
CapsLock & \::Send ^+!{\}
CapsLock & -::Send ^+!{-}
CapsLock & =::Send ^+!{=}
CapsLock & Space::Send ^+!{Space}
CapsLock & Enter::Send ^+!{Enter}
CapsLock & Backspace::Send ^+!{Backspace}
CapsLock & Delete::Send ^+!{Delete}
CapsLock & Insert::Send ^+!{Insert}
CapsLock & Home::Send ^+!{Home}
CapsLock & End::Send ^+!{End}
CapsLock & PgUp::Send ^+!{PgUp}
CapsLock & PgDn::Send ^+!{PgDn}
CapsLock & Up::Send ^+!{Up}
CapsLock & Down::Send ^+!{Down}
CapsLock & Left::Send ^+!{Left}
CapsLock & Right::Send ^+!{Right}
CapsLock & PrintScreen::Send ^+!{PrintScreen}

`::Send {``}
^`::Send ^{``}
+`::Send +{``}
!`::Send !{``}
^+`::Send ^+{``}
^!`::Send ^!{``}
!+`::Send !+{``}
^!+`::Send ^!+{``}
#`::Send #{``}
^#`::Send ^#{``}
+#`::Send +#{``}
!#`::Send !#{``}
^!#`::Send ^!#{``}
^+#`::Send ^+#{``}
+!#`::Send +!#{``}
^+!#`::Send ^+!#{``}
` & Shift::`
` & a::Send +!{a}
` & b::Send +!{b}
` & c::Send +!{c}
` & d::Send +!{d}
` & e::Send +!{e}
` & f::Send +!{f}
` & g::Send +!{g}
` & h::Send +!{h}
` & i::Send +!{i}
` & j::Send +!{j}
` & k::Send +!{k}
` & l::Send +!{l}
` & m::Send +!{m}
` & n::Send +!{n}
` & o::Send +!{o}
` & p::Send +!{p}
` & q::Send +!{q}
` & r::Send +!{r}
` & s::Send +!{s}
` & t::Send +!{t}
` & u::Send +!{u}
` & v::Send +!{v}
` & w::Send +!{w}
` & x::Send +!{x}
` & y::Send +!{y}
` & z::Send +!{z}
` & 1::Send +!{1}
` & 2::Send +!{2}
` & 3::Send +!{3}
` & 4::Send +!{4}
` & 5::Send +!{5}
` & 6::Send +!{6}
` & 7::Send +!{7}
` & 8::Send +!{8}
` & 9::Send +!{9}
` & 0::Send +!{0}
` & F1::Send +!{F1}
` & F2::Send +!{F2}
` & F3::Send +!{F3}
` & F4::Send +!{F4}
` & F5::Send +!{F5}
` & F6::Send +!{F6}
` & F7::Send +!{F7}
` & F8::Send +!{F8}
` & F9::Send +!{F9}
` & F10::Send +!{F10}
` & F11::Send +!{F11}
` & F12::Send +!{F12}
` & ,::Send +!{,}
` & .::Send +!{.}
` & /::Send +!{/}
` & '::Send +!{'}
` & [::Send +!{[}
` & ]::Send +!{]}
` & \::Send +!{\}
` & -::Send +!{-}
` & =::Send +!{=}
` & Space::Send +!{Space}
` & Enter::Send +!{Enter}
` & Backspace::Send +!{Backspace}
` & Delete::Send +!{Delete}
` & Insert::Send +!{Insert}
` & Home::Send +!{Home}
` & End::Send +!{End}
` & PgUp::Send +!{PgUp}
` & PgDn::Send +!{PgDn}
` & Up::Send +!{Up}
` & Down::Send +!{Down}
` & Left::Send +!{Left}
` & Right::Send +!{Right}
` & PrintScreen::Send +!{PrintScreen}
` & Tab::ShiftAltTab

Tab::Send {Tab}
^Tab::Send ^{Tab}
+Tab::Send +{Tab}
<!Tab::AltTab
>!Tab::AltTab
^+Tab::Send ^+{Tab}
^!Tab::Send ^!{Tab}
^!+Tab::Send ^!+{Tab}
#Tab::#Tab
^#Tab::Send ^#{Tab}
+#Tab::Send +#{Tab}
!#Tab::Send !#{Tab}
^!#Tab::Send ^!#{Tab}
^+#Tab::Send ^+#{Tab}
+!#Tab::Send +!#{Tab}
^+!#Tab::Send ^+!#{Tab}
Tab & Shift::Tab
Tab & a::Send ^!{a}
Tab & b::Send ^!{b}
Tab & c::Send ^!{c}
Tab & d::Send ^!{d}
Tab & e::Send ^!{e}
Tab & f::Send ^!{f}
Tab & g::Send ^!{g}
Tab & h::Send ^!{h}
Tab & i::Send ^!{i}
Tab & j::Send ^!{j}
Tab & k::Send ^!{k}
Tab & l::Send ^!{l}
Tab & m::Send ^!{m}
Tab & n::Send ^!{n}
Tab & o::Send ^!{o}
Tab & p::Send ^!{p}
Tab & q::Send ^!{q}
Tab & r::Send ^!{r}
Tab & s::Send ^!{s}
Tab & t::Send ^!{t}
Tab & u::Send ^!{u}
Tab & v::Send ^!{v}
Tab & w::Send ^!{w}
Tab & x::Send ^!{x}
Tab & y::Send ^!{y}
Tab & z::Send ^!{z}
Tab & 1::Send ^!{1}
Tab & 2::Send ^!{2}
Tab & 3::Send ^!{3}
Tab & 4::Send ^!{4}
Tab & 5::Send ^!{5}
Tab & 6::Send ^!{6}
Tab & 7::Send ^!{7}
Tab & 8::Send ^!{8}
Tab & 9::Send ^!{9}
Tab & 0::Send ^!{0}
Tab & F1::Send ^!{F1}
Tab & F2::Send ^!{F2}
Tab & F3::Send ^!{F3}
Tab & F4::Send ^!{F4}
Tab & F5::Send ^!{F5}
Tab & F6::Send ^!{F6}
Tab & F7::Send ^!{F7}
Tab & F8::Send ^!{F8}
Tab & F9::Send ^!{F9}
Tab & F10::Send ^!{F10}
Tab & F11::Send ^!{F11}
Tab & F12::Send ^!{F12}
Tab & ,::Send ^!{,}
Tab & `::Send ^!{``}
Tab & .::Send ^!{.}
Tab & /::Send ^!{/}
Tab & '::Send ^!{'}
Tab & [::Send ^!{[}
Tab & ]::Send ^!{]}
Tab & \::Send ^!{\}
Tab & -::Send ^!{-}
Tab & =::Send ^!{=}
Tab & Space::Send ^!{Space}
Tab & Enter::Send ^!{Enter}
Tab & Backspace::Send ^!{Backspace}
Tab & Delete::Run,"%A_WinDir%\system32\taskmgr.exe",,UseErrorLevel
Tab & Insert::Send ^!{Insert}
Tab & Home::Send ^!{Home}
Tab & End::Send ^!{End}
Tab & PgUp::Send ^!{PgUp}
Tab & PgDn::Send ^!{PgDn}
Tab & Up::Send ^!{Up}
Tab & Down::Send ^!{Down}
Tab & Left::Send ^!{Left}
Tab & Right::Send ^!{Right}
Tab & PrintScreen::Send ^!{PrintScreen}

Esc::Send {Esc}
^Esc::Send ^{Esc}
+Esc::Send +{Esc}
!Esc::Send !{Esc}
^+Esc::Send ^+{Esc}
^!Esc::Send ^!{Esc}
!+Esc::Send !+{Esc}
^!+Esc::Send ^!+{Esc}
#Esc::Send #{Esc}
^#Esc::Send ^#{Esc}
+#Esc::Send +#{Esc}
!#Esc::Send !#{Esc}
^!#Esc::Send ^!#{Esc}
^+#Esc::Send ^+#{Esc}
+!#Esc::Send +!#{Esc}
^+!#Esc::Send ^+!#{Esc}
Esc & Shift::Esc
Esc & a::Send ^+{a}
Esc & b::Send ^+{b}
Esc & c::Send ^+{c}
Esc & d::Send ^+{d}
Esc & e::Send ^+{e}
Esc & f::Send ^+{f}
Esc & g::Send ^+{g}
Esc & h::Send ^+{h}
Esc & i::Send ^+{i}
Esc & j::Send ^+{j}
Esc & k::Send ^+{k}
Esc & l::Send ^+{l}
Esc & m::Send ^+{m}
Esc & n::Send ^+{n}
Esc & o::Send ^+{o}
Esc & p::Send ^+{p}
Esc & q::Send ^+{q}
Esc & r::Send ^+{r}
Esc & s::Send ^+{s}
Esc & t::Send ^+{t}
Esc & u::Send ^+{u}
Esc & v::Send ^+{v}
Esc & w::Send ^+{w}
Esc & x::Send ^+{x}
Esc & y::Send ^+{y}
Esc & z::Send ^+{z}
Esc & 1::Send ^+{1}
Esc & 2::Send ^+{2}
Esc & 3::Send ^+{3}
Esc & 4::Send ^+{4}
Esc & 5::Send ^+{5}
Esc & 6::Send ^+{6}
Esc & 7::Send ^+{7}
Esc & 8::Send ^+{8}
Esc & 9::Send ^+{9}
Esc & 0::Send ^+{0}
Esc & F1::Send ^+{F1}
Esc & F2::Send ^+{F2}
Esc & F3::Send ^+{F3}
Esc & F4::Send ^+{F4}
Esc & F5::Send ^+{F5}
Esc & F6::Send ^+{F6}
Esc & F7::Send ^+{F7}
Esc & F8::Send ^+{F8}
Esc & F9::Send ^+{F9}
Esc & F10::Send ^+{F10}
Esc & F11::Send ^+{F11}
Esc & F12::Send ^+{F12}
Esc & ,::Send ^+{,}
Esc & `::Send ^+{``}
Esc & .::Send ^+{.}
Esc & /::Send ^+{/}
Esc & '::Send ^+{'}
Esc & [::Send ^+{[}
Esc & ]::Send ^+{]}
Esc & \::Send ^+{\}
Esc & -::Send ^+{-}
Esc & =::Send ^+{=}
Esc & Space::Send ^+{Space}
Esc & Enter::Send ^+{Enter}
Esc & Backspace::Send ^+{Backspace}
Esc & Delete::Send ^+{Delete}
Esc & Insert::Send ^+{Insert}
Esc & Home::Send ^+{Home}
Esc & End::Send ^+{End}
Esc & PgUp::Send ^+{PgUp}
Esc & PgDn::Send ^+{PgDn}
Esc & Up::Send ^+{Up}
Esc & Down::Send ^+{Down}
Esc & Left::Send ^+{Left}
Esc & Right::Send ^+{Right}
Esc & PrintScreen::Send ^+{PrintScreen}
Esc & Tab::Send ^+{Tab}

#If

#if isenabled

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
settimer,disablefn,500
fn=%A_ThisLabel%
flaunch=1
launchcode=null
keywait,%fn%
keywait,%launchcode%
flaunch=0
if (launchcode="null")
{
    send {%fn%}
    return
}
else if (launchcode="terminate")
{
    return
}
else
{
    lnk=%A_workingdir%\%fn%\%launchcode%.lnk
    url=%A_workingdir%\%fn%\%launchcode%.url
    FileGetAttrib,temp,%lnk%
    if !errorlevel
    ShellRun(lnk)
    else
    {
        FileGetAttrib,temp,%url%
        if !ErrorLevel
        ShellRun(url)
        else
        {
            FileCreateDir,%fn%
            run,%fn%
        }
    }
}
return

disablefn:
settimer,disablefn,off
launchcode=terminate
return

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
Backspace::
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
Gosub, disablefn
launchcode=%A_ThisLabel%
return

`;::
Gosub, disablefn
launchcode=`;
return

space::
Gosub, disablefn
send !{F4}
return

enter::
Gosub, disablefn
FileCreateDir,%fn%
run,%A_workingdir%\%fn%
return

PrintScreen::
Gosub, disablefn
send ^+!{%fn%}
return

Esc::
Gosub, disablefn
return

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