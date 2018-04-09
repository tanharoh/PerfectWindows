#SingleInstance force
#MaxHotkeysPerInterval 1000
#Persistent
#InstallKeybdHook
#NoTrayIcon

v:="3.0.2"

isenabled=0

Process, Priority, , High

if A_Is64bitOS
{
msgbox,0x40130,Power Keys %v% by 知阳,为确保兼容性，`n您必须使用 64 位版本的 Power Keys！
exitapp
}

if A_IsAdmin
{
MsgBox,0x40030,Power Keys %v% by 知阳,为确保安全性和兼容性，`nPower Keys 拒绝以管理员身份运行！
ExitApp
}

isenabled=1
GameMode=0

FileCreateDir,%LocalAppData%\Power Keys
SetWorkingDir %LocalAppData%\Power Keys

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

if A_Args.Length()=2
{
Run,"%LocalAppData%\Power Keys\F%1%\%2%.lnk",,UseErrorLevel
if ErrorLevel
Run,"%LocalAppData%\Power Keys\F%1%\%2%.url",,UseErrorLevel
if ErrorLevel
Run,"%LocalAppData%\Power Keys\F%1%",,UseErrorLevel
}

if A_Args.Length()=0
MsgBox,0x40040,Power Keys %v% by 知阳,欢迎使用 Power Keys！

if A_Args.Length()=1
Run,%systemroot%\system32\taskmgr.exe,,UseErrorLevel

if A_Args.Length()=3
DllCall("PowrProf\SetSuspendState", "int", 1, "int", 0, "int", 1)

RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run, Power Keys, %A_ScriptFullPath%
RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run, Power Keys, %A_ScriptFullPath%

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
MsgBox,0x40040,Power Keys %v% by 知阳,游戏模式已开启。
else
MsgBox,0x40040,Power Keys %v% by 知阳,游戏模式未开启。
Return

LWin & NumLock Up::
RWin & NumLock Up::
Run, "%systemroot%\system32\calc.exe",,UseErrorLevel
Return

LWin & 0 Up::
RWin & 0 Up::
Run, "%systemroot%\system32\calc.exe",,UseErrorLevel
Return

LWin & CapsLock::
RWin & CapsLock::
winset,AlwaysOnTop,, A
Return

LWin & Delete Up::
RWin & Delete Up::
Run ::{645ff040-5081-101b-9f08-00aa002f954e},,UseErrorLevel
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
Run, https://github.com/szzhiyang/PerfectWindows/blob/master/Power-Keys/Power-Keys.md,,UseErrorLevel
Return

#if GameMode=1

LWin::Return
RWin::Return

LWin & F1::
RWin & F1::
Return

LWin & F4::
RWin & F4::
Return

LWin & Esc::
RWin & Esc::
GameMode=0
isenabled=1
;MsgBox,0x40040,Power Keys %v% by 知阳,游戏模式已关闭。
Return

#if

#if isenabled

#End::Run,"%A_ScriptFullPath%" 1 1 1

#!PrintScreen::Run, %systemroot%\system32\snippingtool.exe,,UseErrorLevel

Lwin & PgUp::
Rwin & PgUp::
Send #=
Return

Lwin & PgDn::
Rwin & PgDn::
Send #-
Return

LWin & G::
RWin & G::
GameMode=1
isenabled=0
;MsgBox,0x40040,Power Keys %v% by 知阳,游戏模式已开启。
Return

Lwin & F4::
Rwin & F4::
MsgBox,0x40114,Power Keys %v% by 知阳,退出 Power Keys？
ifMsgBox,yes
ExitApp
else
Run,"%A_ScriptFullPath%" 1 1 1 1
Return

