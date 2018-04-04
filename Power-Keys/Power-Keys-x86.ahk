#SingleInstance force
#MaxHotkeysPerInterval 1000
#Persistent
#InstallKeybdHook
#NoTrayIcon

v:="2.3.0"

isenabled=0

Process, Priority, , High

if A_Is64bitOS
{
msgbox,0x40130,Power Keys %v% by 知阳,为确保兼容性，`n您必须使用 64 位版本的 Power Keys！
exitapp

if A_IsAdmin
{
MsgBox,0x40030,Power Keys %v% by 知阳,为确保安全性和兼容性，`nPower Keys 拒绝以管理员身份运行！
ExitApp
}

if !A_Args.Length()
MsgBox,0x40040,Power Keys %v% by 知阳,欢迎使用 Power Keys！

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

isenabled=1
GameMode=0

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
Run, https://github.com/szzhiyang/PerfectWindows/blob/master/README.md,,UseErrorLevel
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

#End::DllCall("PowrProf\SetSuspendState", "int", 1, "int", 0, "int", 1)

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
Run,"%A_ScriptFullPath%" 1
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

CapsLock & a::
Send ^+!{a}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & b::
Send ^+!{b}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & c::
Send ^+!{c}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & d::
Send ^+!{d}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & e::
Send ^+!{e}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & f::
Send ^+!{f}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & g::
Send ^+!{g}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & h::
Send ^+!{h}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & i::
Send ^+!{i}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & j::
Send ^+!{j}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & k::
Send ^+!{k}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & l::
Send ^+!{l}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & m::
Send ^+!{m}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & n::
Send ^+!{n}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & o::
Send ^+!{o}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & p::
Send ^+!{p}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & q::
Send ^+!{q}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & r::
Send ^+!{r}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & s::
Send ^+!{s}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & t::
Send ^+!{t}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & u::
Send ^+!{u}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & v::
Send ^+!{v}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & w::
Send ^+!{w}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & x::
Send ^+!{x}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & y::
Send ^+!{y}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & z::
Send ^+!{z}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & 1::
Send ^+!{1}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & 2::
Send ^+!{2}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & 3::
Send ^+!{3}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & 4::
Send ^+!{4}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & 5::
Send ^+!{5}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & 6::
Send ^+!{6}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & 7::
Send ^+!{7}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & 8::
Send ^+!{8}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & 9::
Send ^+!{9}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & 0::
Send ^+!{0}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & F1::
Send ^+!{F1}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & F2::
Send ^+!{F2}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & F3::
Send ^+!{F3}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & F4::
Send ^+!{F4}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & F5::
Send ^+!{F5}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & F6::
Send ^+!{F6}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & F7::
Send ^+!{F7}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & F8::
Send ^+!{F8}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & F9::
Send ^+!{F9}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & F10::
Send ^+!{F10}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & F11::
Send ^+!{F11}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & F12::
Send ^+!{F12}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & ,::
Send ^+!{,}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & .::
Send ^+!{.}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & /::
Send ^+!{/}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & '::
Send ^+!{'}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & [::
Send ^+!{[}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & ]::
Send ^+!{]}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & \::
Send ^+!{\}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & -::
Send ^+!{-}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & =::
Send ^+!{=}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & Space::
Send ^+!{Space}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & Enter::
Send ^+!{Enter}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & Backspace::
Send ^+!{Backspace}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & Delete::
Send ^+!{Delete}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & Insert::
Send ^+!{Insert}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & Home::
Send ^+!{Home}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & End::
Send ^+!{End}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & PgUp::
Send ^+!{PgUp}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & PgDn::
Send ^+!{PgDn}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & Up::
Send ^+!{Up}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & Down::
Send ^+!{Down}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & Left::
Send ^+!{Left}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & Right::
Send ^+!{Right}
;Run,"%A_ScriptFullPath%" 1
Return

CapsLock & PrintScreen::
Send ^+!{PrintScreen}
;Run,"%A_ScriptFullPath%" 1
Return

`::`
` & Shift::`

` & a::
Send +!{a}
;Run,"%A_ScriptFullPath%" 1
Return

` & b::
Send +!{b}
;Run,"%A_ScriptFullPath%" 1
Return

` & c::
Send +!{c}
;Run,"%A_ScriptFullPath%" 1
Return

` & d::
Send +!{d}
;Run,"%A_ScriptFullPath%" 1
Return

` & e::
Send +!{e}
;Run,"%A_ScriptFullPath%" 1
Return

` & f::
Send +!{f}
;Run,"%A_ScriptFullPath%" 1
Return

` & g::
Send +!{g}
;Run,"%A_ScriptFullPath%" 1
Return

` & h::
Send +!{h}
;Run,"%A_ScriptFullPath%" 1
Return

` & i::
Send +!{i}
;Run,"%A_ScriptFullPath%" 1
Return

` & j::
Send +!{j}
;Run,"%A_ScriptFullPath%" 1
Return

` & k::
Send +!{k}
;Run,"%A_ScriptFullPath%" 1
Return

` & l::
Send +!{l}
;Run,"%A_ScriptFullPath%" 1
Return

` & m::
Send +!{m}
;Run,"%A_ScriptFullPath%" 1
Return

` & n::
Send +!{n}
;Run,"%A_ScriptFullPath%" 1
Return

` & o::
Send +!{o}
;Run,"%A_ScriptFullPath%" 1
Return

` & p::
Send +!{p}
;Run,"%A_ScriptFullPath%" 1
Return

` & q::
Send +!{q}
;Run,"%A_ScriptFullPath%" 1
Return

` & r::
Send +!{r}
;Run,"%A_ScriptFullPath%" 1
Return

` & s::
Send +!{s}
;Run,"%A_ScriptFullPath%" 1
Return

` & t::
Send +!{t}
;Run,"%A_ScriptFullPath%" 1
Return

` & u::
Send +!{u}
;Run,"%A_ScriptFullPath%" 1
Return

` & v::
Send +!{v}
;Run,"%A_ScriptFullPath%" 1
Return

` & w::
Send +!{w}
;Run,"%A_ScriptFullPath%" 1
Return

` & x::
Send +!{x}
;Run,"%A_ScriptFullPath%" 1
Return

` & y::
Send +!{y}
;Run,"%A_ScriptFullPath%" 1
Return

` & z::
Send +!{z}
;Run,"%A_ScriptFullPath%" 1
Return

` & 1::
Send +!{1}
;Run,"%A_ScriptFullPath%" 1
Return

` & 2::
Send +!{2}
;Run,"%A_ScriptFullPath%" 1
Return

` & 3::
Send +!{3}
;Run,"%A_ScriptFullPath%" 1
Return

` & 4::
Send +!{4}
;Run,"%A_ScriptFullPath%" 1
Return

` & 5::
Send +!{5}
;Run,"%A_ScriptFullPath%" 1
Return

` & 6::
Send +!{6}
;Run,"%A_ScriptFullPath%" 1
Return

` & 7::
Send +!{7}
;Run,"%A_ScriptFullPath%" 1
Return

` & 8::
Send +!{8}
;Run,"%A_ScriptFullPath%" 1
Return

` & 9::
Send +!{9}
;Run,"%A_ScriptFullPath%" 1
Return

` & 0::
Send +!{0}
;Run,"%A_ScriptFullPath%" 1
Return

` & F1::
Send +!{F1}
;Run,"%A_ScriptFullPath%" 1
Return

` & F2::
Send +!{F2}
;Run,"%A_ScriptFullPath%" 1
Return

` & F3::
Send +!{F3}
;Run,"%A_ScriptFullPath%" 1
Return

` & F4::
Send +!{F4}
;Run,"%A_ScriptFullPath%" 1
Return

` & F5::
Send +!{F5}
;Run,"%A_ScriptFullPath%" 1
Return

` & F6::
Send +!{F6}
;Run,"%A_ScriptFullPath%" 1
Return

` & F7::
Send +!{F7}
;Run,"%A_ScriptFullPath%" 1
Return

` & F8::
Send +!{F8}
;Run,"%A_ScriptFullPath%" 1
Return

` & F9::
Send +!{F9}
;Run,"%A_ScriptFullPath%" 1
Return

` & F10::
Send +!{F10}
;Run,"%A_ScriptFullPath%" 1
Return

` & F11::
Send +!{F11}
;Run,"%A_ScriptFullPath%" 1
Return

` & F12::
Send +!{F12}
;Run,"%A_ScriptFullPath%" 1
Return

` & ,::
Send +!{,}
;Run,"%A_ScriptFullPath%" 1
Return

` & .::
Send +!{.}
;Run,"%A_ScriptFullPath%" 1
Return

` & /::
Send +!{/}
;Run,"%A_ScriptFullPath%" 1
Return

` & '::
Send +!{'}
;Run,"%A_ScriptFullPath%" 1
Return

` & [::
Send +!{[}
;Run,"%A_ScriptFullPath%" 1
Return

` & ]::
Send +!{]}
;Run,"%A_ScriptFullPath%" 1
Return

` & \::
Send +!{\}
;Run,"%A_ScriptFullPath%" 1
Return

` & -::
Send +!{-}
;Run,"%A_ScriptFullPath%" 1
Return

` & =::
Send +!{=}
;Run,"%A_ScriptFullPath%" 1
Return

` & Space::
Send +!{Space}
;Run,"%A_ScriptFullPath%" 1
Return

` & Enter::
Send +!{Enter}
;Run,"%A_ScriptFullPath%" 1
Return

` & Backspace::
Send +!{Backspace}
;Run,"%A_ScriptFullPath%" 1
Return

` & Delete::
Send +!{Delete}
;Run,"%A_ScriptFullPath%" 1
Return

` & Insert::
Send +!{Insert}
;Run,"%A_ScriptFullPath%" 1
Return

