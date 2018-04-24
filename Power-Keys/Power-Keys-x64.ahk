#NoEnv
setkeydelay -1
SetBatchLines -1
ListLines Off
Process, Priority, , High

#SingleInstance ignore
#MaxHotkeysPerInterval 1000
#Persistent
#InstallKeybdHook
#NoTrayIcon

v:="5.0.3"

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

ShellRun(prms*)
{
    shellWindows := ComObjCreate("{9BA05972-F6A8-11CF-A442-00A0C90A8F39}")
    
    desktop := shellWindows.Item(ComObj(19, 8)) ; VT_UI4, SCW_DESKTOP                
   
    ; Retrieve top-level browser object.
    if ptlb := ComObjQuery(desktop
        , "{4C96BE40-915C-11CF-99D3-00AA004AE837}"  ; SID_STopLevelBrowser
        , "{000214E2-0000-0000-C000-000000000046}") ; IID_IShellBrowser
    {
        ; IShellBrowser.QueryActiveShellView -> IShellView
        if DllCall(NumGet(NumGet(ptlb+0)+15*A_PtrSize), "ptr", ptlb, "ptr*", psv:=0) = 0
        {
            ; Define IID_IDispatch.
            VarSetCapacity(IID_IDispatch, 16)
            NumPut(0x46000000000000C0, NumPut(0x20400, IID_IDispatch, "int64"), "int64")
           
            ; IShellView.GetItemObject -> IDispatch (object which implements IShellFolderViewDual)
            DllCall(NumGet(NumGet(psv+0)+15*A_PtrSize), "ptr", psv
                , "uint", 0, "ptr", &IID_IDispatch, "ptr*", pdisp:=0)
           
            ; Get Shell object.
            shell := ComObj(9,pdisp,1).Application
           
            ; IShellDispatch2.ShellExecute
            test:=shell.ShellExecute(prms*)
           
            ObjRelease(psv)
        }
        ObjRelease(ptlb)
    }
}

GameMode=0
isenabled=1
isenabled2=1
space1=0
space2=0
flaunch=0
launchcode=null
fn=0

if A_Args.Length()=1
DllCall("PowrProf\SetSuspendState", "int", 1, "int", 0, "int", 1)

RegWrite, REG_SZ, HKLM\Software\Microsoft\Windows\CurrentVersion\Run, Power Keys, %A_ScriptFullPath%
RegWrite, REG_SZ, HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run, Power Keys, %A_ScriptFullPath%
RegWrite, REG_SZ, HKCU\Software\Microsoft\Windows\CurrentVersion\Run, Power Keys, %A_ScriptFullPath%
RegWrite, REG_SZ, HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run, Power Keys, %A_ScriptFullPath%

Gui +LastFound +AlwaysOnTop -Caption +ToolWindow
Gui, Color, Black
gui, font,s20 bold q5, segoe ui
Gui, Add, Text,cwhite,Power Space
height:=A_screenheight-200

Return

Lwin & =::
Rwin & =::
Send {Volume_Up}
Return

Lwin & -::
Rwin & -::
Send {Volume_Down}
Return

Lwin & , Up::
Rwin & , Up::
Send {Media_Prev}
Return

Lwin & . Up::
Rwin & . Up::
Send {Media_Next}
Return

Lwin & ' Up::
Rwin & ' Up::
Send {Media_Play_Pause}
Return

Lwin & / Up::
Rwin & / Up::
if GameMode=1
MsgBox,0x40040,Power Keys,版本：%v%`n作者：知阳`n游戏模式：已开启
else
MsgBox,0x40040,Power Keys,版本：%v%`n作者：知阳`n游戏模式：未开启
Return

LWin & NumLock Up::
RWin & NumLock Up::
toRun="%A_WinDir%\system32\calc.exe"
ShellRun(toRun)
Return

LWin & 0 Up::
RWin & 0 Up::
toRun="%A_WinDir%\system32\calc.exe"
ShellRun(toRun)
Return

#Delete::
Run ::{645ff040-5081-101b-9f08-00aa002f954e},,UseErrorLevel
Return

#+Delete::
msgbox,0x40131,Power Keys,确定清空回收站？
ifmsgbox,ok
{
FileRecycleEmpty
}
Return

LWin & CapsLock::
RWin & CapsLock::
winset,AlwaysOnTop,, A
Return

LWin & Enter Up::
RWin & Enter Up::
Send ^#d
Return

LWin & BackSpace Up::
RWin & BackSpace Up::
Send ^#{F4}
Return