Space::Space
Space & Shift::Space
Space & F::Send {Left}
Space & J::Send {Right}
Space & G::Send +{WheelUp}
Space & H::Send +{WheelDown}
Space & CapsLock::Send {Backspace}
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
Space & `::Send ^j
Space & 1::Send ^{1}
Space & 2::Send ^{2}
Space & 3::Send ^{3}
Space & 4::Send ^{4}
Space & Tab::Send ^{a}
Space & O::Send ^+,
Space & P::Send ^+.
Space & =::Send ^{WheelUp}
Space & -::Send ^{WheelDown}
Space & [::Send {!Left}
Space & ]::Send {!Right}

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

Tab::Tab
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
Tab & Delete::Send ^!{Delete}
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
Esc & Delete::Run,"%A_ScriptFullPath%" 1
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

F1::F1
F2::F2
F3::F3
F4::F4
F5::F5
F6::F6
F7::F7
F8::F8
F9::F9
F10::F10
F11::F11
F12::F12

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

F1 & Space::Send !{F4}
F2 & Space::Send !{F4}
F3 & Space::Send !{F4}
F4 & Space::Send !{F4}
F5 & Space::Send !{F4}
F6 & Space::Send !{F4}
F7 & Space::Send !{F4}
F8 & Space::Send !{F4}
F9 & Space::Send !{F4}
F10 & Space::Send !{F4}
F11 & Space::Send !{F4}
F12 & Space::Send !{F4}

F1 & PrintScreen::^+!F1
F2 & PrintScreen::^+!F2
F3 & PrintScreen::^+!F3
F4 & PrintScreen::^+!F4
F5 & PrintScreen::^+!F5
F6 & PrintScreen::^+!F6
F7 & PrintScreen::^+!F7
F8 & PrintScreen::^+!F8
F9 & PrintScreen::^+!F9
F10 & PrintScreen::^+!F10
F11 & PrintScreen::^+!F11
F12 & PrintScreen::^+!F12

F1 & Enter Up::Run, F1
F1 & a Up::Run,"%A_ScriptFullPath%" 1 a
F1 & b Up::Run,"%A_ScriptFullPath%" 1 b
F1 & c Up::Run,"%A_ScriptFullPath%" 1 c
F1 & d Up::Run,"%A_ScriptFullPath%" 1 d
F1 & e Up::Run,"%A_ScriptFullPath%" 1 e
F1 & f Up::Run,"%A_ScriptFullPath%" 1 f
F1 & g Up::Run,"%A_ScriptFullPath%" 1 g
F1 & h Up::Run,"%A_ScriptFullPath%" 1 h
F1 & i Up::Run,"%A_ScriptFullPath%" 1 i
F1 & j Up::Run,"%A_ScriptFullPath%" 1 j
F1 & k Up::Run,"%A_ScriptFullPath%" 1 k
F1 & l Up::Run,"%A_ScriptFullPath%" 1 l
F1 & m Up::Run,"%A_ScriptFullPath%" 1 m
F1 & n Up::Run,"%A_ScriptFullPath%" 1 n
F1 & o Up::Run,"%A_ScriptFullPath%" 1 o
F1 & p Up::Run,"%A_ScriptFullPath%" 1 p
F1 & q Up::Run,"%A_ScriptFullPath%" 1 q
F1 & r Up::Run,"%A_ScriptFullPath%" 1 r
F1 & s Up::Run,"%A_ScriptFullPath%" 1 s
F1 & t Up::Run,"%A_ScriptFullPath%" 1 t
F1 & u Up::Run,"%A_ScriptFullPath%" 1 u
F1 & v Up::Run,"%A_ScriptFullPath%" 1 v
F1 & w Up::Run,"%A_ScriptFullPath%" 1 w
F1 & x Up::Run,"%A_ScriptFullPath%" 1 x
F1 & y Up::Run,"%A_ScriptFullPath%" 1 y
F1 & z Up::Run,"%A_ScriptFullPath%" 1 z
F1 & 1 Up::Run,"%A_ScriptFullPath%" 1 1
F1 & 2 Up::Run,"%A_ScriptFullPath%" 1 2
F1 & 3 Up::Run,"%A_ScriptFullPath%" 1 3
F1 & 4 Up::Run,"%A_ScriptFullPath%" 1 4
F1 & 5 Up::Run,"%A_ScriptFullPath%" 1 5
F1 & 6 Up::Run,"%A_ScriptFullPath%" 1 6
F1 & 7 Up::Run,"%A_ScriptFullPath%" 1 7
F1 & 8 Up::Run,"%A_ScriptFullPath%" 1 8
F1 & 9 Up::Run,"%A_ScriptFullPath%" 1 9
F1 & 0 Up::Run,"%A_ScriptFullPath%" 1 0

F2 & Enter Up::Run, F2
F2 & a Up::Run,"%A_ScriptFullPath%" 2 a
F2 & b Up::Run,"%A_ScriptFullPath%" 2 b
F2 & c Up::Run,"%A_ScriptFullPath%" 2 c
F2 & d Up::Run,"%A_ScriptFullPath%" 2 d
F2 & e Up::Run,"%A_ScriptFullPath%" 2 e
F2 & f Up::Run,"%A_ScriptFullPath%" 2 f
F2 & g Up::Run,"%A_ScriptFullPath%" 2 g
F2 & h Up::Run,"%A_ScriptFullPath%" 2 h
F2 & i Up::Run,"%A_ScriptFullPath%" 2 i
F2 & j Up::Run,"%A_ScriptFullPath%" 2 j
F2 & k Up::Run,"%A_ScriptFullPath%" 2 k
F2 & l Up::Run,"%A_ScriptFullPath%" 2 l
F2 & m Up::Run,"%A_ScriptFullPath%" 2 m
F2 & n Up::Run,"%A_ScriptFullPath%" 2 n
F2 & o Up::Run,"%A_ScriptFullPath%" 2 o
F2 & p Up::Run,"%A_ScriptFullPath%" 2 p
F2 & q Up::Run,"%A_ScriptFullPath%" 2 q
F2 & r Up::Run,"%A_ScriptFullPath%" 2 r
F2 & s Up::Run,"%A_ScriptFullPath%" 2 s
F2 & t Up::Run,"%A_ScriptFullPath%" 2 t
F2 & u Up::Run,"%A_ScriptFullPath%" 2 u
F2 & v Up::Run,"%A_ScriptFullPath%" 2 v
F2 & w Up::Run,"%A_ScriptFullPath%" 2 w
F2 & x Up::Run,"%A_ScriptFullPath%" 2 x
F2 & y Up::Run,"%A_ScriptFullPath%" 2 y
F2 & z Up::Run,"%A_ScriptFullPath%" 2 z
F2 & 1 Up::Run,"%A_ScriptFullPath%" 2 1
F2 & 2 Up::Run,"%A_ScriptFullPath%" 2 2
F2 & 3 Up::Run,"%A_ScriptFullPath%" 2 3
F2 & 4 Up::Run,"%A_ScriptFullPath%" 2 4
F2 & 5 Up::Run,"%A_ScriptFullPath%" 2 5
F2 & 6 Up::Run,"%A_ScriptFullPath%" 2 6
F2 & 7 Up::Run,"%A_ScriptFullPath%" 2 7
F2 & 8 Up::Run,"%A_ScriptFullPath%" 2 8
F2 & 9 Up::Run,"%A_ScriptFullPath%" 2 9
F2 & 0 Up::Run,"%A_ScriptFullPath%" 2 0

F3 & Enter Up::Run, F3
F3 & a Up::Run,"%A_ScriptFullPath%" 3 a
F3 & b Up::Run,"%A_ScriptFullPath%" 3 b
F3 & c Up::Run,"%A_ScriptFullPath%" 3 c
F3 & d Up::Run,"%A_ScriptFullPath%" 3 d
F3 & e Up::Run,"%A_ScriptFullPath%" 3 e
F3 & f Up::Run,"%A_ScriptFullPath%" 3 f
F3 & g Up::Run,"%A_ScriptFullPath%" 3 g
F3 & h Up::Run,"%A_ScriptFullPath%" 3 h
F3 & i Up::Run,"%A_ScriptFullPath%" 3 i
F3 & j Up::Run,"%A_ScriptFullPath%" 3 j
F3 & k Up::Run,"%A_ScriptFullPath%" 3 k
F3 & l Up::Run,"%A_ScriptFullPath%" 3 l
F3 & m Up::Run,"%A_ScriptFullPath%" 3 m
F3 & n Up::Run,"%A_ScriptFullPath%" 3 n
F3 & o Up::Run,"%A_ScriptFullPath%" 3 o
F3 & p Up::Run,"%A_ScriptFullPath%" 3 p
F3 & q Up::Run,"%A_ScriptFullPath%" 3 q
F3 & r Up::Run,"%A_ScriptFullPath%" 3 r
F3 & s Up::Run,"%A_ScriptFullPath%" 3 s
F3 & t Up::Run,"%A_ScriptFullPath%" 3 t
F3 & u Up::Run,"%A_ScriptFullPath%" 3 u
F3 & v Up::Run,"%A_ScriptFullPath%" 3 v
F3 & w Up::Run,"%A_ScriptFullPath%" 3 w
F3 & x Up::Run,"%A_ScriptFullPath%" 3 x
F3 & y Up::Run,"%A_ScriptFullPath%" 3 y
F3 & z Up::Run,"%A_ScriptFullPath%" 3 z
F3 & 1 Up::Run,"%A_ScriptFullPath%" 3 1
F3 & 2 Up::Run,"%A_ScriptFullPath%" 3 2
F3 & 3 Up::Run,"%A_ScriptFullPath%" 3 3
F3 & 4 Up::Run,"%A_ScriptFullPath%" 3 4
F3 & 5 Up::Run,"%A_ScriptFullPath%" 3 5
F3 & 6 Up::Run,"%A_ScriptFullPath%" 3 6
F3 & 7 Up::Run,"%A_ScriptFullPath%" 3 7
F3 & 8 Up::Run,"%A_ScriptFullPath%" 3 8
F3 & 9 Up::Run,"%A_ScriptFullPath%" 3 9
F3 & 0 Up::Run,"%A_ScriptFullPath%" 3 0

F4 & Enter Up::Run, F4
F4 & a Up::Run,"%A_ScriptFullPath%" 4 a
F4 & b Up::Run,"%A_ScriptFullPath%" 4 b
F4 & c Up::Run,"%A_ScriptFullPath%" 4 c
F4 & d Up::Run,"%A_ScriptFullPath%" 4 d
F4 & e Up::Run,"%A_ScriptFullPath%" 4 e
F4 & f Up::Run,"%A_ScriptFullPath%" 4 f
F4 & g Up::Run,"%A_ScriptFullPath%" 4 g
F4 & h Up::Run,"%A_ScriptFullPath%" 4 h
F4 & i Up::Run,"%A_ScriptFullPath%" 4 i
F4 & j Up::Run,"%A_ScriptFullPath%" 4 j
F4 & k Up::Run,"%A_ScriptFullPath%" 4 k
F4 & l Up::Run,"%A_ScriptFullPath%" 4 l
F4 & m Up::Run,"%A_ScriptFullPath%" 4 m
F4 & n Up::Run,"%A_ScriptFullPath%" 4 n
F4 & o Up::Run,"%A_ScriptFullPath%" 4 o
F4 & p Up::Run,"%A_ScriptFullPath%" 4 p
F4 & q Up::Run,"%A_ScriptFullPath%" 4 q
F4 & r Up::Run,"%A_ScriptFullPath%" 4 r
F4 & s Up::Run,"%A_ScriptFullPath%" 4 s
F4 & t Up::Run,"%A_ScriptFullPath%" 4 t
F4 & u Up::Run,"%A_ScriptFullPath%" 4 u
F4 & v Up::Run,"%A_ScriptFullPath%" 4 v
F4 & w Up::Run,"%A_ScriptFullPath%" 4 w
F4 & x Up::Run,"%A_ScriptFullPath%" 4 x
F4 & y Up::Run,"%A_ScriptFullPath%" 4 y
F4 & z Up::Run,"%A_ScriptFullPath%" 4 z
F4 & 1 Up::Run,"%A_ScriptFullPath%" 4 1
F4 & 2 Up::Run,"%A_ScriptFullPath%" 4 2
F4 & 3 Up::Run,"%A_ScriptFullPath%" 4 3
F4 & 4 Up::Run,"%A_ScriptFullPath%" 4 4
F4 & 5 Up::Run,"%A_ScriptFullPath%" 4 5
F4 & 6 Up::Run,"%A_ScriptFullPath%" 4 6
F4 & 7 Up::Run,"%A_ScriptFullPath%" 4 7
F4 & 8 Up::Run,"%A_ScriptFullPath%" 4 8
F4 & 9 Up::Run,"%A_ScriptFullPath%" 4 9
F4 & 0 Up::Run,"%A_ScriptFullPath%" 4 0

F5 & Enter Up::Run, F5
F5 & a Up::Run,"%A_ScriptFullPath%" 5 a
F5 & b Up::Run,"%A_ScriptFullPath%" 5 b
F5 & c Up::Run,"%A_ScriptFullPath%" 5 c
F5 & d Up::Run,"%A_ScriptFullPath%" 5 d
F5 & e Up::Run,"%A_ScriptFullPath%" 5 e
F5 & f Up::Run,"%A_ScriptFullPath%" 5 f
F5 & g Up::Run,"%A_ScriptFullPath%" 5 g
F5 & h Up::Run,"%A_ScriptFullPath%" 5 h
F5 & i Up::Run,"%A_ScriptFullPath%" 5 i
F5 & j Up::Run,"%A_ScriptFullPath%" 5 j
F5 & k Up::Run,"%A_ScriptFullPath%" 5 k
F5 & l Up::Run,"%A_ScriptFullPath%" 5 l
F5 & m Up::Run,"%A_ScriptFullPath%" 5 m
F5 & n Up::Run,"%A_ScriptFullPath%" 5 n
F5 & o Up::Run,"%A_ScriptFullPath%" 5 o
F5 & p Up::Run,"%A_ScriptFullPath%" 5 p
F5 & q Up::Run,"%A_ScriptFullPath%" 5 q
F5 & r Up::Run,"%A_ScriptFullPath%" 5 r
F5 & s Up::Run,"%A_ScriptFullPath%" 5 s
F5 & t Up::Run,"%A_ScriptFullPath%" 5 t
F5 & u Up::Run,"%A_ScriptFullPath%" 5 u
F5 & v Up::Run,"%A_ScriptFullPath%" 5 v
F5 & w Up::Run,"%A_ScriptFullPath%" 5 w
F5 & x Up::Run,"%A_ScriptFullPath%" 5 x
F5 & y Up::Run,"%A_ScriptFullPath%" 5 y
F5 & z Up::Run,"%A_ScriptFullPath%" 5 z
F5 & 1 Up::Run,"%A_ScriptFullPath%" 5 1
F5 & 2 Up::Run,"%A_ScriptFullPath%" 5 2
F5 & 3 Up::Run,"%A_ScriptFullPath%" 5 3
F5 & 4 Up::Run,"%A_ScriptFullPath%" 5 4
F5 & 5 Up::Run,"%A_ScriptFullPath%" 5 5
F5 & 6 Up::Run,"%A_ScriptFullPath%" 5 6
F5 & 7 Up::Run,"%A_ScriptFullPath%" 5 7
F5 & 8 Up::Run,"%A_ScriptFullPath%" 5 8
F5 & 9 Up::Run,"%A_ScriptFullPath%" 5 9
F5 & 0 Up::Run,"%A_ScriptFullPath%" 5 0

F6 & Enter Up::Run, F6
F6 & a Up::Run,"%A_ScriptFullPath%" 6 a
F6 & b Up::Run,"%A_ScriptFullPath%" 6 b
F6 & c Up::Run,"%A_ScriptFullPath%" 6 c
F6 & d Up::Run,"%A_ScriptFullPath%" 6 d
F6 & e Up::Run,"%A_ScriptFullPath%" 6 e
F6 & f Up::Run,"%A_ScriptFullPath%" 6 f
F6 & g Up::Run,"%A_ScriptFullPath%" 6 g
F6 & h Up::Run,"%A_ScriptFullPath%" 6 h
F6 & i Up::Run,"%A_ScriptFullPath%" 6 i
F6 & j Up::Run,"%A_ScriptFullPath%" 6 j
F6 & k Up::Run,"%A_ScriptFullPath%" 6 k
F6 & l Up::Run,"%A_ScriptFullPath%" 6 l
F6 & m Up::Run,"%A_ScriptFullPath%" 6 m
F6 & n Up::Run,"%A_ScriptFullPath%" 6 n
F6 & o Up::Run,"%A_ScriptFullPath%" 6 o
F6 & p Up::Run,"%A_ScriptFullPath%" 6 p
F6 & q Up::Run,"%A_ScriptFullPath%" 6 q
F6 & r Up::Run,"%A_ScriptFullPath%" 6 r
F6 & s Up::Run,"%A_ScriptFullPath%" 6 s
F6 & t Up::Run,"%A_ScriptFullPath%" 6 t
F6 & u Up::Run,"%A_ScriptFullPath%" 6 u
F6 & v Up::Run,"%A_ScriptFullPath%" 6 v
F6 & w Up::Run,"%A_ScriptFullPath%" 6 w
F6 & x Up::Run,"%A_ScriptFullPath%" 6 x
F6 & y Up::Run,"%A_ScriptFullPath%" 6 y
F6 & z Up::Run,"%A_ScriptFullPath%" 6 z
F6 & 1 Up::Run,"%A_ScriptFullPath%" 6 1
F6 & 2 Up::Run,"%A_ScriptFullPath%" 6 2
F6 & 3 Up::Run,"%A_ScriptFullPath%" 6 3
F6 & 4 Up::Run,"%A_ScriptFullPath%" 6 4
F6 & 5 Up::Run,"%A_ScriptFullPath%" 6 5
F6 & 6 Up::Run,"%A_ScriptFullPath%" 6 6
F6 & 7 Up::Run,"%A_ScriptFullPath%" 6 7
F6 & 8 Up::Run,"%A_ScriptFullPath%" 6 8
F6 & 9 Up::Run,"%A_ScriptFullPath%" 6 9
F6 & 0 Up::Run,"%A_ScriptFullPath%" 6 0

F7 & Enter Up::Run, F7
F7 & a Up::Run,"%A_ScriptFullPath%" 7 a
F7 & b Up::Run,"%A_ScriptFullPath%" 7 b
F7 & c Up::Run,"%A_ScriptFullPath%" 7 c
F7 & d Up::Run,"%A_ScriptFullPath%" 7 d
F7 & e Up::Run,"%A_ScriptFullPath%" 7 e
F7 & f Up::Run,"%A_ScriptFullPath%" 7 f
F7 & g Up::Run,"%A_ScriptFullPath%" 7 g
F7 & h Up::Run,"%A_ScriptFullPath%" 7 h
F7 & i Up::Run,"%A_ScriptFullPath%" 7 i
F7 & j Up::Run,"%A_ScriptFullPath%" 7 j
F7 & k Up::Run,"%A_ScriptFullPath%" 7 k
F7 & l Up::Run,"%A_ScriptFullPath%" 7 l
F7 & m Up::Run,"%A_ScriptFullPath%" 7 m
F7 & n Up::Run,"%A_ScriptFullPath%" 7 n
F7 & o Up::Run,"%A_ScriptFullPath%" 7 o
F7 & p Up::Run,"%A_ScriptFullPath%" 7 p
F7 & q Up::Run,"%A_ScriptFullPath%" 7 q
F7 & r Up::Run,"%A_ScriptFullPath%" 7 r
F7 & s Up::Run,"%A_ScriptFullPath%" 7 s
F7 & t Up::Run,"%A_ScriptFullPath%" 7 t
F7 & u Up::Run,"%A_ScriptFullPath%" 7 u
F7 & v Up::Run,"%A_ScriptFullPath%" 7 v
F7 & w Up::Run,"%A_ScriptFullPath%" 7 w
F7 & x Up::Run,"%A_ScriptFullPath%" 7 x
F7 & y Up::Run,"%A_ScriptFullPath%" 7 y
F7 & z Up::Run,"%A_ScriptFullPath%" 7 z
F7 & 1 Up::Run,"%A_ScriptFullPath%" 7 1
F7 & 2 Up::Run,"%A_ScriptFullPath%" 7 2
F7 & 3 Up::Run,"%A_ScriptFullPath%" 7 3
F7 & 4 Up::Run,"%A_ScriptFullPath%" 7 4
F7 & 5 Up::Run,"%A_ScriptFullPath%" 7 5
F7 & 6 Up::Run,"%A_ScriptFullPath%" 7 6
F7 & 7 Up::Run,"%A_ScriptFullPath%" 7 7
F7 & 8 Up::Run,"%A_ScriptFullPath%" 7 8
F7 & 9 Up::Run,"%A_ScriptFullPath%" 7 9
F7 & 0 Up::Run,"%A_ScriptFullPath%" 7 0

F8 & Enter Up::Run, F8
F8 & a Up::Run,"%A_ScriptFullPath%" 8 a
F8 & b Up::Run,"%A_ScriptFullPath%" 8 b
F8 & c Up::Run,"%A_ScriptFullPath%" 8 c
F8 & d Up::Run,"%A_ScriptFullPath%" 8 d
F8 & e Up::Run,"%A_ScriptFullPath%" 8 e
F8 & f Up::Run,"%A_ScriptFullPath%" 8 f
F8 & g Up::Run,"%A_ScriptFullPath%" 8 g
F8 & h Up::Run,"%A_ScriptFullPath%" 8 h
F8 & i Up::Run,"%A_ScriptFullPath%" 8 i
F8 & j Up::Run,"%A_ScriptFullPath%" 8 j
F8 & k Up::Run,"%A_ScriptFullPath%" 8 k
F8 & l Up::Run,"%A_ScriptFullPath%" 8 l
F8 & m Up::Run,"%A_ScriptFullPath%" 8 m
F8 & n Up::Run,"%A_ScriptFullPath%" 8 n
F8 & o Up::Run,"%A_ScriptFullPath%" 8 o
F8 & p Up::Run,"%A_ScriptFullPath%" 8 p
F8 & q Up::Run,"%A_ScriptFullPath%" 8 q
F8 & r Up::Run,"%A_ScriptFullPath%" 8 r
F8 & s Up::Run,"%A_ScriptFullPath%" 8 s
F8 & t Up::Run,"%A_ScriptFullPath%" 8 t
F8 & u Up::Run,"%A_ScriptFullPath%" 8 u
F8 & v Up::Run,"%A_ScriptFullPath%" 8 v
F8 & w Up::Run,"%A_ScriptFullPath%" 8 w
F8 & x Up::Run,"%A_ScriptFullPath%" 8 x
F8 & y Up::Run,"%A_ScriptFullPath%" 8 y
F8 & z Up::Run,"%A_ScriptFullPath%" 8 z
F8 & 1 Up::Run,"%A_ScriptFullPath%" 8 1
F8 & 2 Up::Run,"%A_ScriptFullPath%" 8 2
F8 & 3 Up::Run,"%A_ScriptFullPath%" 8 3
F8 & 4 Up::Run,"%A_ScriptFullPath%" 8 4
F8 & 5 Up::Run,"%A_ScriptFullPath%" 8 5
F8 & 6 Up::Run,"%A_ScriptFullPath%" 8 6
F8 & 7 Up::Run,"%A_ScriptFullPath%" 8 7
F8 & 8 Up::Run,"%A_ScriptFullPath%" 8 8
F8 & 9 Up::Run,"%A_ScriptFullPath%" 8 9
F8 & 0 Up::Run,"%A_ScriptFullPath%" 8 0

F9 & Enter Up::Run, F9
F9 & a Up::Run,"%A_ScriptFullPath%" 9 a
F9 & b Up::Run,"%A_ScriptFullPath%" 9 b
F9 & c Up::Run,"%A_ScriptFullPath%" 9 c
F9 & d Up::Run,"%A_ScriptFullPath%" 9 d
F9 & e Up::Run,"%A_ScriptFullPath%" 9 e
F9 & f Up::Run,"%A_ScriptFullPath%" 9 f
F9 & g Up::Run,"%A_ScriptFullPath%" 9 g
F9 & h Up::Run,"%A_ScriptFullPath%" 9 h
F9 & i Up::Run,"%A_ScriptFullPath%" 9 i
F9 & j Up::Run,"%A_ScriptFullPath%" 9 j
F9 & k Up::Run,"%A_ScriptFullPath%" 9 k
F9 & l Up::Run,"%A_ScriptFullPath%" 9 l
F9 & m Up::Run,"%A_ScriptFullPath%" 9 m
F9 & n Up::Run,"%A_ScriptFullPath%" 9 n
F9 & o Up::Run,"%A_ScriptFullPath%" 9 o
F9 & p Up::Run,"%A_ScriptFullPath%" 9 p
F9 & q Up::Run,"%A_ScriptFullPath%" 9 q
F9 & r Up::Run,"%A_ScriptFullPath%" 9 r
F9 & s Up::Run,"%A_ScriptFullPath%" 9 s
F9 & t Up::Run,"%A_ScriptFullPath%" 9 t
F9 & u Up::Run,"%A_ScriptFullPath%" 9 u
F9 & v Up::Run,"%A_ScriptFullPath%" 9 v
F9 & w Up::Run,"%A_ScriptFullPath%" 9 w
F9 & x Up::Run,"%A_ScriptFullPath%" 9 x
F9 & y Up::Run,"%A_ScriptFullPath%" 9 y
F9 & z Up::Run,"%A_ScriptFullPath%" 9 z
F9 & 1 Up::Run,"%A_ScriptFullPath%" 9 1
F9 & 2 Up::Run,"%A_ScriptFullPath%" 9 2
F9 & 3 Up::Run,"%A_ScriptFullPath%" 9 3
F9 & 4 Up::Run,"%A_ScriptFullPath%" 9 4
F9 & 5 Up::Run,"%A_ScriptFullPath%" 9 5
F9 & 6 Up::Run,"%A_ScriptFullPath%" 9 6
F9 & 7 Up::Run,"%A_ScriptFullPath%" 9 7
F9 & 8 Up::Run,"%A_ScriptFullPath%" 9 8
F9 & 9 Up::Run,"%A_ScriptFullPath%" 9 9
F9 & 0 Up::Run,"%A_ScriptFullPath%" 9 0

F10 & Enter Up::Run, F10
F10 & a Up::Run,"%A_ScriptFullPath%" 10 a
F10 & b Up::Run,"%A_ScriptFullPath%" 10 b
F10 & c Up::Run,"%A_ScriptFullPath%" 10 c
F10 & d Up::Run,"%A_ScriptFullPath%" 10 d
F10 & e Up::Run,"%A_ScriptFullPath%" 10 e
F10 & f Up::Run,"%A_ScriptFullPath%" 10 f
F10 & g Up::Run,"%A_ScriptFullPath%" 10 g
F10 & h Up::Run,"%A_ScriptFullPath%" 10 h
F10 & i Up::Run,"%A_ScriptFullPath%" 10 i
F10 & j Up::Run,"%A_ScriptFullPath%" 10 j
F10 & k Up::Run,"%A_ScriptFullPath%" 10 k
F10 & l Up::Run,"%A_ScriptFullPath%" 10 l
F10 & m Up::Run,"%A_ScriptFullPath%" 10 m
F10 & n Up::Run,"%A_ScriptFullPath%" 10 n
F10 & o Up::Run,"%A_ScriptFullPath%" 10 o
F10 & p Up::Run,"%A_ScriptFullPath%" 10 p
F10 & q Up::Run,"%A_ScriptFullPath%" 10 q
F10 & r Up::Run,"%A_ScriptFullPath%" 10 r
F10 & s Up::Run,"%A_ScriptFullPath%" 10 s
F10 & t Up::Run,"%A_ScriptFullPath%" 10 t
F10 & u Up::Run,"%A_ScriptFullPath%" 10 u
F10 & v Up::Run,"%A_ScriptFullPath%" 10 v
F10 & w Up::Run,"%A_ScriptFullPath%" 10 w
F10 & x Up::Run,"%A_ScriptFullPath%" 10 x
F10 & y Up::Run,"%A_ScriptFullPath%" 10 y
F10 & z Up::Run,"%A_ScriptFullPath%" 10 z
F10 & 1 Up::Run,"%A_ScriptFullPath%" 10 1
F10 & 2 Up::Run,"%A_ScriptFullPath%" 10 2
F10 & 3 Up::Run,"%A_ScriptFullPath%" 10 3
F10 & 4 Up::Run,"%A_ScriptFullPath%" 10 4
F10 & 5 Up::Run,"%A_ScriptFullPath%" 10 5
F10 & 6 Up::Run,"%A_ScriptFullPath%" 10 6
F10 & 7 Up::Run,"%A_ScriptFullPath%" 10 7
F10 & 8 Up::Run,"%A_ScriptFullPath%" 10 8
F10 & 9 Up::Run,"%A_ScriptFullPath%" 10 9
F10 & 0 Up::Run,"%A_ScriptFullPath%" 10 0

F11 & Enter Up::Run, F11
F11 & a Up::Run,"%A_ScriptFullPath%" 11 a
F11 & b Up::Run,"%A_ScriptFullPath%" 11 b
F11 & c Up::Run,"%A_ScriptFullPath%" 11 c
F11 & d Up::Run,"%A_ScriptFullPath%" 11 d
F11 & e Up::Run,"%A_ScriptFullPath%" 11 e
F11 & f Up::Run,"%A_ScriptFullPath%" 11 f
F11 & g Up::Run,"%A_ScriptFullPath%" 11 g
F11 & h Up::Run,"%A_ScriptFullPath%" 11 h
F11 & i Up::Run,"%A_ScriptFullPath%" 11 i
F11 & j Up::Run,"%A_ScriptFullPath%" 11 j
F11 & k Up::Run,"%A_ScriptFullPath%" 11 k
F11 & l Up::Run,"%A_ScriptFullPath%" 11 l
F11 & m Up::Run,"%A_ScriptFullPath%" 11 m
F11 & n Up::Run,"%A_ScriptFullPath%" 11 n
F11 & o Up::Run,"%A_ScriptFullPath%" 11 o
F11 & p Up::Run,"%A_ScriptFullPath%" 11 p
F11 & q Up::Run,"%A_ScriptFullPath%" 11 q
F11 & r Up::Run,"%A_ScriptFullPath%" 11 r
F11 & s Up::Run,"%A_ScriptFullPath%" 11 s
F11 & t Up::Run,"%A_ScriptFullPath%" 11 t
F11 & u Up::Run,"%A_ScriptFullPath%" 11 u
F11 & v Up::Run,"%A_ScriptFullPath%" 11 v
F11 & w Up::Run,"%A_ScriptFullPath%" 11 w
F11 & x Up::Run,"%A_ScriptFullPath%" 11 x
F11 & y Up::Run,"%A_ScriptFullPath%" 11 y
F11 & z Up::Run,"%A_ScriptFullPath%" 11 z
F11 & 1 Up::Run,"%A_ScriptFullPath%" 11 1
F11 & 2 Up::Run,"%A_ScriptFullPath%" 11 2
F11 & 3 Up::Run,"%A_ScriptFullPath%" 11 3
F11 & 4 Up::Run,"%A_ScriptFullPath%" 11 4
F11 & 5 Up::Run,"%A_ScriptFullPath%" 11 5
F11 & 6 Up::Run,"%A_ScriptFullPath%" 11 6
F11 & 7 Up::Run,"%A_ScriptFullPath%" 11 7
F11 & 8 Up::Run,"%A_ScriptFullPath%" 11 8
F11 & 9 Up::Run,"%A_ScriptFullPath%" 11 9
F11 & 0 Up::Run,"%A_ScriptFullPath%" 11 0

F12 & Enter Up::Run, F12
F12 & a Up::Run,"%A_ScriptFullPath%" 12 a
F12 & b Up::Run,"%A_ScriptFullPath%" 12 b
F12 & c Up::Run,"%A_ScriptFullPath%" 12 c
F12 & d Up::Run,"%A_ScriptFullPath%" 12 d
F12 & e Up::Run,"%A_ScriptFullPath%" 12 e
F12 & f Up::Run,"%A_ScriptFullPath%" 12 f
F12 & g Up::Run,"%A_ScriptFullPath%" 12 g
F12 & h Up::Run,"%A_ScriptFullPath%" 12 h
F12 & i Up::Run,"%A_ScriptFullPath%" 12 i
F12 & j Up::Run,"%A_ScriptFullPath%" 12 j
F12 & k Up::Run,"%A_ScriptFullPath%" 12 k
F12 & l Up::Run,"%A_ScriptFullPath%" 12 l
F12 & m Up::Run,"%A_ScriptFullPath%" 12 m
F12 & n Up::Run,"%A_ScriptFullPath%" 12 n
F12 & o Up::Run,"%A_ScriptFullPath%" 12 o
F12 & p Up::Run,"%A_ScriptFullPath%" 12 p
F12 & q Up::Run,"%A_ScriptFullPath%" 12 q
F12 & r Up::Run,"%A_ScriptFullPath%" 12 r
F12 & s Up::Run,"%A_ScriptFullPath%" 12 s
F12 & t Up::Run,"%A_ScriptFullPath%" 12 t
F12 & u Up::Run,"%A_ScriptFullPath%" 12 u
F12 & v Up::Run,"%A_ScriptFullPath%" 12 v
F12 & w Up::Run,"%A_ScriptFullPath%" 12 w
F12 & x Up::Run,"%A_ScriptFullPath%" 12 x
F12 & y Up::Run,"%A_ScriptFullPath%" 12 y
F12 & z Up::Run,"%A_ScriptFullPath%" 12 z
F12 & 1 Up::Run,"%A_ScriptFullPath%" 12 1
F12 & 2 Up::Run,"%A_ScriptFullPath%" 12 2
F12 & 3 Up::Run,"%A_ScriptFullPath%" 12 3
F12 & 4 Up::Run,"%A_ScriptFullPath%" 12 4
F12 & 5 Up::Run,"%A_ScriptFullPath%" 12 5
F12 & 6 Up::Run,"%A_ScriptFullPath%" 12 6
F12 & 7 Up::Run,"%A_ScriptFullPath%" 12 7
F12 & 8 Up::Run,"%A_ScriptFullPath%" 12 8
F12 & 9 Up::Run,"%A_ScriptFullPath%" 12 9
F12 & 0 Up::Run,"%A_ScriptFullPath%" 12 0