` & Home::
Send +!{Home}
;Run,"%A_ScriptFullPath%" 1
Return

` & End::
Send +!{End}
;Run,"%A_ScriptFullPath%" 1
Return

` & PgUp::
Send +!{PgUp}
;Run,"%A_ScriptFullPath%" 1
Return

` & PgDn::
Send +!{PgDn}
;Run,"%A_ScriptFullPath%" 1
Return

` & Up::
Send +!{Up}
;Run,"%A_ScriptFullPath%" 1
Return

` & Down::
Send +!{Down}
;Run,"%A_ScriptFullPath%" 1
Return

` & Left::
Send +!{Left}
;Run,"%A_ScriptFullPath%" 1
Return

` & Right::
Send +!{Right}
;Run,"%A_ScriptFullPath%" 1
Return

` & PrintScreen::
Send +!{PrintScreen}
;Run,"%A_ScriptFullPath%" 1
Return

` & Tab::ShiftAltTab

Tab::Tab
Tab & Shift::Tab

Tab & a::
Send ^!{a}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & b::
Send ^!{b}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & c::
Send ^!{c}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & d::
Send ^!{d}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & e::
Send ^!{e}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & f::
Send ^!{f}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & g::
Send ^!{g}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & h::
Send ^!{h}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & i::
Send ^!{i}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & j::
Send ^!{j}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & k::
Send ^!{k}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & l::
Send ^!{l}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & m::
Send ^!{m}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & n::
Send ^!{n}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & o::
Send ^!{o}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & p::
Send ^!{p}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & q::
Send ^!{q}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & r::
Send ^!{r}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & s::
Send ^!{s}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & t::
Send ^!{t}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & u::
Send ^!{u}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & v::
Send ^!{v}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & w::
Send ^!{w}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & x::
Send ^!{x}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & y::
Send ^!{y}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & z::
Send ^!{z}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & 1::
Send ^!{1}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & 2::
Send ^!{2}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & 3::
Send ^!{3}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & 4::
Send ^!{4}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & 5::
Send ^!{5}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & 6::
Send ^!{6}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & 7::
Send ^!{7}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & 8::
Send ^!{8}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & 9::
Send ^!{9}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & 0::
Send ^!{0}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & F1::
Send ^!{F1}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & F2::
Send ^!{F2}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & F3::
Send ^!{F3}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & F4::
Send ^!{F4}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & F5::
Send ^!{F5}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & F6::
Send ^!{F6}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & F7::
Send ^!{F7}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & F8::
Send ^!{F8}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & F9::
Send ^!{F9}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & F10::
Send ^!{F10}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & F11::
Send ^!{F11}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & F12::
Send ^!{F12}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & ,::
Send ^!{,}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & .::
Send ^!{.}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & /::
Send ^!{/}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & '::
Send ^!{'}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & [::
Send ^!{[}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & ]::
Send ^!{]}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & \::
Send ^!{\}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & -::
Send ^!{-}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & =::
Send ^!{=}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & Space::
Send ^!{Space}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & Enter::
Send ^!{Enter}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & Backspace::
Send ^!{Backspace}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & Delete::
Send ^!{Delete}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & Insert::
Send ^!{Insert}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & Home::
Send ^!{Home}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & End::
Send ^!{End}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & PgUp::
Send ^!{PgUp}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & PgDn::
Send ^!{PgDn}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & Up::
Send ^!{Up}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & Down::
Send ^!{Down}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & Left::
Send ^!{Left}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & Right::
Send ^!{Right}
;Run,"%A_ScriptFullPath%" 1
Return

Tab & PrintScreen::
Send ^!{PrintScreen}
;Run,"%A_ScriptFullPath%" 1
Return

Esc::Esc
Esc & Shift::Esc

Esc & a::
Send ^+{a}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & b::
Send ^+{b}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & c::
Send ^+{c}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & d::
Send ^+{d}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & e::
Send ^+{e}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & f::
Send ^+{f}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & g::
Send ^+{g}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & h::
Send ^+{h}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & i::
Send ^+{i}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & j::
Send ^+{j}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & k::
Send ^+{k}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & l::
Send ^+{l}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & m::
Send ^+{m}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & n::
Send ^+{n}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & o::
Send ^+{o}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & p::
Send ^+{p}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & q::
Send ^+{q}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & r::
Send ^+{r}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & s::
Send ^+{s}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & t::
Send ^+{t}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & u::
Send ^+{u}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & v::
Send ^+{v}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & w::
Send ^+{w}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & x::
Send ^+{x}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & y::
Send ^+{y}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & z::
Send ^+{z}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & 1::
Send ^+{1}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & 2::
Send ^+{2}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & 3::
Send ^+{3}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & 4::
Send ^+{4}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & 5::
Send ^+{5}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & 6::
Send ^+{6}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & 7::
Send ^+{7}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & 8::
Send ^+{8}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & 9::
Send ^+{9}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & 0::
Send ^+{0}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & F1::
Send ^+{F1}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & F2::
Send ^+{F2}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & F3::
Send ^+{F3}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & F4::
Send ^+{F4}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & F5::
Send ^+{F5}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & F6::
Send ^+{F6}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & F7::
Send ^+{F7}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & F8::
Send ^+{F8}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & F9::
Send ^+{F9}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & F10::
Send ^+{F10}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & F11::
Send ^+{F11}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & F12::
Send ^+{F12}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & ,::
Send ^+{,}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & .::
Send ^+{.}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & /::
Send ^+{/}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & '::
Send ^+{'}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & [::
Send ^+{[}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & ]::
Send ^+{]}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & \::
Send ^+{\}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & -::
Send ^+{-}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & =::
Send ^+{=}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & Space::
Send ^+{Space}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & Enter::
Send ^+{Enter}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & Backspace::
Send ^+{Backspace}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & Delete::
Run,%systemroot%\system32\taskmgr.exe
Run,"%A_ScriptFullPath%" 1
Return

Esc & Insert::
Send ^+{Insert}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & Home::
Send ^+{Home}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & End::
Send ^+{End}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & PgUp::
Send ^+{PgUp}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & PgDn::
Send ^+{PgDn}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & Up::
Send ^+{Up}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & Down::
Send ^+{Down}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & Left::
Send ^+{Left}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & Right::
Send ^+{Right}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & PrintScreen::
Send ^+{PrintScreen}
;Run,"%A_ScriptFullPath%" 1
Return

Esc & Tab::
Send ^+{Tab}
;Run,"%A_ScriptFullPath%" 1
Return

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

F1 & a Up::