LWin & [ Up::
RWin & [ Up::
Send ^#{Left}
Return

LWin & ] Up::
RWin & ] Up::
Send ^#{Right}
Return

LWin & F1::
RWin & F1::
toRun="https://github.com/szzhiyang/PerfectWindows/blob/master/Power-Keys/Power-Keys.md"
ShellRun(toRun)
Return

Lwin & F4::
Rwin & F4::
MsgBox,0x40131,Power Keys,确定退出 Power Keys？
ifMsgBox,ok
{
RegDelete, HKLM\Software\Microsoft\Windows\CurrentVersion\Run, Power Keys
RegDelete, HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run, Power Keys
RegDelete, HKCU\Software\Microsoft\Windows\CurrentVersion\Run, Power Keys
RegDelete, HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run, Power Keys
ExitApp
}
Return

LWin & F5::
RWin & F5::
Send {LWin Up}
Send {RWin Up}
Run,"%A_ScriptFullPath%" /restart
Return

LWin & End::
RWin & End::
Send {LWin Up}
Send {RWin Up}
Run,"%A_ScriptFullPath%" /restart /hibernate
Return

#if GameMode=1

LWin::Return
RWin::Return

LWin & F1::
RWin & F1::
Return

#if

#if isenabled

#if !flaunch

space::
settimer,timer,300
spacesent=0
space1=0
space2=1
isenabled2=0
keywait,space
settimer,timer,delete
if (!space1)&(!spacesent)
send {space} 
space1=0 
space2=0
spacesent=1
isenabled2=1
Gui, Hide
return

timer:
settimer,timer,delete
space1=1
space2=0
Gui, Show, xCenter y%height% NoActivate
return

#if

#+PrintScreen::
toRun="%A_WinDir%\system32\snippingtool.exe"
ShellRun(toRun)
Return

Lwin & PgUp::
Rwin & PgUp::
Send #=
Return

Lwin & PgDn::
Rwin & PgDn::
Send #-
Return

#G::
GameMode=1
isenabled=0
;MsgBox,0x40040,Power Keys,游戏模式已开启。
Return

#if

#if space1

F::Send {Left}
J::Send {Right}
G::Send +{WheelUp}
H::Send +{WheelDown}
'::Send {Enter}
A::Send {Home}
`;::Send {End}
K::Send +{Right}
D::Send +{Left}
Q::Send ^{Home}
/::Send ^{End}
R::Send {Up}
T::Send {PgUp}
E::Send +{Up}
M::Send {Down}
N::Send {PgDn}
,::Send +{Down}
S::Send +{Home}
L::Send +{End}
W::Send ^+{Home}
.::Send ^+{End}
B::Send ^{b}
I::Send ^{i}
U::Send ^{u}
Z::Send ^{z}
X::Send ^{x}
C::Send ^{c}
V::Send ^{v}
Y::Send ^{y}
5::Send ^{l}
6::Send ^{e}
7::Send ^{r}
Tab::Send ^{a}
O::Send ^+,
P::Send ^+.
=::Send ^{WheelUp}
-::Send ^{WheelDown}
LCtrl::Send {BackSpace}
RCtrl::Send {BackSpace}
CapsLock::Send {BackSpace}
Shift::Send {Space}

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
Tab::
Enter::
BackSpace::
spacesent=1
Send {space}{%A_ThisLabel%}
Return

#if

#if isenabled&&isenabled2

SetStoreCapsLockMode, Off

CapsLock::
GetKeyState,caps,CapsLock,T
if caps=D
setcapslockstate,off
else
setcapslockstate,on
Return

CapsLock & Tab::AltTab
CapsLock & `::Send !{Esc}
CapsLock & Esc::Send !{F4}

CapsLock & Shift::Space

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

`::`
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
^Tab::^Tab
+Tab::+Tab
!Tab::!Tab
^!Tab::^!Tab
!+Tab::!+Tab
^+Tab::^+Tab
^+!Tab::^+!Tab
#Tab::#Tab
^#Tab::^#Tab
#+Tab::#+Tab
#!Tab::#!Tab
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

Esc::Esc
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
run,%fn%
}
}
return

disablefn:
settimer,disablefn,off
launchcode=terminate
return

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
/::
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
launchcode=%A_ThisLabel%
return

space::
launchcode=terminate
send !{F4}
return

enter::
launchcode=terminate
run,%A_workingdir%\%fn%
return

PrintScreen::
launchcode=terminate
send ^+!{%fn%}
return

#if

#if