if fileexist("F1\a.url")
{
Run,"F1\a.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F1\a.lnk")
{
Run,"F1\a.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F1 & b Up::

if fileexist("F1\b.url")
{
Run,"F1\b.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F1\b.lnk")
{
Run,"F1\b.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F1 & c Up::

if fileexist("F1\c.url")
{
Run,"F1\c.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F1\c.lnk")
{
Run,"F1\c.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F1 & d Up::

if fileexist("F1\d.url")
{
Run,"F1\d.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F1\d.lnk")
{
Run,"F1\d.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F1 & e Up::

if fileexist("F1\e.url")
{
Run,"F1\e.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F1\e.lnk")
{
Run,"F1\e.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F1 & f Up::

if fileexist("F1\f.url")
{
Run,"F1\f.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F1\f.lnk")
{
Run,"F1\f.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F1 & g Up::

if fileexist("F1\g.url")
{
Run,"F1\g.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F1\g.lnk")
{
Run,"F1\g.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F1 & h Up::

if fileexist("F1\h.url")
{
Run,"F1\h.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F1\h.lnk")
{
Run,"F1\h.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F1 & i Up::

if fileexist("F1\i.url")
{
Run,"F1\i.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F1\i.lnk")
{
Run,"F1\i.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F1 & j Up::

if fileexist("F1\j.url")
{
Run,"F1\j.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F1\j.lnk")
{
Run,"F1\j.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F1 & k Up::

if fileexist("F1\k.url")
{
Run,"F1\k.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F1\k.lnk")
{
Run,"F1\k.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F1 & l Up::

if fileexist("F1\l.url")
{
Run,"F1\l.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F1\l.lnk")
{
Run,"F1\l.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F1 & m Up::

if fileexist("F1\m.url")
{
Run,"F1\m.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F1\m.lnk")
{
Run,"F1\m.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F1 & n Up::

if fileexist("F1\n.url")
{
Run,"F1\n.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F1\n.lnk")
{
Run,"F1\n.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F1 & o Up::

if fileexist("F1\o.url")
{
Run,"F1\o.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F1\o.lnk")
{
Run,"F1\o.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F1 & p Up::

if fileexist("F1\p.url")
{
Run,"F1\p.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F1\p.lnk")
{
Run,"F1\p.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F1 & q Up::

if fileexist("F1\q.url")
{
Run,"F1\q.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F1\q.lnk")
{
Run,"F1\q.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F1 & r Up::

if fileexist("F1\r.url")
{
Run,"F1\r.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F1\r.lnk")
{
Run,"F1\r.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F1 & s Up::

if fileexist("F1\s.url")
{
Run,"F1\s.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F1\s.lnk")
{
Run,"F1\s.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F1 & t Up::

if fileexist("F1\t.url")
{
Run,"F1\t.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F1\t.lnk")
{
Run,"F1\t.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F1 & u Up::

if fileexist("F1\u.url")
{
Run,"F1\u.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F1\u.lnk")
{
Run,"F1\u.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F1 & v Up::

if fileexist("F1\v.url")
{
Run,"F1\v.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F1\v.lnk")
{
Run,"F1\v.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F1 & w Up::

if fileexist("F1\w.url")
{
Run,"F1\w.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F1\w.lnk")
{
Run,"F1\w.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F1 & x Up::

if fileexist("F1\x.url")
{
Run,"F1\x.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F1\x.lnk")
{
Run,"F1\x.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F1 & y Up::

if fileexist("F1\y.url")
{
Run,"F1\y.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F1\y.lnk")
{
Run,"F1\y.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F1 & z Up::

if fileexist("F1\z.url")
{
Run,"F1\z.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F1\z.lnk")
{
Run,"F1\z.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F1 & 1 Up::

if fileexist("F1\1.url")
{
Run,"F1\1.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F1\1.lnk")
{
Run,"F1\1.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F1 & 2 Up::

if fileexist("F1\2.url")
{
Run,"F1\2.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F1\2.lnk")
{
Run,"F1\2.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F1 & 3 Up::

if fileexist("F1\3.url")
{
Run,"F1\3.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F1\3.lnk")
{
Run,"F1\3.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F1 & 4 Up::

if fileexist("F1\4.url")
{
Run,"F1\4.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F1\4.lnk")
{
Run,"F1\4.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F1 & 5 Up::

if fileexist("F1\5.url")
{
Run,"F1\5.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F1\5.lnk")
{
Run,"F1\5.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F1 & 6 Up::

if fileexist("F1\6.url")
{
Run,"F1\6.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F1\6.lnk")
{
Run,"F1\6.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F1 & 7 Up::

if fileexist("F1\7.url")
{
Run,"F1\7.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F1\7.lnk")
{
Run,"F1\7.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F1 & 8 Up::

if fileexist("F1\8.url")
{
Run,"F1\8.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F1\8.lnk")
{
Run,"F1\8.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F1 & 9 Up::

if fileexist("F1\9.url")
{
Run,"F1\9.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F1\9.lnk")
{
Run,"F1\9.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F1 & 0 Up::

if fileexist("F1\0.url")
{
Run,"F1\0.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F1\0.lnk")
{
Run,"F1\0.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F2 & Enter Up::Run, F2

F2 & a Up::

if fileexist("F2\a.url")
{
Run,"F2\a.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F2\a.lnk")
{
Run,"F2\a.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F2 & b Up::

if fileexist("F2\b.url")
{
Run,"F2\b.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F2\b.lnk")
{
Run,"F2\b.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F2 & c Up::

if fileexist("F2\c.url")
{
Run,"F2\c.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F2\c.lnk")
{
Run,"F2\c.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F2 & d Up::

if fileexist("F2\d.url")
{
Run,"F2\d.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F2\d.lnk")
{
Run,"F2\d.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F2 & e Up::

if fileexist("F2\e.url")
{
Run,"F2\e.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F2\e.lnk")
{
Run,"F2\e.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F2 & f Up::

if fileexist("F2\f.url")
{
Run,"F2\f.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F2\f.lnk")
{
Run,"F2\f.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F2 & g Up::

if fileexist("F2\g.url")
{
Run,"F2\g.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F2\g.lnk")
{
Run,"F2\g.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F2 & h Up::

if fileexist("F2\h.url")
{
Run,"F2\h.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F2\h.lnk")
{
Run,"F2\h.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F2 & i Up::

if fileexist("F2\i.url")
{
Run,"F2\i.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F2\i.lnk")
{
Run,"F2\i.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F2 & j Up::

if fileexist("F2\j.url")
{
Run,"F2\j.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F2\j.lnk")
{
Run,"F2\j.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F2 & k Up::

if fileexist("F2\k.url")
{
Run,"F2\k.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F2\k.lnk")
{
Run,"F2\k.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F2 & l Up::

if fileexist("F2\l.url")
{
Run,"F2\l.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F2\l.lnk")
{
Run,"F2\l.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F2 & m Up::

if fileexist("F2\m.url")
{
Run,"F2\m.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F2\m.lnk")
{
Run,"F2\m.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F2 & n Up::

if fileexist("F2\n.url")
{
Run,"F2\n.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F2\n.lnk")
{
Run,"F2\n.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F2 & o Up::

if fileexist("F2\o.url")
{
Run,"F2\o.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F2\o.lnk")
{
Run,"F2\o.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F2 & p Up::

if fileexist("F2\p.url")
{
Run,"F2\p.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F2\p.lnk")
{
Run,"F2\p.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F2 & q Up::

if fileexist("F2\q.url")
{
Run,"F2\q.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F2\q.lnk")
{
Run,"F2\q.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F2 & r Up::

if fileexist("F2\r.url")
{
Run,"F2\r.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F2\r.lnk")
{
Run,"F2\r.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F2 & s Up::

if fileexist("F2\s.url")
{
Run,"F2\s.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F2\s.lnk")
{
Run,"F2\s.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F2 & t Up::

if fileexist("F2\t.url")
{
Run,"F2\t.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F2\t.lnk")
{
Run,"F2\t.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F2 & u Up::

if fileexist("F2\u.url")
{
Run,"F2\u.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F2\u.lnk")
{
Run,"F2\u.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F2 & v Up::

if fileexist("F2\v.url")
{
Run,"F2\v.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F2\v.lnk")
{
Run,"F2\v.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F2 & w Up::

if fileexist("F2\w.url")
{
Run,"F2\w.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F2\w.lnk")
{
Run,"F2\w.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F2 & x Up::

if fileexist("F2\x.url")
{
Run,"F2\x.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F2\x.lnk")
{
Run,"F2\x.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F2 & y Up::

if fileexist("F2\y.url")
{
Run,"F2\y.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F2\y.lnk")
{
Run,"F2\y.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F2 & z Up::

if fileexist("F2\z.url")
{
Run,"F2\z.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F2\z.lnk")
{
Run,"F2\z.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F2 & 1 Up::

if fileexist("F2\1.url")
{
Run,"F2\1.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F2\1.lnk")
{
Run,"F2\1.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F2 & 2 Up::

if fileexist("F2\2.url")
{
Run,"F2\2.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F2\2.lnk")
{
Run,"F2\2.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F2 & 3 Up::

if fileexist("F2\3.url")
{
Run,"F2\3.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F2\3.lnk")
{
Run,"F2\3.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F2 & 4 Up::

if fileexist("F2\4.url")
{
Run,"F2\4.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F2\4.lnk")
{
Run,"F2\4.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F2 & 5 Up::

if fileexist("F2\5.url")
{
Run,"F2\5.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F2\5.lnk")
{
Run,"F2\5.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F2 & 6 Up::

if fileexist("F2\6.url")
{
Run,"F2\6.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F2\6.lnk")
{
Run,"F2\6.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F2 & 7 Up::

if fileexist("F2\7.url")
{
Run,"F2\7.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F2\7.lnk")
{
Run,"F2\7.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F2 & 8 Up::

if fileexist("F2\8.url")
{
Run,"F2\8.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F2\8.lnk")
{
Run,"F2\8.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F2 & 9 Up::

if fileexist("F2\9.url")
{
Run,"F2\9.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F2\9.lnk")
{
Run,"F2\9.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F2 & 0 Up::

if fileexist("F2\0.url")
{
Run,"F2\0.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F2\0.lnk")
{
Run,"F2\0.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F3 & Enter Up::Run, F3

F3 & a Up::

if fileexist("F3\a.url")
{
Run,"F3\a.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F3\a.lnk")
{
Run,"F3\a.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F3 & b Up::

if fileexist("F3\b.url")
{
Run,"F3\b.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F3\b.lnk")
{
Run,"F3\b.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F3 & c Up::

if fileexist("F3\c.url")
{
Run,"F3\c.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F3\c.lnk")
{
Run,"F3\c.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F3 & d Up::

if fileexist("F3\d.url")
{
Run,"F3\d.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F3\d.lnk")
{
Run,"F3\d.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F3 & e Up::

if fileexist("F3\e.url")
{
Run,"F3\e.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F3\e.lnk")
{
Run,"F3\e.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F3 & f Up::

if fileexist("F3\f.url")
{
Run,"F3\f.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F3\f.lnk")
{
Run,"F3\f.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F3 & g Up::

if fileexist("F3\g.url")
{
Run,"F3\g.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F3\g.lnk")
{
Run,"F3\g.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F3 & h Up::

if fileexist("F3\h.url")
{
Run,"F3\h.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F3\h.lnk")
{
Run,"F3\h.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F3 & i Up::

if fileexist("F3\i.url")
{
Run,"F3\i.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F3\i.lnk")
{
Run,"F3\i.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F3 & j Up::

if fileexist("F3\j.url")
{
Run,"F3\j.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F3\j.lnk")
{
Run,"F3\j.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F3 & k Up::

if fileexist("F3\k.url")
{
Run,"F3\k.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F3\k.lnk")
{
Run,"F3\k.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F3 & l Up::

if fileexist("F3\l.url")
{
Run,"F3\l.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F3\l.lnk")
{
Run,"F3\l.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F3 & m Up::

if fileexist("F3\m.url")
{
Run,"F3\m.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F3\m.lnk")
{
Run,"F3\m.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F3 & n Up::

if fileexist("F3\n.url")
{
Run,"F3\n.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F3\n.lnk")
{
Run,"F3\n.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F3 & o Up::

if fileexist("F3\o.url")
{
Run,"F3\o.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F3\o.lnk")
{
Run,"F3\o.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F3 & p Up::

if fileexist("F3\p.url")
{
Run,"F3\p.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F3\p.lnk")
{
Run,"F3\p.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F3 & q Up::

if fileexist("F3\q.url")
{
Run,"F3\q.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F3\q.lnk")
{
Run,"F3\q.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F3 & r Up::

if fileexist("F3\r.url")
{
Run,"F3\r.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F3\r.lnk")
{
Run,"F3\r.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F3 & s Up::

if fileexist("F3\s.url")
{
Run,"F3\s.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F3\s.lnk")
{
Run,"F3\s.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F3 & t Up::

if fileexist("F3\t.url")
{
Run,"F3\t.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F3\t.lnk")
{
Run,"F3\t.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F3 & u Up::

if fileexist("F3\u.url")
{
Run,"F3\u.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F3\u.lnk")
{
Run,"F3\u.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F3 & v Up::

if fileexist("F3\v.url")
{
Run,"F3\v.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F3\v.lnk")
{
Run,"F3\v.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F3 & w Up::

if fileexist("F3\w.url")
{
Run,"F3\w.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F3\w.lnk")
{
Run,"F3\w.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F3 & x Up::

if fileexist("F3\x.url")
{
Run,"F3\x.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F3\x.lnk")
{
Run,"F3\x.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F3 & y Up::

if fileexist("F3\y.url")
{
Run,"F3\y.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F3\y.lnk")
{
Run,"F3\y.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F3 & z Up::

if fileexist("F3\z.url")
{
Run,"F3\z.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F3\z.lnk")
{
Run,"F3\z.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F3 & 1 Up::

if fileexist("F3\1.url")
{
Run,"F3\1.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F3\1.lnk")
{
Run,"F3\1.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F3 & 2 Up::

if fileexist("F3\2.url")
{
Run,"F3\2.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F3\2.lnk")
{
Run,"F3\2.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F3 & 3 Up::

if fileexist("F3\3.url")
{
Run,"F3\3.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F3\3.lnk")
{
Run,"F3\3.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F3 & 4 Up::

if fileexist("F3\4.url")
{
Run,"F3\4.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F3\4.lnk")
{
Run,"F3\4.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F3 & 5 Up::

if fileexist("F3\5.url")
{
Run,"F3\5.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F3\5.lnk")
{
Run,"F3\5.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F3 & 6 Up::

if fileexist("F3\6.url")
{
Run,"F3\6.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F3\6.lnk")
{
Run,"F3\6.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F3 & 7 Up::

if fileexist("F3\7.url")
{
Run,"F3\7.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F3\7.lnk")
{
Run,"F3\7.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F3 & 8 Up::

if fileexist("F3\8.url")
{
Run,"F3\8.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F3\8.lnk")
{
Run,"F3\8.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F3 & 9 Up::

if fileexist("F3\9.url")
{
Run,"F3\9.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F3\9.lnk")
{
Run,"F3\9.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F3 & 0 Up::

if fileexist("F3\0.url")
{
Run,"F3\0.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F3\0.lnk")
{
Run,"F3\0.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F4 & Enter Up::Run, F4

F4 & a Up::

if fileexist("F4\a.url")
{
Run,"F4\a.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F4\a.lnk")
{
Run,"F4\a.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F4 & b Up::

if fileexist("F4\b.url")
{
Run,"F4\b.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F4\b.lnk")
{
Run,"F4\b.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F4 & c Up::

if fileexist("F4\c.url")
{
Run,"F4\c.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F4\c.lnk")
{
Run,"F4\c.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F4 & d Up::

if fileexist("F4\d.url")
{
Run,"F4\d.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F4\d.lnk")
{
Run,"F4\d.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F4 & e Up::

if fileexist("F4\e.url")
{
Run,"F4\e.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F4\e.lnk")
{
Run,"F4\e.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F4 & f Up::

if fileexist("F4\f.url")
{
Run,"F4\f.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F4\f.lnk")
{
Run,"F4\f.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F4 & g Up::

if fileexist("F4\g.url")
{
Run,"F4\g.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F4\g.lnk")
{
Run,"F4\g.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F4 & h Up::

if fileexist("F4\h.url")
{
Run,"F4\h.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F4\h.lnk")
{
Run,"F4\h.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F4 & i Up::

if fileexist("F4\i.url")
{
Run,"F4\i.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F4\i.lnk")
{
Run,"F4\i.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F4 & j Up::

if fileexist("F4\j.url")
{
Run,"F4\j.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F4\j.lnk")
{
Run,"F4\j.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F4 & k Up::

if fileexist("F4\k.url")
{
Run,"F4\k.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F4\k.lnk")
{
Run,"F4\k.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F4 & l Up::

if fileexist("F4\l.url")
{
Run,"F4\l.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F4\l.lnk")
{
Run,"F4\l.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F4 & m Up::

if fileexist("F4\m.url")
{
Run,"F4\m.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F4\m.lnk")
{
Run,"F4\m.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F4 & n Up::

if fileexist("F4\n.url")
{
Run,"F4\n.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F4\n.lnk")
{
Run,"F4\n.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F4 & o Up::

if fileexist("F4\o.url")
{
Run,"F4\o.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F4\o.lnk")
{
Run,"F4\o.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F4 & p Up::

if fileexist("F4\p.url")
{
Run,"F4\p.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F4\p.lnk")
{
Run,"F4\p.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F4 & q Up::

if fileexist("F4\q.url")
{
Run,"F4\q.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F4\q.lnk")
{
Run,"F4\q.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F4 & r Up::

if fileexist("F4\r.url")
{
Run,"F4\r.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F4\r.lnk")
{
Run,"F4\r.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F4 & s Up::

if fileexist("F4\s.url")
{
Run,"F4\s.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F4\s.lnk")
{
Run,"F4\s.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F4 & t Up::

if fileexist("F4\t.url")
{
Run,"F4\t.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F4\t.lnk")
{
Run,"F4\t.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F4 & u Up::

if fileexist("F4\u.url")
{
Run,"F4\u.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F4\u.lnk")
{
Run,"F4\u.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F4 & v Up::

if fileexist("F4\v.url")
{
Run,"F4\v.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F4\v.lnk")
{
Run,"F4\v.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F4 & w Up::

if fileexist("F4\w.url")
{
Run,"F4\w.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F4\w.lnk")
{
Run,"F4\w.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F4 & x Up::

if fileexist("F4\x.url")
{
Run,"F4\x.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F4\x.lnk")
{
Run,"F4\x.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F4 & y Up::

if fileexist("F4\y.url")
{
Run,"F4\y.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F4\y.lnk")
{
Run,"F4\y.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F4 & z Up::

if fileexist("F4\z.url")
{
Run,"F4\z.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F4\z.lnk")
{
Run,"F4\z.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F4 & 1 Up::

if fileexist("F4\1.url")
{
Run,"F4\1.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F4\1.lnk")
{
Run,"F4\1.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F4 & 2 Up::

if fileexist("F4\2.url")
{
Run,"F4\2.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F4\2.lnk")
{
Run,"F4\2.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F4 & 3 Up::

if fileexist("F4\3.url")
{
Run,"F4\3.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F4\3.lnk")
{
Run,"F4\3.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F4 & 4 Up::

if fileexist("F4\4.url")
{
Run,"F4\4.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F4\4.lnk")
{
Run,"F4\4.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F4 & 5 Up::

if fileexist("F4\5.url")
{
Run,"F4\5.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F4\5.lnk")
{
Run,"F4\5.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F4 & 6 Up::

if fileexist("F4\6.url")
{
Run,"F4\6.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F4\6.lnk")
{
Run,"F4\6.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F4 & 7 Up::

if fileexist("F4\7.url")
{
Run,"F4\7.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F4\7.lnk")
{
Run,"F4\7.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F4 & 8 Up::

if fileexist("F4\8.url")
{
Run,"F4\8.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F4\8.lnk")
{
Run,"F4\8.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F4 & 9 Up::

if fileexist("F4\9.url")
{
Run,"F4\9.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F4\9.lnk")
{
Run,"F4\9.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F4 & 0 Up::

if fileexist("F4\0.url")
{
Run,"F4\0.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F4\0.lnk")
{
Run,"F4\0.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F5 & Enter Up::Run, F5

F5 & a Up::

if fileexist("F5\a.url")
{
Run,"F5\a.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F5\a.lnk")
{
Run,"F5\a.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F5 & b Up::

if fileexist("F5\b.url")
{
Run,"F5\b.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F5\b.lnk")
{
Run,"F5\b.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F5 & c Up::

if fileexist("F5\c.url")
{
Run,"F5\c.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F5\c.lnk")
{
Run,"F5\c.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F5 & d Up::

if fileexist("F5\d.url")
{
Run,"F5\d.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F5\d.lnk")
{
Run,"F5\d.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F5 & e Up::

if fileexist("F5\e.url")
{
Run,"F5\e.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F5\e.lnk")
{
Run,"F5\e.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F5 & f Up::

if fileexist("F5\f.url")
{
Run,"F5\f.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F5\f.lnk")
{
Run,"F5\f.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F5 & g Up::

if fileexist("F5\g.url")
{
Run,"F5\g.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F5\g.lnk")
{
Run,"F5\g.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F5 & h Up::

if fileexist("F5\h.url")
{
Run,"F5\h.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F5\h.lnk")
{
Run,"F5\h.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F5 & i Up::

if fileexist("F5\i.url")
{
Run,"F5\i.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F5\i.lnk")
{
Run,"F5\i.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F5 & j Up::

if fileexist("F5\j.url")
{
Run,"F5\j.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F5\j.lnk")
{
Run,"F5\j.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F5 & k Up::

if fileexist("F5\k.url")
{
Run,"F5\k.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F5\k.lnk")
{
Run,"F5\k.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F5 & l Up::

if fileexist("F5\l.url")
{
Run,"F5\l.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F5\l.lnk")
{
Run,"F5\l.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F5 & m Up::

if fileexist("F5\m.url")
{
Run,"F5\m.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F5\m.lnk")
{
Run,"F5\m.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F5 & n Up::

if fileexist("F5\n.url")
{
Run,"F5\n.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F5\n.lnk")
{
Run,"F5\n.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F5 & o Up::

if fileexist("F5\o.url")
{
Run,"F5\o.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F5\o.lnk")
{
Run,"F5\o.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F5 & p Up::

if fileexist("F5\p.url")
{
Run,"F5\p.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F5\p.lnk")
{
Run,"F5\p.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F5 & q Up::

if fileexist("F5\q.url")
{
Run,"F5\q.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F5\q.lnk")
{
Run,"F5\q.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F5 & r Up::

if fileexist("F5\r.url")
{
Run,"F5\r.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F5\r.lnk")
{
Run,"F5\r.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F5 & s Up::

if fileexist("F5\s.url")
{
Run,"F5\s.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F5\s.lnk")
{
Run,"F5\s.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F5 & t Up::

if fileexist("F5\t.url")
{
Run,"F5\t.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F5\t.lnk")
{
Run,"F5\t.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F5 & u Up::

if fileexist("F5\u.url")
{
Run,"F5\u.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F5\u.lnk")
{
Run,"F5\u.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F5 & v Up::

if fileexist("F5\v.url")
{
Run,"F5\v.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F5\v.lnk")
{
Run,"F5\v.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F5 & w Up::

if fileexist("F5\w.url")
{
Run,"F5\w.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F5\w.lnk")
{
Run,"F5\w.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F5 & x Up::

if fileexist("F5\x.url")
{
Run,"F5\x.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F5\x.lnk")
{
Run,"F5\x.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F5 & y Up::

if fileexist("F5\y.url")
{
Run,"F5\y.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F5\y.lnk")
{
Run,"F5\y.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F5 & z Up::

if fileexist("F5\z.url")
{
Run,"F5\z.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F5\z.lnk")
{
Run,"F5\z.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F5 & 1 Up::

if fileexist("F5\1.url")
{
Run,"F5\1.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F5\1.lnk")
{
Run,"F5\1.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F5 & 2 Up::

if fileexist("F5\2.url")
{
Run,"F5\2.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F5\2.lnk")
{
Run,"F5\2.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F5 & 3 Up::

if fileexist("F5\3.url")
{
Run,"F5\3.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F5\3.lnk")
{
Run,"F5\3.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F5 & 4 Up::

if fileexist("F5\4.url")
{
Run,"F5\4.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F5\4.lnk")
{
Run,"F5\4.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F5 & 5 Up::

if fileexist("F5\5.url")
{
Run,"F5\5.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F5\5.lnk")
{
Run,"F5\5.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F5 & 6 Up::

if fileexist("F5\6.url")
{
Run,"F5\6.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F5\6.lnk")
{
Run,"F5\6.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F5 & 7 Up::

if fileexist("F5\7.url")
{
Run,"F5\7.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F5\7.lnk")
{
Run,"F5\7.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F5 & 8 Up::

if fileexist("F5\8.url")
{
Run,"F5\8.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F5\8.lnk")
{
Run,"F5\8.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F5 & 9 Up::

if fileexist("F5\9.url")
{
Run,"F5\9.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F5\9.lnk")
{
Run,"F5\9.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F5 & 0 Up::

if fileexist("F5\0.url")
{
Run,"F5\0.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F5\0.lnk")
{
Run,"F5\0.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F6 & Enter Up::Run, F6

F6 & a Up::

if fileexist("F6\a.url")
{
Run,"F6\a.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F6\a.lnk")
{
Run,"F6\a.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F6 & b Up::

if fileexist("F6\b.url")
{
Run,"F6\b.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F6\b.lnk")
{
Run,"F6\b.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F6 & c Up::

if fileexist("F6\c.url")
{
Run,"F6\c.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F6\c.lnk")
{
Run,"F6\c.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F6 & d Up::

if fileexist("F6\d.url")
{
Run,"F6\d.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F6\d.lnk")
{
Run,"F6\d.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F6 & e Up::

if fileexist("F6\e.url")
{
Run,"F6\e.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F6\e.lnk")
{
Run,"F6\e.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F6 & f Up::

if fileexist("F6\f.url")
{
Run,"F6\f.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F6\f.lnk")
{
Run,"F6\f.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F6 & g Up::

if fileexist("F6\g.url")
{
Run,"F6\g.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F6\g.lnk")
{
Run,"F6\g.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F6 & h Up::

if fileexist("F6\h.url")
{
Run,"F6\h.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F6\h.lnk")
{
Run,"F6\h.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F6 & i Up::

if fileexist("F6\i.url")
{
Run,"F6\i.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F6\i.lnk")
{
Run,"F6\i.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F6 & j Up::

if fileexist("F6\j.url")
{
Run,"F6\j.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F6\j.lnk")
{
Run,"F6\j.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F6 & k Up::

if fileexist("F6\k.url")
{
Run,"F6\k.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F6\k.lnk")
{
Run,"F6\k.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F6 & l Up::

if fileexist("F6\l.url")
{
Run,"F6\l.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F6\l.lnk")
{
Run,"F6\l.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F6 & m Up::

if fileexist("F6\m.url")
{
Run,"F6\m.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F6\m.lnk")
{
Run,"F6\m.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F6 & n Up::

if fileexist("F6\n.url")
{
Run,"F6\n.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F6\n.lnk")
{
Run,"F6\n.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F6 & o Up::

if fileexist("F6\o.url")
{
Run,"F6\o.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F6\o.lnk")
{
Run,"F6\o.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F6 & p Up::

if fileexist("F6\p.url")
{
Run,"F6\p.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F6\p.lnk")
{
Run,"F6\p.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F6 & q Up::

if fileexist("F6\q.url")
{
Run,"F6\q.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F6\q.lnk")
{
Run,"F6\q.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F6 & r Up::

if fileexist("F6\r.url")
{
Run,"F6\r.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F6\r.lnk")
{
Run,"F6\r.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F6 & s Up::

if fileexist("F6\s.url")
{
Run,"F6\s.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F6\s.lnk")
{
Run,"F6\s.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F6 & t Up::

if fileexist("F6\t.url")
{
Run,"F6\t.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F6\t.lnk")
{
Run,"F6\t.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F6 & u Up::

if fileexist("F6\u.url")
{
Run,"F6\u.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F6\u.lnk")
{
Run,"F6\u.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F6 & v Up::

if fileexist("F6\v.url")
{
Run,"F6\v.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F6\v.lnk")
{
Run,"F6\v.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F6 & w Up::

if fileexist("F6\w.url")
{
Run,"F6\w.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F6\w.lnk")
{
Run,"F6\w.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F6 & x Up::

if fileexist("F6\x.url")
{
Run,"F6\x.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F6\x.lnk")
{
Run,"F6\x.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F6 & y Up::

if fileexist("F6\y.url")
{
Run,"F6\y.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F6\y.lnk")
{
Run,"F6\y.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F6 & z Up::

if fileexist("F6\z.url")
{
Run,"F6\z.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F6\z.lnk")
{
Run,"F6\z.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F6 & 1 Up::

if fileexist("F6\1.url")
{
Run,"F6\1.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F6\1.lnk")
{
Run,"F6\1.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F6 & 2 Up::

if fileexist("F6\2.url")
{
Run,"F6\2.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F6\2.lnk")
{
Run,"F6\2.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F6 & 3 Up::

if fileexist("F6\3.url")
{
Run,"F6\3.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F6\3.lnk")
{
Run,"F6\3.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F6 & 4 Up::

if fileexist("F6\4.url")
{
Run,"F6\4.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F6\4.lnk")
{
Run,"F6\4.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F6 & 5 Up::

if fileexist("F6\5.url")
{
Run,"F6\5.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F6\5.lnk")
{
Run,"F6\5.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F6 & 6 Up::

if fileexist("F6\6.url")
{
Run,"F6\6.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F6\6.lnk")
{
Run,"F6\6.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F6 & 7 Up::

if fileexist("F6\7.url")
{
Run,"F6\7.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F6\7.lnk")
{
Run,"F6\7.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F6 & 8 Up::

if fileexist("F6\8.url")
{
Run,"F6\8.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F6\8.lnk")
{
Run,"F6\8.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F6 & 9 Up::

if fileexist("F6\9.url")
{
Run,"F6\9.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F6\9.lnk")
{
Run,"F6\9.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F6 & 0 Up::

if fileexist("F6\0.url")
{
Run,"F6\0.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F6\0.lnk")
{
Run,"F6\0.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F7 & Enter Up::Run, F7

F7 & a Up::

if fileexist("F7\a.url")
{
Run,"F7\a.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F7\a.lnk")
{
Run,"F7\a.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F7 & b Up::

if fileexist("F7\b.url")
{
Run,"F7\b.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F7\b.lnk")
{
Run,"F7\b.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F7 & c Up::

if fileexist("F7\c.url")
{
Run,"F7\c.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F7\c.lnk")
{
Run,"F7\c.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F7 & d Up::

if fileexist("F7\d.url")
{
Run,"F7\d.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F7\d.lnk")
{
Run,"F7\d.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F7 & e Up::

if fileexist("F7\e.url")
{
Run,"F7\e.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F7\e.lnk")
{
Run,"F7\e.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F7 & f Up::

if fileexist("F7\f.url")
{
Run,"F7\f.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F7\f.lnk")
{
Run,"F7\f.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F7 & g Up::

if fileexist("F7\g.url")
{
Run,"F7\g.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F7\g.lnk")
{
Run,"F7\g.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F7 & h Up::

if fileexist("F7\h.url")
{
Run,"F7\h.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F7\h.lnk")
{
Run,"F7\h.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F7 & i Up::

if fileexist("F7\i.url")
{
Run,"F7\i.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F7\i.lnk")
{
Run,"F7\i.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F7 & j Up::

if fileexist("F7\j.url")
{
Run,"F7\j.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F7\j.lnk")
{
Run,"F7\j.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F7 & k Up::

if fileexist("F7\k.url")
{
Run,"F7\k.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F7\k.lnk")
{
Run,"F7\k.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F7 & l Up::

if fileexist("F7\l.url")
{
Run,"F7\l.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F7\l.lnk")
{
Run,"F7\l.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F7 & m Up::

if fileexist("F7\m.url")
{
Run,"F7\m.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F7\m.lnk")
{
Run,"F7\m.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F7 & n Up::

if fileexist("F7\n.url")
{
Run,"F7\n.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F7\n.lnk")
{
Run,"F7\n.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F7 & o Up::

if fileexist("F7\o.url")
{
Run,"F7\o.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F7\o.lnk")
{
Run,"F7\o.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F7 & p Up::

if fileexist("F7\p.url")
{
Run,"F7\p.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F7\p.lnk")
{
Run,"F7\p.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F7 & q Up::

if fileexist("F7\q.url")
{
Run,"F7\q.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F7\q.lnk")
{
Run,"F7\q.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F7 & r Up::

if fileexist("F7\r.url")
{
Run,"F7\r.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F7\r.lnk")
{
Run,"F7\r.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F7 & s Up::

if fileexist("F7\s.url")
{
Run,"F7\s.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F7\s.lnk")
{
Run,"F7\s.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F7 & t Up::

if fileexist("F7\t.url")
{
Run,"F7\t.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F7\t.lnk")
{
Run,"F7\t.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F7 & u Up::

if fileexist("F7\u.url")
{
Run,"F7\u.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F7\u.lnk")
{
Run,"F7\u.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F7 & v Up::

if fileexist("F7\v.url")
{
Run,"F7\v.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F7\v.lnk")
{
Run,"F7\v.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F7 & w Up::

if fileexist("F7\w.url")
{
Run,"F7\w.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F7\w.lnk")
{
Run,"F7\w.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F7 & x Up::

if fileexist("F7\x.url")
{
Run,"F7\x.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F7\x.lnk")
{
Run,"F7\x.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F7 & y Up::

if fileexist("F7\y.url")
{
Run,"F7\y.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F7\y.lnk")
{
Run,"F7\y.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F7 & z Up::

if fileexist("F7\z.url")
{
Run,"F7\z.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F7\z.lnk")
{
Run,"F7\z.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F7 & 1 Up::

if fileexist("F7\1.url")
{
Run,"F7\1.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F7\1.lnk")
{
Run,"F7\1.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F7 & 2 Up::

if fileexist("F7\2.url")
{
Run,"F7\2.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F7\2.lnk")
{
Run,"F7\2.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F7 & 3 Up::

if fileexist("F7\3.url")
{
Run,"F7\3.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F7\3.lnk")
{
Run,"F7\3.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F7 & 4 Up::

if fileexist("F7\4.url")
{
Run,"F7\4.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F7\4.lnk")
{
Run,"F7\4.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F7 & 5 Up::

if fileexist("F7\5.url")
{
Run,"F7\5.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F7\5.lnk")
{
Run,"F7\5.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F7 & 6 Up::

if fileexist("F7\6.url")
{
Run,"F7\6.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F7\6.lnk")
{
Run,"F7\6.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F7 & 7 Up::

if fileexist("F7\7.url")
{
Run,"F7\7.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F7\7.lnk")
{
Run,"F7\7.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F7 & 8 Up::

if fileexist("F7\8.url")
{
Run,"F7\8.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F7\8.lnk")
{
Run,"F7\8.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F7 & 9 Up::

if fileexist("F7\9.url")
{
Run,"F7\9.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F7\9.lnk")
{
Run,"F7\9.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F7 & 0 Up::

if fileexist("F7\0.url")
{
Run,"F7\0.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F7\0.lnk")
{
Run,"F7\0.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F8 & Enter Up::Run, F8

F8 & a Up::

if fileexist("F8\a.url")
{
Run,"F8\a.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F8\a.lnk")
{
Run,"F8\a.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F8 & b Up::

if fileexist("F8\b.url")
{
Run,"F8\b.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F8\b.lnk")
{
Run,"F8\b.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F8 & c Up::

if fileexist("F8\c.url")
{
Run,"F8\c.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F8\c.lnk")
{
Run,"F8\c.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F8 & d Up::

if fileexist("F8\d.url")
{
Run,"F8\d.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F8\d.lnk")
{
Run,"F8\d.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F8 & e Up::

if fileexist("F8\e.url")
{
Run,"F8\e.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F8\e.lnk")
{
Run,"F8\e.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F8 & f Up::

if fileexist("F8\f.url")
{
Run,"F8\f.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F8\f.lnk")
{
Run,"F8\f.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F8 & g Up::

if fileexist("F8\g.url")
{
Run,"F8\g.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F8\g.lnk")
{
Run,"F8\g.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F8 & h Up::

if fileexist("F8\h.url")
{
Run,"F8\h.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F8\h.lnk")
{
Run,"F8\h.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F8 & i Up::

if fileexist("F8\i.url")
{
Run,"F8\i.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F8\i.lnk")
{
Run,"F8\i.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F8 & j Up::

if fileexist("F8\j.url")
{
Run,"F8\j.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F8\j.lnk")
{
Run,"F8\j.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F8 & k Up::

if fileexist("F8\k.url")
{
Run,"F8\k.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F8\k.lnk")
{
Run,"F8\k.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F8 & l Up::

if fileexist("F8\l.url")
{
Run,"F8\l.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F8\l.lnk")
{
Run,"F8\l.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F8 & m Up::

if fileexist("F8\m.url")
{
Run,"F8\m.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F8\m.lnk")
{
Run,"F8\m.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F8 & n Up::

if fileexist("F8\n.url")
{
Run,"F8\n.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F8\n.lnk")
{
Run,"F8\n.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F8 & o Up::

if fileexist("F8\o.url")
{
Run,"F8\o.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F8\o.lnk")
{
Run,"F8\o.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F8 & p Up::

if fileexist("F8\p.url")
{
Run,"F8\p.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F8\p.lnk")
{
Run,"F8\p.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F8 & q Up::

if fileexist("F8\q.url")
{
Run,"F8\q.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F8\q.lnk")
{
Run,"F8\q.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F8 & r Up::

if fileexist("F8\r.url")
{
Run,"F8\r.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F8\r.lnk")
{
Run,"F8\r.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F8 & s Up::

if fileexist("F8\s.url")
{
Run,"F8\s.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F8\s.lnk")
{
Run,"F8\s.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F8 & t Up::

if fileexist("F8\t.url")
{
Run,"F8\t.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F8\t.lnk")
{
Run,"F8\t.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F8 & u Up::

if fileexist("F8\u.url")
{
Run,"F8\u.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F8\u.lnk")
{
Run,"F8\u.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F8 & v Up::

if fileexist("F8\v.url")
{
Run,"F8\v.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F8\v.lnk")
{
Run,"F8\v.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F8 & w Up::

if fileexist("F8\w.url")
{
Run,"F8\w.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F8\w.lnk")
{
Run,"F8\w.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F8 & x Up::

if fileexist("F8\x.url")
{
Run,"F8\x.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F8\x.lnk")
{
Run,"F8\x.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F8 & y Up::

if fileexist("F8\y.url")
{
Run,"F8\y.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F8\y.lnk")
{
Run,"F8\y.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F8 & z Up::

if fileexist("F8\z.url")
{
Run,"F8\z.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F8\z.lnk")
{
Run,"F8\z.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F8 & 1 Up::

if fileexist("F8\1.url")
{
Run,"F8\1.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F8\1.lnk")
{
Run,"F8\1.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F8 & 2 Up::

if fileexist("F8\2.url")
{
Run,"F8\2.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F8\2.lnk")
{
Run,"F8\2.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F8 & 3 Up::

if fileexist("F8\3.url")
{
Run,"F8\3.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F8\3.lnk")
{
Run,"F8\3.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F8 & 4 Up::

if fileexist("F8\4.url")
{
Run,"F8\4.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F8\4.lnk")
{
Run,"F8\4.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F8 & 5 Up::

if fileexist("F8\5.url")
{
Run,"F8\5.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F8\5.lnk")
{
Run,"F8\5.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F8 & 6 Up::

if fileexist("F8\6.url")
{
Run,"F8\6.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F8\6.lnk")
{
Run,"F8\6.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F8 & 7 Up::

if fileexist("F8\7.url")
{
Run,"F8\7.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F8\7.lnk")
{
Run,"F8\7.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F8 & 8 Up::

if fileexist("F8\8.url")
{
Run,"F8\8.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F8\8.lnk")
{
Run,"F8\8.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F8 & 9 Up::

if fileexist("F8\9.url")
{
Run,"F8\9.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F8\9.lnk")
{
Run,"F8\9.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F8 & 0 Up::

if fileexist("F8\0.url")
{
Run,"F8\0.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F8\0.lnk")
{
Run,"F8\0.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F9 & Enter Up::Run, F9

F9 & a Up::

if fileexist("F9\a.url")
{
Run,"F9\a.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F9\a.lnk")
{
Run,"F9\a.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F9 & b Up::

if fileexist("F9\b.url")
{
Run,"F9\b.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F9\b.lnk")
{
Run,"F9\b.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F9 & c Up::

if fileexist("F9\c.url")
{
Run,"F9\c.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F9\c.lnk")
{
Run,"F9\c.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F9 & d Up::

if fileexist("F9\d.url")
{
Run,"F9\d.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F9\d.lnk")
{
Run,"F9\d.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F9 & e Up::

if fileexist("F9\e.url")
{
Run,"F9\e.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F9\e.lnk")
{
Run,"F9\e.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F9 & f Up::

if fileexist("F9\f.url")
{
Run,"F9\f.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F9\f.lnk")
{
Run,"F9\f.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F9 & g Up::

if fileexist("F9\g.url")
{
Run,"F9\g.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F9\g.lnk")
{
Run,"F9\g.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F9 & h Up::

if fileexist("F9\h.url")
{
Run,"F9\h.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F9\h.lnk")
{
Run,"F9\h.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F9 & i Up::

if fileexist("F9\i.url")
{
Run,"F9\i.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F9\i.lnk")
{
Run,"F9\i.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F9 & j Up::

if fileexist("F9\j.url")
{
Run,"F9\j.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F9\j.lnk")
{
Run,"F9\j.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F9 & k Up::

if fileexist("F9\k.url")
{
Run,"F9\k.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F9\k.lnk")
{
Run,"F9\k.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F9 & l Up::

if fileexist("F9\l.url")
{
Run,"F9\l.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F9\l.lnk")
{
Run,"F9\l.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F9 & m Up::

if fileexist("F9\m.url")
{
Run,"F9\m.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F9\m.lnk")
{
Run,"F9\m.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F9 & n Up::

if fileexist("F9\n.url")
{
Run,"F9\n.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F9\n.lnk")
{
Run,"F9\n.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F9 & o Up::

if fileexist("F9\o.url")
{
Run,"F9\o.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F9\o.lnk")
{
Run,"F9\o.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F9 & p Up::

if fileexist("F9\p.url")
{
Run,"F9\p.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F9\p.lnk")
{
Run,"F9\p.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F9 & q Up::

if fileexist("F9\q.url")
{
Run,"F9\q.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F9\q.lnk")
{
Run,"F9\q.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F9 & r Up::

if fileexist("F9\r.url")
{
Run,"F9\r.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F9\r.lnk")
{
Run,"F9\r.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F9 & s Up::

if fileexist("F9\s.url")
{
Run,"F9\s.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F9\s.lnk")
{
Run,"F9\s.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F9 & t Up::

if fileexist("F9\t.url")
{
Run,"F9\t.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F9\t.lnk")
{
Run,"F9\t.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F9 & u Up::

if fileexist("F9\u.url")
{
Run,"F9\u.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F9\u.lnk")
{
Run,"F9\u.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F9 & v Up::

if fileexist("F9\v.url")
{
Run,"F9\v.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F9\v.lnk")
{
Run,"F9\v.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F9 & w Up::

if fileexist("F9\w.url")
{
Run,"F9\w.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F9\w.lnk")
{
Run,"F9\w.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F9 & x Up::

if fileexist("F9\x.url")
{
Run,"F9\x.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F9\x.lnk")
{
Run,"F9\x.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F9 & y Up::

if fileexist("F9\y.url")
{
Run,"F9\y.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F9\y.lnk")
{
Run,"F9\y.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F9 & z Up::

if fileexist("F9\z.url")
{
Run,"F9\z.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F9\z.lnk")
{
Run,"F9\z.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F9 & 1 Up::

if fileexist("F9\1.url")
{
Run,"F9\1.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F9\1.lnk")
{
Run,"F9\1.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F9 & 2 Up::

if fileexist("F9\2.url")
{
Run,"F9\2.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F9\2.lnk")
{
Run,"F9\2.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F9 & 3 Up::

if fileexist("F9\3.url")
{
Run,"F9\3.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F9\3.lnk")
{
Run,"F9\3.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F9 & 4 Up::

if fileexist("F9\4.url")
{
Run,"F9\4.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F9\4.lnk")
{
Run,"F9\4.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F9 & 5 Up::

if fileexist("F9\5.url")
{
Run,"F9\5.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F9\5.lnk")
{
Run,"F9\5.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F9 & 6 Up::

if fileexist("F9\6.url")
{
Run,"F9\6.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F9\6.lnk")
{
Run,"F9\6.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F9 & 7 Up::

if fileexist("F9\7.url")
{
Run,"F9\7.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F9\7.lnk")
{
Run,"F9\7.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F9 & 8 Up::

if fileexist("F9\8.url")
{
Run,"F9\8.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F9\8.lnk")
{
Run,"F9\8.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F9 & 9 Up::

if fileexist("F9\9.url")
{
Run,"F9\9.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F9\9.lnk")
{
Run,"F9\9.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F9 & 0 Up::

if fileexist("F9\0.url")
{
Run,"F9\0.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F9\0.lnk")
{
Run,"F9\0.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F10 & Enter Up::Run, F10

F10 & a Up::

if fileexist("F10\a.url")
{
Run,"F10\a.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F10\a.lnk")
{
Run,"F10\a.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F10 & b Up::

if fileexist("F10\b.url")
{
Run,"F10\b.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F10\b.lnk")
{
Run,"F10\b.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F10 & c Up::

if fileexist("F10\c.url")
{
Run,"F10\c.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F10\c.lnk")
{
Run,"F10\c.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F10 & d Up::

if fileexist("F10\d.url")
{
Run,"F10\d.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F10\d.lnk")
{
Run,"F10\d.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F10 & e Up::

if fileexist("F10\e.url")
{
Run,"F10\e.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F10\e.lnk")
{
Run,"F10\e.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F10 & f Up::

if fileexist("F10\f.url")
{
Run,"F10\f.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F10\f.lnk")
{
Run,"F10\f.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F10 & g Up::

if fileexist("F10\g.url")
{
Run,"F10\g.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F10\g.lnk")
{
Run,"F10\g.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F10 & h Up::

if fileexist("F10\h.url")
{
Run,"F10\h.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F10\h.lnk")
{
Run,"F10\h.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F10 & i Up::

if fileexist("F10\i.url")
{
Run,"F10\i.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F10\i.lnk")
{
Run,"F10\i.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F10 & j Up::

if fileexist("F10\j.url")
{
Run,"F10\j.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F10\j.lnk")
{
Run,"F10\j.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F10 & k Up::

if fileexist("F10\k.url")
{
Run,"F10\k.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F10\k.lnk")
{
Run,"F10\k.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F10 & l Up::

if fileexist("F10\l.url")
{
Run,"F10\l.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F10\l.lnk")
{
Run,"F10\l.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F10 & m Up::

if fileexist("F10\m.url")
{
Run,"F10\m.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F10\m.lnk")
{
Run,"F10\m.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F10 & n Up::

if fileexist("F10\n.url")
{
Run,"F10\n.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F10\n.lnk")
{
Run,"F10\n.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F10 & o Up::

if fileexist("F10\o.url")
{
Run,"F10\o.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F10\o.lnk")
{
Run,"F10\o.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F10 & p Up::

if fileexist("F10\p.url")
{
Run,"F10\p.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F10\p.lnk")
{
Run,"F10\p.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F10 & q Up::

if fileexist("F10\q.url")
{
Run,"F10\q.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F10\q.lnk")
{
Run,"F10\q.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F10 & r Up::

if fileexist("F10\r.url")
{
Run,"F10\r.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F10\r.lnk")
{
Run,"F10\r.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F10 & s Up::

if fileexist("F10\s.url")
{
Run,"F10\s.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F10\s.lnk")
{
Run,"F10\s.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F10 & t Up::

if fileexist("F10\t.url")
{
Run,"F10\t.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F10\t.lnk")
{
Run,"F10\t.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F10 & u Up::

if fileexist("F10\u.url")
{
Run,"F10\u.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F10\u.lnk")
{
Run,"F10\u.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F10 & v Up::

if fileexist("F10\v.url")
{
Run,"F10\v.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F10\v.lnk")
{
Run,"F10\v.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F10 & w Up::

if fileexist("F10\w.url")
{
Run,"F10\w.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F10\w.lnk")
{
Run,"F10\w.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F10 & x Up::

if fileexist("F10\x.url")
{
Run,"F10\x.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F10\x.lnk")
{
Run,"F10\x.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F10 & y Up::

if fileexist("F10\y.url")
{
Run,"F10\y.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F10\y.lnk")
{
Run,"F10\y.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F10 & z Up::

if fileexist("F10\z.url")
{
Run,"F10\z.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F10\z.lnk")
{
Run,"F10\z.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F10 & 1 Up::

if fileexist("F10\1.url")
{
Run,"F10\1.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F10\1.lnk")
{
Run,"F10\1.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F10 & 2 Up::

if fileexist("F10\2.url")
{
Run,"F10\2.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F10\2.lnk")
{
Run,"F10\2.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F10 & 3 Up::

if fileexist("F10\3.url")
{
Run,"F10\3.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F10\3.lnk")
{
Run,"F10\3.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F10 & 4 Up::

if fileexist("F10\4.url")
{
Run,"F10\4.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F10\4.lnk")
{
Run,"F10\4.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F10 & 5 Up::

if fileexist("F10\5.url")
{
Run,"F10\5.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F10\5.lnk")
{
Run,"F10\5.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F10 & 6 Up::

if fileexist("F10\6.url")
{
Run,"F10\6.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F10\6.lnk")
{
Run,"F10\6.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F10 & 7 Up::

if fileexist("F10\7.url")
{
Run,"F10\7.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F10\7.lnk")
{
Run,"F10\7.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F10 & 8 Up::

if fileexist("F10\8.url")
{
Run,"F10\8.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F10\8.lnk")
{
Run,"F10\8.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F10 & 9 Up::

if fileexist("F10\9.url")
{
Run,"F10\9.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F10\9.lnk")
{
Run,"F10\9.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F10 & 0 Up::

if fileexist("F10\0.url")
{
Run,"F10\0.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F10\0.lnk")
{
Run,"F10\0.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F11 & Enter Up::Run, F11

F11 & a Up::

if fileexist("F11\a.url")
{
Run,"F11\a.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F11\a.lnk")
{
Run,"F11\a.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F11 & b Up::

if fileexist("F11\b.url")
{
Run,"F11\b.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F11\b.lnk")
{
Run,"F11\b.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F11 & c Up::

if fileexist("F11\c.url")
{
Run,"F11\c.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F11\c.lnk")
{
Run,"F11\c.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F11 & d Up::

if fileexist("F11\d.url")
{
Run,"F11\d.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F11\d.lnk")
{
Run,"F11\d.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F11 & e Up::

if fileexist("F11\e.url")
{
Run,"F11\e.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F11\e.lnk")
{
Run,"F11\e.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F11 & f Up::

if fileexist("F11\f.url")
{
Run,"F11\f.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F11\f.lnk")
{
Run,"F11\f.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F11 & g Up::

if fileexist("F11\g.url")
{
Run,"F11\g.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F11\g.lnk")
{
Run,"F11\g.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F11 & h Up::

if fileexist("F11\h.url")
{
Run,"F11\h.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F11\h.lnk")
{
Run,"F11\h.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F11 & i Up::

if fileexist("F11\i.url")
{
Run,"F11\i.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F11\i.lnk")
{
Run,"F11\i.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F11 & j Up::

if fileexist("F11\j.url")
{
Run,"F11\j.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F11\j.lnk")
{
Run,"F11\j.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F11 & k Up::

if fileexist("F11\k.url")
{
Run,"F11\k.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F11\k.lnk")
{
Run,"F11\k.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F11 & l Up::

if fileexist("F11\l.url")
{
Run,"F11\l.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F11\l.lnk")
{
Run,"F11\l.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F11 & m Up::

if fileexist("F11\m.url")
{
Run,"F11\m.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F11\m.lnk")
{
Run,"F11\m.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F11 & n Up::

if fileexist("F11\n.url")
{
Run,"F11\n.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F11\n.lnk")
{
Run,"F11\n.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F11 & o Up::

if fileexist("F11\o.url")
{
Run,"F11\o.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F11\o.lnk")
{
Run,"F11\o.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F11 & p Up::

if fileexist("F11\p.url")
{
Run,"F11\p.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F11\p.lnk")
{
Run,"F11\p.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F11 & q Up::

if fileexist("F11\q.url")
{
Run,"F11\q.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F11\q.lnk")
{
Run,"F11\q.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F11 & r Up::

if fileexist("F11\r.url")
{
Run,"F11\r.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F11\r.lnk")
{
Run,"F11\r.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F11 & s Up::

if fileexist("F11\s.url")
{
Run,"F11\s.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F11\s.lnk")
{
Run,"F11\s.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F11 & t Up::

if fileexist("F11\t.url")
{
Run,"F11\t.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F11\t.lnk")
{
Run,"F11\t.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F11 & u Up::

if fileexist("F11\u.url")
{
Run,"F11\u.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F11\u.lnk")
{
Run,"F11\u.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F11 & v Up::

if fileexist("F11\v.url")
{
Run,"F11\v.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F11\v.lnk")
{
Run,"F11\v.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F11 & w Up::

if fileexist("F11\w.url")
{
Run,"F11\w.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F11\w.lnk")
{
Run,"F11\w.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F11 & x Up::

if fileexist("F11\x.url")
{
Run,"F11\x.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F11\x.lnk")
{
Run,"F11\x.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F11 & y Up::

if fileexist("F11\y.url")
{
Run,"F11\y.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F11\y.lnk")
{
Run,"F11\y.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F11 & z Up::

if fileexist("F11\z.url")
{
Run,"F11\z.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F11\z.lnk")
{
Run,"F11\z.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F11 & 1 Up::

if fileexist("F11\1.url")
{
Run,"F11\1.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F11\1.lnk")
{
Run,"F11\1.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F11 & 2 Up::

if fileexist("F11\2.url")
{
Run,"F11\2.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F11\2.lnk")
{
Run,"F11\2.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F11 & 3 Up::

if fileexist("F11\3.url")
{
Run,"F11\3.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F11\3.lnk")
{
Run,"F11\3.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F11 & 4 Up::

if fileexist("F11\4.url")
{
Run,"F11\4.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F11\4.lnk")
{
Run,"F11\4.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F11 & 5 Up::

if fileexist("F11\5.url")
{
Run,"F11\5.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F11\5.lnk")
{
Run,"F11\5.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F11 & 6 Up::

if fileexist("F11\6.url")
{
Run,"F11\6.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F11\6.lnk")
{
Run,"F11\6.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F11 & 7 Up::

if fileexist("F11\7.url")
{
Run,"F11\7.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F11\7.lnk")
{
Run,"F11\7.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F11 & 8 Up::

if fileexist("F11\8.url")
{
Run,"F11\8.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F11\8.lnk")
{
Run,"F11\8.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F11 & 9 Up::

if fileexist("F11\9.url")
{
Run,"F11\9.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F11\9.lnk")
{
Run,"F11\9.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F11 & 0 Up::

if fileexist("F11\0.url")
{
Run,"F11\0.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F11\0.lnk")
{
Run,"F11\0.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F12 & Enter Up::Run, F12

F12 & a Up::

if fileexist("F12\a.url")
{
Run,"F12\a.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F12\a.lnk")
{
Run,"F12\a.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F12 & b Up::

if fileexist("F12\b.url")
{
Run,"F12\b.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F12\b.lnk")
{
Run,"F12\b.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F12 & c Up::

if fileexist("F12\c.url")
{
Run,"F12\c.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F12\c.lnk")
{
Run,"F12\c.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F12 & d Up::

if fileexist("F12\d.url")
{
Run,"F12\d.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F12\d.lnk")
{
Run,"F12\d.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F12 & e Up::

if fileexist("F12\e.url")
{
Run,"F12\e.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F12\e.lnk")
{
Run,"F12\e.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F12 & f Up::

if fileexist("F12\f.url")
{
Run,"F12\f.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F12\f.lnk")
{
Run,"F12\f.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F12 & g Up::

if fileexist("F12\g.url")
{
Run,"F12\g.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F12\g.lnk")
{
Run,"F12\g.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F12 & h Up::

if fileexist("F12\h.url")
{
Run,"F12\h.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F12\h.lnk")
{
Run,"F12\h.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F12 & i Up::

if fileexist("F12\i.url")
{
Run,"F12\i.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F12\i.lnk")
{
Run,"F12\i.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F12 & j Up::

if fileexist("F12\j.url")
{
Run,"F12\j.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F12\j.lnk")
{
Run,"F12\j.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F12 & k Up::

if fileexist("F12\k.url")
{
Run,"F12\k.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F12\k.lnk")
{
Run,"F12\k.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F12 & l Up::

if fileexist("F12\l.url")
{
Run,"F12\l.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F12\l.lnk")
{
Run,"F12\l.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F12 & m Up::

if fileexist("F12\m.url")
{
Run,"F12\m.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F12\m.lnk")
{
Run,"F12\m.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F12 & n Up::

if fileexist("F12\n.url")
{
Run,"F12\n.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F12\n.lnk")
{
Run,"F12\n.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F12 & o Up::

if fileexist("F12\o.url")
{
Run,"F12\o.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F12\o.lnk")
{
Run,"F12\o.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F12 & p Up::

if fileexist("F12\p.url")
{
Run,"F12\p.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F12\p.lnk")
{
Run,"F12\p.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F12 & q Up::

if fileexist("F12\q.url")
{
Run,"F12\q.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F12\q.lnk")
{
Run,"F12\q.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F12 & r Up::

if fileexist("F12\r.url")
{
Run,"F12\r.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F12\r.lnk")
{
Run,"F12\r.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F12 & s Up::

if fileexist("F12\s.url")
{
Run,"F12\s.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F12\s.lnk")
{
Run,"F12\s.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F12 & t Up::

if fileexist("F12\t.url")
{
Run,"F12\t.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F12\t.lnk")
{
Run,"F12\t.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F12 & u Up::

if fileexist("F12\u.url")
{
Run,"F12\u.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F12\u.lnk")
{
Run,"F12\u.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F12 & v Up::

if fileexist("F12\v.url")
{
Run,"F12\v.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F12\v.lnk")
{
Run,"F12\v.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F12 & w Up::

if fileexist("F12\w.url")
{
Run,"F12\w.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F12\w.lnk")
{
Run,"F12\w.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F12 & x Up::

if fileexist("F12\x.url")
{
Run,"F12\x.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F12\x.lnk")
{
Run,"F12\x.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F12 & y Up::

if fileexist("F12\y.url")
{
Run,"F12\y.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F12\y.lnk")
{
Run,"F12\y.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F12 & z Up::

if fileexist("F12\z.url")
{
Run,"F12\z.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F12\z.lnk")
{
Run,"F12\z.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F12 & 1 Up::

if fileexist("F12\1.url")
{
Run,"F12\1.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F12\1.lnk")
{
Run,"F12\1.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F12 & 2 Up::

if fileexist("F12\2.url")
{
Run,"F12\2.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F12\2.lnk")
{
Run,"F12\2.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F12 & 3 Up::

if fileexist("F12\3.url")
{
Run,"F12\3.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F12\3.lnk")
{
Run,"F12\3.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F12 & 4 Up::

if fileexist("F12\4.url")
{
Run,"F12\4.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F12\4.lnk")
{
Run,"F12\4.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F12 & 5 Up::

if fileexist("F12\5.url")
{
Run,"F12\5.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F12\5.lnk")
{
Run,"F12\5.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F12 & 6 Up::

if fileexist("F12\6.url")
{
Run,"F12\6.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F12\6.lnk")
{
Run,"F12\6.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F12 & 7 Up::

if fileexist("F12\7.url")
{
Run,"F12\7.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F12\7.lnk")
{
Run,"F12\7.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F12 & 8 Up::

if fileexist("F12\8.url")
{
Run,"F12\8.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F12\8.lnk")
{
Run,"F12\8.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F12 & 9 Up::

if fileexist("F12\9.url")
{
Run,"F12\9.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F12\9.lnk")
{
Run,"F12\9.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return

F12 & 0 Up::

if fileexist("F12\0.url")
{
Run,"F12\0.url",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

if fileexist("F12\0.lnk")
{
Run,"F12\0.lnk",,UseErrorLevel
Run,"%A_ScriptFullPath%" 1
Return
}

Return