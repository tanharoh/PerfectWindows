#SingleInstance ignore
#MaxHotkeysPerInterval 1000
#Persistent
#InstallKeybdHook
#NoTrayIcon

Process, Priority, , High

v:="0.9.0"

if A_IsAdmin
{
exitapp
}


if A_Is64bitOS
{
exitapp
}

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

return

#=::Volume_Up
#-::Volume_Down

#,::Send {Media_Prev}
#.::Send {Media_Next}
#'::Send {Media_Play_Pause}

#Enter::^#d
#BackSpace::^#F4
#[::^#Left
#]::^#Right

#PgUp::#=
#PgDn::#-

#NumLock Up::Run, "%systemroot%\system32\calc.exe",,useerrorlevel

#0 Up::Run, "%systemroot%\system32\calc.exe",,useerrorlevel

#CapsLock Up::winset,AlwaysOnTop,, A

#Delete::Run ::{645ff040-5081-101b-9f08-00aa002f954e},,useerrorlevel

#End::DllCall("PowrProf\SetSuspendState", "int", 1, "int", 0, "int", 1)

SetStoreCapsLockMode, Off

CapsLock::
GetKeyState,caps,CapsLock,T
if caps=D
setcapslockstate,off
else
setcapslockstate,on
return

CapsLock & `::AltTab
CapsLock & Esc::Send !{F4}

CapsLock & a::
Send ^+!{a}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & b::
Send ^+!{b}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & c::
Send ^+!{c}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & d::
Send ^+!{d}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & e::
Send ^+!{e}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & f::
Send ^+!{f}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & g::
Send ^+!{g}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & h::
Send ^+!{h}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & i::
Send ^+!{i}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & j::
Send ^+!{j}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & k::
Send ^+!{k}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & l::
Send ^+!{l}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & m::
Send ^+!{m}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & n::
Send ^+!{n}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & o::
Send ^+!{o}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & p::
Send ^+!{p}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & q::
Send ^+!{q}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & r::
Send ^+!{r}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & s::
Send ^+!{s}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & t::
Send ^+!{t}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & u::
Send ^+!{u}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & v::
Send ^+!{v}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & w::
Send ^+!{w}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & x::
Send ^+!{x}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & y::
Send ^+!{y}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & z::
Send ^+!{z}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & 1::
Send ^+!{1}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & 2::
Send ^+!{2}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & 3::
Send ^+!{3}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & 4::
Send ^+!{4}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & 5::
Send ^+!{5}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & 6::
Send ^+!{6}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & 7::
Send ^+!{7}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & 8::
Send ^+!{8}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & 9::
Send ^+!{9}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & 0::
Send ^+!{0}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & F1::
Send ^+!{F1}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & F2::
Send ^+!{F2}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & F3::
Send ^+!{F3}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & F4::
Send ^+!{F4}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & F5::
Send ^+!{F5}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & F6::
Send ^+!{F6}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & F7::
Send ^+!{F7}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & F8::
Send ^+!{F8}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & F9::
Send ^+!{F9}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & F10::
Send ^+!{F10}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & F11::
Send ^+!{F11}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & F12::
Send ^+!{F12}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & ,::
Send ^+!{,}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & .::
Send ^+!{.}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & /::
Send ^+!{/}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & '::
Send ^+!{'}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & [::
Send ^+!{[}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & ]::
Send ^+!{]}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & \::
Send ^+!{\}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & -::
Send ^+!{-}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & =::
Send ^+!{=}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & Space::
Send ^+!{Space}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & Enter::
Send ^+!{Enter}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & Backspace::
Send ^+!{Backspace}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & Delete::
Send ^+!{Delete}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & Insert::
Send ^+!{Insert}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & Home::
Send ^+!{Home}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & End::
Send ^+!{End}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & PgUp::
Send ^+!{PgUp}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & PgDn::
Send ^+!{PgDn}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & Up::
Send ^+!{Up}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & Down::
Send ^+!{Down}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & Left::
Send ^+!{Left}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & Right::
Send ^+!{Right}
;Run,"%A_ScriptFullPath%" /restart
return

CapsLock & PrintScreen::
Send ^+!{PrintScreen}
;Run,"%A_ScriptFullPath%" /restart
return

`::`
` & Shift::`

` & a::
Send +!{a}
;Run,"%A_ScriptFullPath%" /restart
return

` & b::
Send +!{b}
;Run,"%A_ScriptFullPath%" /restart
return

` & c::
Send +!{c}
;Run,"%A_ScriptFullPath%" /restart
return

` & d::
Send +!{d}
;Run,"%A_ScriptFullPath%" /restart
return

` & e::
Send +!{e}
;Run,"%A_ScriptFullPath%" /restart
return

` & f::
Send +!{f}
;Run,"%A_ScriptFullPath%" /restart
return

` & g::
Send +!{g}
;Run,"%A_ScriptFullPath%" /restart
return

` & h::
Send +!{h}
;Run,"%A_ScriptFullPath%" /restart
return

` & i::
Send +!{i}
;Run,"%A_ScriptFullPath%" /restart
return

` & j::
Send +!{j}
;Run,"%A_ScriptFullPath%" /restart
return

` & k::
Send +!{k}
;Run,"%A_ScriptFullPath%" /restart
return

` & l::
Send +!{l}
;Run,"%A_ScriptFullPath%" /restart
return

` & m::
Send +!{m}
;Run,"%A_ScriptFullPath%" /restart
return

` & n::
Send +!{n}
;Run,"%A_ScriptFullPath%" /restart
return

` & o::
Send +!{o}
;Run,"%A_ScriptFullPath%" /restart
return

` & p::
Send +!{p}
;Run,"%A_ScriptFullPath%" /restart
return

` & q::
Send +!{q}
;Run,"%A_ScriptFullPath%" /restart
return

` & r::
Send +!{r}
;Run,"%A_ScriptFullPath%" /restart
return

` & s::
Send +!{s}
;Run,"%A_ScriptFullPath%" /restart
return

` & t::
Send +!{t}
;Run,"%A_ScriptFullPath%" /restart
return

` & u::
Send +!{u}
;Run,"%A_ScriptFullPath%" /restart
return

` & v::
Send +!{v}
;Run,"%A_ScriptFullPath%" /restart
return

` & w::
Send +!{w}
;Run,"%A_ScriptFullPath%" /restart
return

` & x::
Send +!{x}
;Run,"%A_ScriptFullPath%" /restart
return

` & y::
Send +!{y}
;Run,"%A_ScriptFullPath%" /restart
return

` & z::
Send +!{z}
;Run,"%A_ScriptFullPath%" /restart
return

` & 1::
Send +!{1}
;Run,"%A_ScriptFullPath%" /restart
return

` & 2::
Send +!{2}
;Run,"%A_ScriptFullPath%" /restart
return

` & 3::
Send +!{3}
;Run,"%A_ScriptFullPath%" /restart
return

` & 4::
Send +!{4}
;Run,"%A_ScriptFullPath%" /restart
return

` & 5::
Send +!{5}
;Run,"%A_ScriptFullPath%" /restart
return

` & 6::
Send +!{6}
;Run,"%A_ScriptFullPath%" /restart
return

` & 7::
Send +!{7}
;Run,"%A_ScriptFullPath%" /restart
return

` & 8::
Send +!{8}
;Run,"%A_ScriptFullPath%" /restart
return

` & 9::
Send +!{9}
;Run,"%A_ScriptFullPath%" /restart
return

` & 0::
Send +!{0}
;Run,"%A_ScriptFullPath%" /restart
return

` & F1::
Send +!{F1}
;Run,"%A_ScriptFullPath%" /restart
return

` & F2::
Send +!{F2}
;Run,"%A_ScriptFullPath%" /restart
return

` & F3::
Send +!{F3}
;Run,"%A_ScriptFullPath%" /restart
return

` & F4::
Send +!{F4}
;Run,"%A_ScriptFullPath%" /restart
return

` & F5::
Send +!{F5}
;Run,"%A_ScriptFullPath%" /restart
return

` & F6::
Send +!{F6}
;Run,"%A_ScriptFullPath%" /restart
return

` & F7::
Send +!{F7}
;Run,"%A_ScriptFullPath%" /restart
return

` & F8::
Send +!{F8}
;Run,"%A_ScriptFullPath%" /restart
return

` & F9::
Send +!{F9}
;Run,"%A_ScriptFullPath%" /restart
return

` & F10::
Send +!{F10}
;Run,"%A_ScriptFullPath%" /restart
return

` & F11::
Send +!{F11}
;Run,"%A_ScriptFullPath%" /restart
return

` & F12::
Send +!{F12}
;Run,"%A_ScriptFullPath%" /restart
return

` & ,::
Send +!{,}
;Run,"%A_ScriptFullPath%" /restart
return

` & .::
Send +!{.}
;Run,"%A_ScriptFullPath%" /restart
return

` & /::
Send +!{/}
;Run,"%A_ScriptFullPath%" /restart
return

` & '::
Send +!{'}
;Run,"%A_ScriptFullPath%" /restart
return

` & [::
Send +!{[}
;Run,"%A_ScriptFullPath%" /restart
return

` & ]::
Send +!{]}
;Run,"%A_ScriptFullPath%" /restart
return

` & \::
Send +!{\}
;Run,"%A_ScriptFullPath%" /restart
return

` & -::
Send +!{-}
;Run,"%A_ScriptFullPath%" /restart
return

` & =::
Send +!{=}
;Run,"%A_ScriptFullPath%" /restart
return

` & Space::
Send +!{Space}
;Run,"%A_ScriptFullPath%" /restart
return

` & Enter::
Send +!{Enter}
;Run,"%A_ScriptFullPath%" /restart
return

` & Backspace::
Send +!{Backspace}
;Run,"%A_ScriptFullPath%" /restart
return

` & Delete::
Send +!{Delete}
;Run,"%A_ScriptFullPath%" /restart
return

` & Insert::
Send +!{Insert}
;Run,"%A_ScriptFullPath%" /restart
return

` & Home::
Send +!{Home}
;Run,"%A_ScriptFullPath%" /restart
return

` & End::
Send +!{End}
;Run,"%A_ScriptFullPath%" /restart
return

` & PgUp::
Send +!{PgUp}
;Run,"%A_ScriptFullPath%" /restart
return

` & PgDn::
Send +!{PgDn}
;Run,"%A_ScriptFullPath%" /restart
return

` & Up::
Send +!{Up}
;Run,"%A_ScriptFullPath%" /restart
return

` & Down::
Send +!{Down}
;Run,"%A_ScriptFullPath%" /restart
return

` & Left::
Send +!{Left}
;Run,"%A_ScriptFullPath%" /restart
return

` & Right::
Send +!{Right}
;Run,"%A_ScriptFullPath%" /restart
return

` & PrintScreen::
Send +!{PrintScreen}
;Run,"%A_ScriptFullPath%" /restart
return

Tab::Tab
Tab & Shift::Tab

Tab & a::
Send ^!{a}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & b::
Send ^!{b}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & c::
Send ^!{c}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & d::
Send ^!{d}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & e::
Send ^!{e}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & f::
Send ^!{f}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & g::
Send ^!{g}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & h::
Send ^!{h}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & i::
Send ^!{i}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & j::
Send ^!{j}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & k::
Send ^!{k}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & l::
Send ^!{l}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & m::
Send ^!{m}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & n::
Send ^!{n}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & o::
Send ^!{o}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & p::
Send ^!{p}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & q::
Send ^!{q}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & r::
Send ^!{r}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & s::
Send ^!{s}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & t::
Send ^!{t}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & u::
Send ^!{u}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & v::
Send ^!{v}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & w::
Send ^!{w}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & x::
Send ^!{x}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & y::
Send ^!{y}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & z::
Send ^!{z}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & 1::
Send ^!{1}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & 2::
Send ^!{2}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & 3::
Send ^!{3}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & 4::
Send ^!{4}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & 5::
Send ^!{5}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & 6::
Send ^!{6}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & 7::
Send ^!{7}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & 8::
Send ^!{8}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & 9::
Send ^!{9}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & 0::
Send ^!{0}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & F1::
Send ^!{F1}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & F2::
Send ^!{F2}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & F3::
Send ^!{F3}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & F4::
Send ^!{F4}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & F5::
Send ^!{F5}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & F6::
Send ^!{F6}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & F7::
Send ^!{F7}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & F8::
Send ^!{F8}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & F9::
Send ^!{F9}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & F10::
Send ^!{F10}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & F11::
Send ^!{F11}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & F12::
Send ^!{F12}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & ,::
Send ^!{,}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & .::
Send ^!{.}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & /::
Send ^!{/}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & '::
Send ^!{'}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & [::
Send ^!{[}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & ]::
Send ^!{]}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & \::
Send ^!{\}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & -::
Send ^!{-}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & =::
Send ^!{=}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & Space::
Send ^!{Space}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & Enter::
Send ^!{Enter}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & Backspace::
Send ^!{Backspace}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & Delete::
Send ^!{Delete}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & Insert::
Send ^!{Insert}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & Home::
Send ^!{Home}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & End::
Send ^!{End}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & PgUp::
Send ^!{PgUp}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & PgDn::
Send ^!{PgDn}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & Up::
Send ^!{Up}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & Down::
Send ^!{Down}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & Left::
Send ^!{Left}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & Right::
Send ^!{Right}
;Run,"%A_ScriptFullPath%" /restart
return

Tab & PrintScreen::
Send ^!{PrintScreen}
;Run,"%A_ScriptFullPath%" /restart
return

Esc::Esc
Esc & Shift::Esc

Esc & a::
Send ^+{a}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & b::
Send ^+{b}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & c::
Send ^+{c}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & d::
Send ^+{d}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & e::
Send ^+{e}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & f::
Send ^+{f}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & g::
Send ^+{g}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & h::
Send ^+{h}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & i::
Send ^+{i}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & j::
Send ^+{j}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & k::
Send ^+{k}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & l::
Send ^+{l}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & m::
Send ^+{m}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & n::
Send ^+{n}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & o::
Send ^+{o}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & p::
Send ^+{p}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & q::
Send ^+{q}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & r::
Send ^+{r}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & s::
Send ^+{s}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & t::
Send ^+{t}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & u::
Send ^+{u}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & v::
Send ^+{v}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & w::
Send ^+{w}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & x::
Send ^+{x}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & y::
Send ^+{y}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & z::
Send ^+{z}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & 1::
Send ^+{1}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & 2::
Send ^+{2}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & 3::
Send ^+{3}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & 4::
Send ^+{4}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & 5::
Send ^+{5}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & 6::
Send ^+{6}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & 7::
Send ^+{7}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & 8::
Send ^+{8}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & 9::
Send ^+{9}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & 0::
Send ^+{0}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & F1::
Send ^+{F1}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & F2::
Send ^+{F2}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & F3::
Send ^+{F3}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & F4::
Send ^+{F4}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & F5::
Send ^+{F5}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & F6::
Send ^+{F6}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & F7::
Send ^+{F7}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & F8::
Send ^+{F8}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & F9::
Send ^+{F9}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & F10::
Send ^+{F10}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & F11::
Send ^+{F11}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & F12::
Send ^+{F12}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & ,::
Send ^+{,}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & .::
Send ^+{.}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & /::
Send ^+{/}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & '::
Send ^+{'}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & [::
Send ^+{[}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & ]::
Send ^+{]}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & \::
Send ^+{\}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & -::
Send ^+{-}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & =::
Send ^+{=}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & Space::
Send ^+{Space}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & Enter::
Send ^+{Enter}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & Backspace::
Send ^+{Backspace}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & Delete::
Send ^+{Delete}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & Insert::
Send ^+{Insert}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & Home::
Send ^+{Home}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & End::
Send ^+{End}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & PgUp::
Send ^+{PgUp}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & PgDn::
Send ^+{PgDn}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & Up::
Send ^+{Up}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & Down::
Send ^+{Down}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & Left::
Send ^+{Left}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & Right::
Send ^+{Right}
;Run,"%A_ScriptFullPath%" /restart
return

Esc & PrintScreen::
Send ^+{PrintScreen}
;Run,"%A_ScriptFullPath%" /restart
return

#F1::
Run, https://github.com/szzhiyang/PerfectWindows/blob/master/README.md,,useerrorlevel
return

#F4::
msgbox,0x40114,Power Keys %v% by 知阳,退出 Power Keys？
ifmsgbox,yes
exitapp
return

#F5::
msgbox,0x40040,Power Keys %v% by 知阳,已重启 Power Keys。,1
Run,"%A_ScriptFullPath%" /restart,,useerrorlevel
return

#F8::
Run,%A_WorkingDir%,,useerrorlevel
return

#F12::
msgbox,0x40024,Power Keys %v% by 知阳,登录 Windows 时自动启动 Power Keys？
ifmsgbox,yes
{
RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run, Power Keys, %A_ScriptFullPath%
}
else
{
regdelete,HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run, Power Keys
}
return

#/::
msgbox,0x40040,Power Keys %v% by 知阳,Power Keys 正在运行。,1
return

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

F1 & Space Up::Send !{F4}
F2 & Space Up::Send !{F4}
F3 & Space Up::Send !{F4}
F4 & Space Up::Send !{F4}
F5 & Space Up::Send !{F4}
F6 & Space Up::Send !{F4}
F7 & Space Up::Send !{F4}
F8 & Space Up::Send !{F4}
F9 & Space Up::Send !{F4}
F10 & Space Up::Send !{F4}
F11 & Space Up::Send !{F4}
F12 & Space Up::Send !{F4}

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

#!PrintScreen::Run, %systemroot%\system32\snippingtool.exe,,useerrorlevel

F1 & Enter Up::Run, F1

F1 & a Up::

if fileexist("F1\a.url")
{
Run,"F1\a.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F1\a.lnk")
{
Run,"F1\a.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F1 & b Up::

if fileexist("F1\b.url")
{
Run,"F1\b.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F1\b.lnk")
{
Run,"F1\b.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F1 & c Up::

if fileexist("F1\c.url")
{
Run,"F1\c.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F1\c.lnk")
{
Run,"F1\c.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F1 & d Up::

if fileexist("F1\d.url")
{
Run,"F1\d.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F1\d.lnk")
{
Run,"F1\d.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F1 & e Up::

if fileexist("F1\e.url")
{
Run,"F1\e.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F1\e.lnk")
{
Run,"F1\e.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F1 & f Up::

if fileexist("F1\f.url")
{
Run,"F1\f.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F1\f.lnk")
{
Run,"F1\f.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F1 & g Up::

if fileexist("F1\g.url")
{
Run,"F1\g.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F1\g.lnk")
{
Run,"F1\g.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F1 & h Up::

if fileexist("F1\h.url")
{
Run,"F1\h.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F1\h.lnk")
{
Run,"F1\h.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F1 & i Up::

if fileexist("F1\i.url")
{
Run,"F1\i.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F1\i.lnk")
{
Run,"F1\i.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F1 & j Up::

if fileexist("F1\j.url")
{
Run,"F1\j.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F1\j.lnk")
{
Run,"F1\j.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F1 & k Up::

if fileexist("F1\k.url")
{
Run,"F1\k.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F1\k.lnk")
{
Run,"F1\k.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F1 & l Up::

if fileexist("F1\l.url")
{
Run,"F1\l.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F1\l.lnk")
{
Run,"F1\l.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F1 & m Up::

if fileexist("F1\m.url")
{
Run,"F1\m.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F1\m.lnk")
{
Run,"F1\m.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F1 & n Up::

if fileexist("F1\n.url")
{
Run,"F1\n.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F1\n.lnk")
{
Run,"F1\n.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F1 & o Up::

if fileexist("F1\o.url")
{
Run,"F1\o.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F1\o.lnk")
{
Run,"F1\o.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F1 & p Up::

if fileexist("F1\p.url")
{
Run,"F1\p.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F1\p.lnk")
{
Run,"F1\p.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F1 & q Up::

if fileexist("F1\q.url")
{
Run,"F1\q.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F1\q.lnk")
{
Run,"F1\q.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F1 & r Up::

if fileexist("F1\r.url")
{
Run,"F1\r.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F1\r.lnk")
{
Run,"F1\r.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F1 & s Up::

if fileexist("F1\s.url")
{
Run,"F1\s.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F1\s.lnk")
{
Run,"F1\s.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F1 & t Up::

if fileexist("F1\t.url")
{
Run,"F1\t.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F1\t.lnk")
{
Run,"F1\t.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F1 & u Up::

if fileexist("F1\u.url")
{
Run,"F1\u.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F1\u.lnk")
{
Run,"F1\u.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F1 & v Up::

if fileexist("F1\v.url")
{
Run,"F1\v.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F1\v.lnk")
{
Run,"F1\v.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F1 & w Up::

if fileexist("F1\w.url")
{
Run,"F1\w.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F1\w.lnk")
{
Run,"F1\w.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F1 & x Up::

if fileexist("F1\x.url")
{
Run,"F1\x.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F1\x.lnk")
{
Run,"F1\x.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F1 & y Up::

if fileexist("F1\y.url")
{
Run,"F1\y.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F1\y.lnk")
{
Run,"F1\y.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F1 & z Up::

if fileexist("F1\z.url")
{
Run,"F1\z.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F1\z.lnk")
{
Run,"F1\z.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F1 & 1 Up::

if fileexist("F1\1.url")
{
Run,"F1\1.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F1\1.lnk")
{
Run,"F1\1.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F1 & 2 Up::

if fileexist("F1\2.url")
{
Run,"F1\2.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F1\2.lnk")
{
Run,"F1\2.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F1 & 3 Up::

if fileexist("F1\3.url")
{
Run,"F1\3.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F1\3.lnk")
{
Run,"F1\3.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F1 & 4 Up::

if fileexist("F1\4.url")
{
Run,"F1\4.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F1\4.lnk")
{
Run,"F1\4.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F1 & 5 Up::

if fileexist("F1\5.url")
{
Run,"F1\5.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F1\5.lnk")
{
Run,"F1\5.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F1 & 6 Up::

if fileexist("F1\6.url")
{
Run,"F1\6.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F1\6.lnk")
{
Run,"F1\6.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F1 & 7 Up::

if fileexist("F1\7.url")
{
Run,"F1\7.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F1\7.lnk")
{
Run,"F1\7.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F1 & 8 Up::

if fileexist("F1\8.url")
{
Run,"F1\8.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F1\8.lnk")
{
Run,"F1\8.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F1 & 9 Up::

if fileexist("F1\9.url")
{
Run,"F1\9.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F1\9.lnk")
{
Run,"F1\9.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F1 & 0 Up::

if fileexist("F1\0.url")
{
Run,"F1\0.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F1\0.lnk")
{
Run,"F1\0.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F2 & Enter Up::Run, F2

F2 & a Up::

if fileexist("F2\a.url")
{
Run,"F2\a.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F2\a.lnk")
{
Run,"F2\a.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F2 & b Up::

if fileexist("F2\b.url")
{
Run,"F2\b.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F2\b.lnk")
{
Run,"F2\b.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F2 & c Up::

if fileexist("F2\c.url")
{
Run,"F2\c.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F2\c.lnk")
{
Run,"F2\c.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F2 & d Up::

if fileexist("F2\d.url")
{
Run,"F2\d.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F2\d.lnk")
{
Run,"F2\d.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F2 & e Up::

if fileexist("F2\e.url")
{
Run,"F2\e.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F2\e.lnk")
{
Run,"F2\e.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F2 & f Up::

if fileexist("F2\f.url")
{
Run,"F2\f.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F2\f.lnk")
{
Run,"F2\f.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F2 & g Up::

if fileexist("F2\g.url")
{
Run,"F2\g.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F2\g.lnk")
{
Run,"F2\g.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F2 & h Up::

if fileexist("F2\h.url")
{
Run,"F2\h.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F2\h.lnk")
{
Run,"F2\h.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F2 & i Up::

if fileexist("F2\i.url")
{
Run,"F2\i.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F2\i.lnk")
{
Run,"F2\i.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F2 & j Up::

if fileexist("F2\j.url")
{
Run,"F2\j.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F2\j.lnk")
{
Run,"F2\j.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F2 & k Up::

if fileexist("F2\k.url")
{
Run,"F2\k.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F2\k.lnk")
{
Run,"F2\k.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F2 & l Up::

if fileexist("F2\l.url")
{
Run,"F2\l.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F2\l.lnk")
{
Run,"F2\l.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F2 & m Up::

if fileexist("F2\m.url")
{
Run,"F2\m.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F2\m.lnk")
{
Run,"F2\m.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F2 & n Up::

if fileexist("F2\n.url")
{
Run,"F2\n.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F2\n.lnk")
{
Run,"F2\n.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F2 & o Up::

if fileexist("F2\o.url")
{
Run,"F2\o.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F2\o.lnk")
{
Run,"F2\o.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F2 & p Up::

if fileexist("F2\p.url")
{
Run,"F2\p.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F2\p.lnk")
{
Run,"F2\p.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F2 & q Up::

if fileexist("F2\q.url")
{
Run,"F2\q.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F2\q.lnk")
{
Run,"F2\q.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F2 & r Up::

if fileexist("F2\r.url")
{
Run,"F2\r.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F2\r.lnk")
{
Run,"F2\r.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F2 & s Up::

if fileexist("F2\s.url")
{
Run,"F2\s.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F2\s.lnk")
{
Run,"F2\s.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F2 & t Up::

if fileexist("F2\t.url")
{
Run,"F2\t.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F2\t.lnk")
{
Run,"F2\t.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F2 & u Up::

if fileexist("F2\u.url")
{
Run,"F2\u.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F2\u.lnk")
{
Run,"F2\u.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F2 & v Up::

if fileexist("F2\v.url")
{
Run,"F2\v.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F2\v.lnk")
{
Run,"F2\v.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F2 & w Up::

if fileexist("F2\w.url")
{
Run,"F2\w.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F2\w.lnk")
{
Run,"F2\w.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F2 & x Up::

if fileexist("F2\x.url")
{
Run,"F2\x.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F2\x.lnk")
{
Run,"F2\x.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F2 & y Up::

if fileexist("F2\y.url")
{
Run,"F2\y.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F2\y.lnk")
{
Run,"F2\y.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F2 & z Up::

if fileexist("F2\z.url")
{
Run,"F2\z.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F2\z.lnk")
{
Run,"F2\z.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F2 & 1 Up::

if fileexist("F2\1.url")
{
Run,"F2\1.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F2\1.lnk")
{
Run,"F2\1.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F2 & 2 Up::

if fileexist("F2\2.url")
{
Run,"F2\2.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F2\2.lnk")
{
Run,"F2\2.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F2 & 3 Up::

if fileexist("F2\3.url")
{
Run,"F2\3.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F2\3.lnk")
{
Run,"F2\3.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F2 & 4 Up::

if fileexist("F2\4.url")
{
Run,"F2\4.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F2\4.lnk")
{
Run,"F2\4.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F2 & 5 Up::

if fileexist("F2\5.url")
{
Run,"F2\5.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F2\5.lnk")
{
Run,"F2\5.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F2 & 6 Up::

if fileexist("F2\6.url")
{
Run,"F2\6.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F2\6.lnk")
{
Run,"F2\6.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F2 & 7 Up::

if fileexist("F2\7.url")
{
Run,"F2\7.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F2\7.lnk")
{
Run,"F2\7.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F2 & 8 Up::

if fileexist("F2\8.url")
{
Run,"F2\8.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F2\8.lnk")
{
Run,"F2\8.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F2 & 9 Up::

if fileexist("F2\9.url")
{
Run,"F2\9.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F2\9.lnk")
{
Run,"F2\9.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F2 & 0 Up::

if fileexist("F2\0.url")
{
Run,"F2\0.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F2\0.lnk")
{
Run,"F2\0.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F3 & Enter Up::Run, F3

F3 & a Up::

if fileexist("F3\a.url")
{
Run,"F3\a.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F3\a.lnk")
{
Run,"F3\a.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F3 & b Up::

if fileexist("F3\b.url")
{
Run,"F3\b.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F3\b.lnk")
{
Run,"F3\b.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F3 & c Up::

if fileexist("F3\c.url")
{
Run,"F3\c.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F3\c.lnk")
{
Run,"F3\c.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F3 & d Up::

if fileexist("F3\d.url")
{
Run,"F3\d.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F3\d.lnk")
{
Run,"F3\d.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F3 & e Up::

if fileexist("F3\e.url")
{
Run,"F3\e.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F3\e.lnk")
{
Run,"F3\e.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F3 & f Up::

if fileexist("F3\f.url")
{
Run,"F3\f.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F3\f.lnk")
{
Run,"F3\f.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F3 & g Up::

if fileexist("F3\g.url")
{
Run,"F3\g.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F3\g.lnk")
{
Run,"F3\g.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F3 & h Up::

if fileexist("F3\h.url")
{
Run,"F3\h.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F3\h.lnk")
{
Run,"F3\h.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F3 & i Up::

if fileexist("F3\i.url")
{
Run,"F3\i.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F3\i.lnk")
{
Run,"F3\i.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F3 & j Up::

if fileexist("F3\j.url")
{
Run,"F3\j.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F3\j.lnk")
{
Run,"F3\j.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F3 & k Up::

if fileexist("F3\k.url")
{
Run,"F3\k.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F3\k.lnk")
{
Run,"F3\k.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F3 & l Up::

if fileexist("F3\l.url")
{
Run,"F3\l.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F3\l.lnk")
{
Run,"F3\l.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F3 & m Up::

if fileexist("F3\m.url")
{
Run,"F3\m.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F3\m.lnk")
{
Run,"F3\m.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F3 & n Up::

if fileexist("F3\n.url")
{
Run,"F3\n.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F3\n.lnk")
{
Run,"F3\n.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F3 & o Up::

if fileexist("F3\o.url")
{
Run,"F3\o.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F3\o.lnk")
{
Run,"F3\o.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F3 & p Up::

if fileexist("F3\p.url")
{
Run,"F3\p.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F3\p.lnk")
{
Run,"F3\p.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F3 & q Up::

if fileexist("F3\q.url")
{
Run,"F3\q.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F3\q.lnk")
{
Run,"F3\q.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F3 & r Up::

if fileexist("F3\r.url")
{
Run,"F3\r.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F3\r.lnk")
{
Run,"F3\r.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F3 & s Up::

if fileexist("F3\s.url")
{
Run,"F3\s.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F3\s.lnk")
{
Run,"F3\s.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F3 & t Up::

if fileexist("F3\t.url")
{
Run,"F3\t.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F3\t.lnk")
{
Run,"F3\t.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F3 & u Up::

if fileexist("F3\u.url")
{
Run,"F3\u.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F3\u.lnk")
{
Run,"F3\u.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F3 & v Up::

if fileexist("F3\v.url")
{
Run,"F3\v.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F3\v.lnk")
{
Run,"F3\v.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F3 & w Up::

if fileexist("F3\w.url")
{
Run,"F3\w.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F3\w.lnk")
{
Run,"F3\w.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F3 & x Up::

if fileexist("F3\x.url")
{
Run,"F3\x.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F3\x.lnk")
{
Run,"F3\x.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F3 & y Up::

if fileexist("F3\y.url")
{
Run,"F3\y.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F3\y.lnk")
{
Run,"F3\y.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F3 & z Up::

if fileexist("F3\z.url")
{
Run,"F3\z.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F3\z.lnk")
{
Run,"F3\z.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F3 & 1 Up::

if fileexist("F3\1.url")
{
Run,"F3\1.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F3\1.lnk")
{
Run,"F3\1.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F3 & 2 Up::

if fileexist("F3\2.url")
{
Run,"F3\2.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F3\2.lnk")
{
Run,"F3\2.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F3 & 3 Up::

if fileexist("F3\3.url")
{
Run,"F3\3.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F3\3.lnk")
{
Run,"F3\3.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F3 & 4 Up::

if fileexist("F3\4.url")
{
Run,"F3\4.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F3\4.lnk")
{
Run,"F3\4.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F3 & 5 Up::

if fileexist("F3\5.url")
{
Run,"F3\5.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F3\5.lnk")
{
Run,"F3\5.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F3 & 6 Up::

if fileexist("F3\6.url")
{
Run,"F3\6.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F3\6.lnk")
{
Run,"F3\6.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F3 & 7 Up::

if fileexist("F3\7.url")
{
Run,"F3\7.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F3\7.lnk")
{
Run,"F3\7.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F3 & 8 Up::

if fileexist("F3\8.url")
{
Run,"F3\8.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F3\8.lnk")
{
Run,"F3\8.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F3 & 9 Up::

if fileexist("F3\9.url")
{
Run,"F3\9.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F3\9.lnk")
{
Run,"F3\9.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F3 & 0 Up::

if fileexist("F3\0.url")
{
Run,"F3\0.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F3\0.lnk")
{
Run,"F3\0.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F4 & Enter Up::Run, F4

F4 & a Up::

if fileexist("F4\a.url")
{
Run,"F4\a.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F4\a.lnk")
{
Run,"F4\a.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F4 & b Up::

if fileexist("F4\b.url")
{
Run,"F4\b.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F4\b.lnk")
{
Run,"F4\b.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F4 & c Up::

if fileexist("F4\c.url")
{
Run,"F4\c.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F4\c.lnk")
{
Run,"F4\c.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F4 & d Up::

if fileexist("F4\d.url")
{
Run,"F4\d.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F4\d.lnk")
{
Run,"F4\d.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F4 & e Up::

if fileexist("F4\e.url")
{
Run,"F4\e.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F4\e.lnk")
{
Run,"F4\e.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F4 & f Up::

if fileexist("F4\f.url")
{
Run,"F4\f.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F4\f.lnk")
{
Run,"F4\f.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F4 & g Up::

if fileexist("F4\g.url")
{
Run,"F4\g.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F4\g.lnk")
{
Run,"F4\g.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F4 & h Up::

if fileexist("F4\h.url")
{
Run,"F4\h.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F4\h.lnk")
{
Run,"F4\h.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F4 & i Up::

if fileexist("F4\i.url")
{
Run,"F4\i.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F4\i.lnk")
{
Run,"F4\i.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F4 & j Up::

if fileexist("F4\j.url")
{
Run,"F4\j.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F4\j.lnk")
{
Run,"F4\j.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F4 & k Up::

if fileexist("F4\k.url")
{
Run,"F4\k.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F4\k.lnk")
{
Run,"F4\k.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F4 & l Up::

if fileexist("F4\l.url")
{
Run,"F4\l.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F4\l.lnk")
{
Run,"F4\l.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F4 & m Up::

if fileexist("F4\m.url")
{
Run,"F4\m.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F4\m.lnk")
{
Run,"F4\m.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F4 & n Up::

if fileexist("F4\n.url")
{
Run,"F4\n.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F4\n.lnk")
{
Run,"F4\n.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F4 & o Up::

if fileexist("F4\o.url")
{
Run,"F4\o.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F4\o.lnk")
{
Run,"F4\o.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F4 & p Up::

if fileexist("F4\p.url")
{
Run,"F4\p.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F4\p.lnk")
{
Run,"F4\p.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F4 & q Up::

if fileexist("F4\q.url")
{
Run,"F4\q.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F4\q.lnk")
{
Run,"F4\q.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F4 & r Up::

if fileexist("F4\r.url")
{
Run,"F4\r.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F4\r.lnk")
{
Run,"F4\r.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F4 & s Up::

if fileexist("F4\s.url")
{
Run,"F4\s.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F4\s.lnk")
{
Run,"F4\s.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F4 & t Up::

if fileexist("F4\t.url")
{
Run,"F4\t.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F4\t.lnk")
{
Run,"F4\t.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F4 & u Up::

if fileexist("F4\u.url")
{
Run,"F4\u.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F4\u.lnk")
{
Run,"F4\u.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F4 & v Up::

if fileexist("F4\v.url")
{
Run,"F4\v.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F4\v.lnk")
{
Run,"F4\v.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F4 & w Up::

if fileexist("F4\w.url")
{
Run,"F4\w.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F4\w.lnk")
{
Run,"F4\w.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F4 & x Up::

if fileexist("F4\x.url")
{
Run,"F4\x.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F4\x.lnk")
{
Run,"F4\x.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F4 & y Up::

if fileexist("F4\y.url")
{
Run,"F4\y.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F4\y.lnk")
{
Run,"F4\y.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F4 & z Up::

if fileexist("F4\z.url")
{
Run,"F4\z.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F4\z.lnk")
{
Run,"F4\z.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F4 & 1 Up::

if fileexist("F4\1.url")
{
Run,"F4\1.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F4\1.lnk")
{
Run,"F4\1.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F4 & 2 Up::

if fileexist("F4\2.url")
{
Run,"F4\2.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F4\2.lnk")
{
Run,"F4\2.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F4 & 3 Up::

if fileexist("F4\3.url")
{
Run,"F4\3.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F4\3.lnk")
{
Run,"F4\3.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F4 & 4 Up::

if fileexist("F4\4.url")
{
Run,"F4\4.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F4\4.lnk")
{
Run,"F4\4.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F4 & 5 Up::

if fileexist("F4\5.url")
{
Run,"F4\5.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F4\5.lnk")
{
Run,"F4\5.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F4 & 6 Up::

if fileexist("F4\6.url")
{
Run,"F4\6.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F4\6.lnk")
{
Run,"F4\6.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F4 & 7 Up::

if fileexist("F4\7.url")
{
Run,"F4\7.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F4\7.lnk")
{
Run,"F4\7.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F4 & 8 Up::

if fileexist("F4\8.url")
{
Run,"F4\8.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F4\8.lnk")
{
Run,"F4\8.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F4 & 9 Up::

if fileexist("F4\9.url")
{
Run,"F4\9.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F4\9.lnk")
{
Run,"F4\9.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F4 & 0 Up::

if fileexist("F4\0.url")
{
Run,"F4\0.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F4\0.lnk")
{
Run,"F4\0.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F5 & Enter Up::Run, F5

F5 & a Up::

if fileexist("F5\a.url")
{
Run,"F5\a.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F5\a.lnk")
{
Run,"F5\a.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F5 & b Up::

if fileexist("F5\b.url")
{
Run,"F5\b.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F5\b.lnk")
{
Run,"F5\b.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F5 & c Up::

if fileexist("F5\c.url")
{
Run,"F5\c.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F5\c.lnk")
{
Run,"F5\c.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F5 & d Up::

if fileexist("F5\d.url")
{
Run,"F5\d.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F5\d.lnk")
{
Run,"F5\d.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F5 & e Up::

if fileexist("F5\e.url")
{
Run,"F5\e.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F5\e.lnk")
{
Run,"F5\e.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F5 & f Up::

if fileexist("F5\f.url")
{
Run,"F5\f.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F5\f.lnk")
{
Run,"F5\f.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F5 & g Up::

if fileexist("F5\g.url")
{
Run,"F5\g.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F5\g.lnk")
{
Run,"F5\g.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F5 & h Up::

if fileexist("F5\h.url")
{
Run,"F5\h.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F5\h.lnk")
{
Run,"F5\h.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F5 & i Up::

if fileexist("F5\i.url")
{
Run,"F5\i.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F5\i.lnk")
{
Run,"F5\i.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F5 & j Up::

if fileexist("F5\j.url")
{
Run,"F5\j.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F5\j.lnk")
{
Run,"F5\j.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F5 & k Up::

if fileexist("F5\k.url")
{
Run,"F5\k.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F5\k.lnk")
{
Run,"F5\k.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F5 & l Up::

if fileexist("F5\l.url")
{
Run,"F5\l.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F5\l.lnk")
{
Run,"F5\l.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F5 & m Up::

if fileexist("F5\m.url")
{
Run,"F5\m.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F5\m.lnk")
{
Run,"F5\m.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F5 & n Up::

if fileexist("F5\n.url")
{
Run,"F5\n.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F5\n.lnk")
{
Run,"F5\n.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F5 & o Up::

if fileexist("F5\o.url")
{
Run,"F5\o.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F5\o.lnk")
{
Run,"F5\o.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F5 & p Up::

if fileexist("F5\p.url")
{
Run,"F5\p.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F5\p.lnk")
{
Run,"F5\p.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F5 & q Up::

if fileexist("F5\q.url")
{
Run,"F5\q.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F5\q.lnk")
{
Run,"F5\q.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F5 & r Up::

if fileexist("F5\r.url")
{
Run,"F5\r.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F5\r.lnk")
{
Run,"F5\r.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F5 & s Up::

if fileexist("F5\s.url")
{
Run,"F5\s.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F5\s.lnk")
{
Run,"F5\s.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F5 & t Up::

if fileexist("F5\t.url")
{
Run,"F5\t.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F5\t.lnk")
{
Run,"F5\t.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F5 & u Up::

if fileexist("F5\u.url")
{
Run,"F5\u.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F5\u.lnk")
{
Run,"F5\u.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F5 & v Up::

if fileexist("F5\v.url")
{
Run,"F5\v.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F5\v.lnk")
{
Run,"F5\v.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F5 & w Up::

if fileexist("F5\w.url")
{
Run,"F5\w.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F5\w.lnk")
{
Run,"F5\w.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F5 & x Up::

if fileexist("F5\x.url")
{
Run,"F5\x.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F5\x.lnk")
{
Run,"F5\x.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F5 & y Up::

if fileexist("F5\y.url")
{
Run,"F5\y.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F5\y.lnk")
{
Run,"F5\y.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F5 & z Up::

if fileexist("F5\z.url")
{
Run,"F5\z.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F5\z.lnk")
{
Run,"F5\z.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F5 & 1 Up::

if fileexist("F5\1.url")
{
Run,"F5\1.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F5\1.lnk")
{
Run,"F5\1.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F5 & 2 Up::

if fileexist("F5\2.url")
{
Run,"F5\2.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F5\2.lnk")
{
Run,"F5\2.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F5 & 3 Up::

if fileexist("F5\3.url")
{
Run,"F5\3.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F5\3.lnk")
{
Run,"F5\3.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F5 & 4 Up::

if fileexist("F5\4.url")
{
Run,"F5\4.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F5\4.lnk")
{
Run,"F5\4.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F5 & 5 Up::

if fileexist("F5\5.url")
{
Run,"F5\5.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F5\5.lnk")
{
Run,"F5\5.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F5 & 6 Up::

if fileexist("F5\6.url")
{
Run,"F5\6.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F5\6.lnk")
{
Run,"F5\6.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F5 & 7 Up::

if fileexist("F5\7.url")
{
Run,"F5\7.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F5\7.lnk")
{
Run,"F5\7.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F5 & 8 Up::

if fileexist("F5\8.url")
{
Run,"F5\8.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F5\8.lnk")
{
Run,"F5\8.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F5 & 9 Up::

if fileexist("F5\9.url")
{
Run,"F5\9.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F5\9.lnk")
{
Run,"F5\9.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F5 & 0 Up::

if fileexist("F5\0.url")
{
Run,"F5\0.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F5\0.lnk")
{
Run,"F5\0.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F6 & Enter Up::Run, F6

F6 & a Up::

if fileexist("F6\a.url")
{
Run,"F6\a.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F6\a.lnk")
{
Run,"F6\a.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F6 & b Up::

if fileexist("F6\b.url")
{
Run,"F6\b.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F6\b.lnk")
{
Run,"F6\b.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F6 & c Up::

if fileexist("F6\c.url")
{
Run,"F6\c.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F6\c.lnk")
{
Run,"F6\c.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F6 & d Up::

if fileexist("F6\d.url")
{
Run,"F6\d.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F6\d.lnk")
{
Run,"F6\d.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F6 & e Up::

if fileexist("F6\e.url")
{
Run,"F6\e.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F6\e.lnk")
{
Run,"F6\e.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F6 & f Up::

if fileexist("F6\f.url")
{
Run,"F6\f.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F6\f.lnk")
{
Run,"F6\f.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F6 & g Up::

if fileexist("F6\g.url")
{
Run,"F6\g.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F6\g.lnk")
{
Run,"F6\g.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F6 & h Up::

if fileexist("F6\h.url")
{
Run,"F6\h.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F6\h.lnk")
{
Run,"F6\h.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F6 & i Up::

if fileexist("F6\i.url")
{
Run,"F6\i.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F6\i.lnk")
{
Run,"F6\i.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F6 & j Up::

if fileexist("F6\j.url")
{
Run,"F6\j.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F6\j.lnk")
{
Run,"F6\j.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F6 & k Up::

if fileexist("F6\k.url")
{
Run,"F6\k.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F6\k.lnk")
{
Run,"F6\k.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F6 & l Up::

if fileexist("F6\l.url")
{
Run,"F6\l.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F6\l.lnk")
{
Run,"F6\l.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F6 & m Up::

if fileexist("F6\m.url")
{
Run,"F6\m.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F6\m.lnk")
{
Run,"F6\m.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F6 & n Up::

if fileexist("F6\n.url")
{
Run,"F6\n.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F6\n.lnk")
{
Run,"F6\n.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F6 & o Up::

if fileexist("F6\o.url")
{
Run,"F6\o.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F6\o.lnk")
{
Run,"F6\o.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F6 & p Up::

if fileexist("F6\p.url")
{
Run,"F6\p.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F6\p.lnk")
{
Run,"F6\p.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F6 & q Up::

if fileexist("F6\q.url")
{
Run,"F6\q.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F6\q.lnk")
{
Run,"F6\q.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F6 & r Up::

if fileexist("F6\r.url")
{
Run,"F6\r.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F6\r.lnk")
{
Run,"F6\r.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F6 & s Up::

if fileexist("F6\s.url")
{
Run,"F6\s.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F6\s.lnk")
{
Run,"F6\s.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F6 & t Up::

if fileexist("F6\t.url")
{
Run,"F6\t.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F6\t.lnk")
{
Run,"F6\t.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F6 & u Up::

if fileexist("F6\u.url")
{
Run,"F6\u.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F6\u.lnk")
{
Run,"F6\u.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F6 & v Up::

if fileexist("F6\v.url")
{
Run,"F6\v.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F6\v.lnk")
{
Run,"F6\v.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F6 & w Up::

if fileexist("F6\w.url")
{
Run,"F6\w.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F6\w.lnk")
{
Run,"F6\w.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F6 & x Up::

if fileexist("F6\x.url")
{
Run,"F6\x.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F6\x.lnk")
{
Run,"F6\x.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F6 & y Up::

if fileexist("F6\y.url")
{
Run,"F6\y.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F6\y.lnk")
{
Run,"F6\y.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F6 & z Up::

if fileexist("F6\z.url")
{
Run,"F6\z.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F6\z.lnk")
{
Run,"F6\z.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F6 & 1 Up::

if fileexist("F6\1.url")
{
Run,"F6\1.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F6\1.lnk")
{
Run,"F6\1.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F6 & 2 Up::

if fileexist("F6\2.url")
{
Run,"F6\2.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F6\2.lnk")
{
Run,"F6\2.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F6 & 3 Up::

if fileexist("F6\3.url")
{
Run,"F6\3.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F6\3.lnk")
{
Run,"F6\3.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F6 & 4 Up::

if fileexist("F6\4.url")
{
Run,"F6\4.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F6\4.lnk")
{
Run,"F6\4.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F6 & 5 Up::

if fileexist("F6\5.url")
{
Run,"F6\5.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F6\5.lnk")
{
Run,"F6\5.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F6 & 6 Up::

if fileexist("F6\6.url")
{
Run,"F6\6.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F6\6.lnk")
{
Run,"F6\6.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F6 & 7 Up::

if fileexist("F6\7.url")
{
Run,"F6\7.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F6\7.lnk")
{
Run,"F6\7.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F6 & 8 Up::

if fileexist("F6\8.url")
{
Run,"F6\8.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F6\8.lnk")
{
Run,"F6\8.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F6 & 9 Up::

if fileexist("F6\9.url")
{
Run,"F6\9.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F6\9.lnk")
{
Run,"F6\9.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F6 & 0 Up::

if fileexist("F6\0.url")
{
Run,"F6\0.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F6\0.lnk")
{
Run,"F6\0.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F7 & Enter Up::Run, F7

F7 & a Up::

if fileexist("F7\a.url")
{
Run,"F7\a.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F7\a.lnk")
{
Run,"F7\a.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F7 & b Up::

if fileexist("F7\b.url")
{
Run,"F7\b.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F7\b.lnk")
{
Run,"F7\b.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F7 & c Up::

if fileexist("F7\c.url")
{
Run,"F7\c.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F7\c.lnk")
{
Run,"F7\c.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F7 & d Up::

if fileexist("F7\d.url")
{
Run,"F7\d.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F7\d.lnk")
{
Run,"F7\d.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F7 & e Up::

if fileexist("F7\e.url")
{
Run,"F7\e.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F7\e.lnk")
{
Run,"F7\e.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F7 & f Up::

if fileexist("F7\f.url")
{
Run,"F7\f.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F7\f.lnk")
{
Run,"F7\f.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F7 & g Up::

if fileexist("F7\g.url")
{
Run,"F7\g.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F7\g.lnk")
{
Run,"F7\g.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F7 & h Up::

if fileexist("F7\h.url")
{
Run,"F7\h.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F7\h.lnk")
{
Run,"F7\h.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F7 & i Up::

if fileexist("F7\i.url")
{
Run,"F7\i.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F7\i.lnk")
{
Run,"F7\i.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F7 & j Up::

if fileexist("F7\j.url")
{
Run,"F7\j.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F7\j.lnk")
{
Run,"F7\j.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F7 & k Up::

if fileexist("F7\k.url")
{
Run,"F7\k.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F7\k.lnk")
{
Run,"F7\k.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F7 & l Up::

if fileexist("F7\l.url")
{
Run,"F7\l.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F7\l.lnk")
{
Run,"F7\l.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F7 & m Up::

if fileexist("F7\m.url")
{
Run,"F7\m.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F7\m.lnk")
{
Run,"F7\m.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F7 & n Up::

if fileexist("F7\n.url")
{
Run,"F7\n.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F7\n.lnk")
{
Run,"F7\n.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F7 & o Up::

if fileexist("F7\o.url")
{
Run,"F7\o.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F7\o.lnk")
{
Run,"F7\o.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F7 & p Up::

if fileexist("F7\p.url")
{
Run,"F7\p.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F7\p.lnk")
{
Run,"F7\p.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F7 & q Up::

if fileexist("F7\q.url")
{
Run,"F7\q.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F7\q.lnk")
{
Run,"F7\q.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F7 & r Up::

if fileexist("F7\r.url")
{
Run,"F7\r.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F7\r.lnk")
{
Run,"F7\r.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F7 & s Up::

if fileexist("F7\s.url")
{
Run,"F7\s.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F7\s.lnk")
{
Run,"F7\s.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F7 & t Up::

if fileexist("F7\t.url")
{
Run,"F7\t.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F7\t.lnk")
{
Run,"F7\t.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F7 & u Up::

if fileexist("F7\u.url")
{
Run,"F7\u.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F7\u.lnk")
{
Run,"F7\u.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F7 & v Up::

if fileexist("F7\v.url")
{
Run,"F7\v.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F7\v.lnk")
{
Run,"F7\v.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F7 & w Up::

if fileexist("F7\w.url")
{
Run,"F7\w.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F7\w.lnk")
{
Run,"F7\w.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F7 & x Up::

if fileexist("F7\x.url")
{
Run,"F7\x.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F7\x.lnk")
{
Run,"F7\x.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F7 & y Up::

if fileexist("F7\y.url")
{
Run,"F7\y.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F7\y.lnk")
{
Run,"F7\y.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F7 & z Up::

if fileexist("F7\z.url")
{
Run,"F7\z.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F7\z.lnk")
{
Run,"F7\z.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F7 & 1 Up::

if fileexist("F7\1.url")
{
Run,"F7\1.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F7\1.lnk")
{
Run,"F7\1.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F7 & 2 Up::

if fileexist("F7\2.url")
{
Run,"F7\2.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F7\2.lnk")
{
Run,"F7\2.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F7 & 3 Up::

if fileexist("F7\3.url")
{
Run,"F7\3.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F7\3.lnk")
{
Run,"F7\3.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F7 & 4 Up::

if fileexist("F7\4.url")
{
Run,"F7\4.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F7\4.lnk")
{
Run,"F7\4.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F7 & 5 Up::

if fileexist("F7\5.url")
{
Run,"F7\5.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F7\5.lnk")
{
Run,"F7\5.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F7 & 6 Up::

if fileexist("F7\6.url")
{
Run,"F7\6.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F7\6.lnk")
{
Run,"F7\6.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F7 & 7 Up::

if fileexist("F7\7.url")
{
Run,"F7\7.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F7\7.lnk")
{
Run,"F7\7.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F7 & 8 Up::

if fileexist("F7\8.url")
{
Run,"F7\8.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F7\8.lnk")
{
Run,"F7\8.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F7 & 9 Up::

if fileexist("F7\9.url")
{
Run,"F7\9.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F7\9.lnk")
{
Run,"F7\9.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F7 & 0 Up::

if fileexist("F7\0.url")
{
Run,"F7\0.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F7\0.lnk")
{
Run,"F7\0.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F8 & Enter Up::Run, F8

F8 & a Up::

if fileexist("F8\a.url")
{
Run,"F8\a.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F8\a.lnk")
{
Run,"F8\a.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F8 & b Up::

if fileexist("F8\b.url")
{
Run,"F8\b.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F8\b.lnk")
{
Run,"F8\b.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F8 & c Up::

if fileexist("F8\c.url")
{
Run,"F8\c.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F8\c.lnk")
{
Run,"F8\c.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F8 & d Up::

if fileexist("F8\d.url")
{
Run,"F8\d.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F8\d.lnk")
{
Run,"F8\d.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F8 & e Up::

if fileexist("F8\e.url")
{
Run,"F8\e.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F8\e.lnk")
{
Run,"F8\e.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F8 & f Up::

if fileexist("F8\f.url")
{
Run,"F8\f.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F8\f.lnk")
{
Run,"F8\f.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F8 & g Up::

if fileexist("F8\g.url")
{
Run,"F8\g.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F8\g.lnk")
{
Run,"F8\g.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F8 & h Up::

if fileexist("F8\h.url")
{
Run,"F8\h.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F8\h.lnk")
{
Run,"F8\h.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F8 & i Up::

if fileexist("F8\i.url")
{
Run,"F8\i.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F8\i.lnk")
{
Run,"F8\i.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F8 & j Up::

if fileexist("F8\j.url")
{
Run,"F8\j.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F8\j.lnk")
{
Run,"F8\j.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F8 & k Up::

if fileexist("F8\k.url")
{
Run,"F8\k.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F8\k.lnk")
{
Run,"F8\k.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F8 & l Up::

if fileexist("F8\l.url")
{
Run,"F8\l.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F8\l.lnk")
{
Run,"F8\l.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F8 & m Up::

if fileexist("F8\m.url")
{
Run,"F8\m.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F8\m.lnk")
{
Run,"F8\m.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F8 & n Up::

if fileexist("F8\n.url")
{
Run,"F8\n.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F8\n.lnk")
{
Run,"F8\n.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F8 & o Up::

if fileexist("F8\o.url")
{
Run,"F8\o.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F8\o.lnk")
{
Run,"F8\o.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F8 & p Up::

if fileexist("F8\p.url")
{
Run,"F8\p.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F8\p.lnk")
{
Run,"F8\p.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F8 & q Up::

if fileexist("F8\q.url")
{
Run,"F8\q.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F8\q.lnk")
{
Run,"F8\q.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F8 & r Up::

if fileexist("F8\r.url")
{
Run,"F8\r.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F8\r.lnk")
{
Run,"F8\r.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F8 & s Up::

if fileexist("F8\s.url")
{
Run,"F8\s.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F8\s.lnk")
{
Run,"F8\s.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F8 & t Up::

if fileexist("F8\t.url")
{
Run,"F8\t.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F8\t.lnk")
{
Run,"F8\t.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F8 & u Up::

if fileexist("F8\u.url")
{
Run,"F8\u.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F8\u.lnk")
{
Run,"F8\u.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F8 & v Up::

if fileexist("F8\v.url")
{
Run,"F8\v.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F8\v.lnk")
{
Run,"F8\v.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F8 & w Up::

if fileexist("F8\w.url")
{
Run,"F8\w.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F8\w.lnk")
{
Run,"F8\w.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F8 & x Up::

if fileexist("F8\x.url")
{
Run,"F8\x.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F8\x.lnk")
{
Run,"F8\x.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F8 & y Up::

if fileexist("F8\y.url")
{
Run,"F8\y.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F8\y.lnk")
{
Run,"F8\y.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F8 & z Up::

if fileexist("F8\z.url")
{
Run,"F8\z.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F8\z.lnk")
{
Run,"F8\z.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F8 & 1 Up::

if fileexist("F8\1.url")
{
Run,"F8\1.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F8\1.lnk")
{
Run,"F8\1.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F8 & 2 Up::

if fileexist("F8\2.url")
{
Run,"F8\2.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F8\2.lnk")
{
Run,"F8\2.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F8 & 3 Up::

if fileexist("F8\3.url")
{
Run,"F8\3.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F8\3.lnk")
{
Run,"F8\3.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F8 & 4 Up::

if fileexist("F8\4.url")
{
Run,"F8\4.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F8\4.lnk")
{
Run,"F8\4.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F8 & 5 Up::

if fileexist("F8\5.url")
{
Run,"F8\5.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F8\5.lnk")
{
Run,"F8\5.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F8 & 6 Up::

if fileexist("F8\6.url")
{
Run,"F8\6.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F8\6.lnk")
{
Run,"F8\6.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F8 & 7 Up::

if fileexist("F8\7.url")
{
Run,"F8\7.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F8\7.lnk")
{
Run,"F8\7.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F8 & 8 Up::

if fileexist("F8\8.url")
{
Run,"F8\8.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F8\8.lnk")
{
Run,"F8\8.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F8 & 9 Up::

if fileexist("F8\9.url")
{
Run,"F8\9.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F8\9.lnk")
{
Run,"F8\9.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F8 & 0 Up::

if fileexist("F8\0.url")
{
Run,"F8\0.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F8\0.lnk")
{
Run,"F8\0.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F9 & Enter Up::Run, F9

F9 & a Up::

if fileexist("F9\a.url")
{
Run,"F9\a.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F9\a.lnk")
{
Run,"F9\a.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F9 & b Up::

if fileexist("F9\b.url")
{
Run,"F9\b.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F9\b.lnk")
{
Run,"F9\b.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F9 & c Up::

if fileexist("F9\c.url")
{
Run,"F9\c.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F9\c.lnk")
{
Run,"F9\c.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F9 & d Up::

if fileexist("F9\d.url")
{
Run,"F9\d.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F9\d.lnk")
{
Run,"F9\d.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F9 & e Up::

if fileexist("F9\e.url")
{
Run,"F9\e.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F9\e.lnk")
{
Run,"F9\e.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F9 & f Up::

if fileexist("F9\f.url")
{
Run,"F9\f.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F9\f.lnk")
{
Run,"F9\f.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F9 & g Up::

if fileexist("F9\g.url")
{
Run,"F9\g.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F9\g.lnk")
{
Run,"F9\g.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F9 & h Up::

if fileexist("F9\h.url")
{
Run,"F9\h.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F9\h.lnk")
{
Run,"F9\h.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F9 & i Up::

if fileexist("F9\i.url")
{
Run,"F9\i.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F9\i.lnk")
{
Run,"F9\i.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F9 & j Up::

if fileexist("F9\j.url")
{
Run,"F9\j.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F9\j.lnk")
{
Run,"F9\j.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F9 & k Up::

if fileexist("F9\k.url")
{
Run,"F9\k.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F9\k.lnk")
{
Run,"F9\k.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F9 & l Up::

if fileexist("F9\l.url")
{
Run,"F9\l.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F9\l.lnk")
{
Run,"F9\l.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F9 & m Up::

if fileexist("F9\m.url")
{
Run,"F9\m.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F9\m.lnk")
{
Run,"F9\m.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F9 & n Up::

if fileexist("F9\n.url")
{
Run,"F9\n.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F9\n.lnk")
{
Run,"F9\n.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F9 & o Up::

if fileexist("F9\o.url")
{
Run,"F9\o.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F9\o.lnk")
{
Run,"F9\o.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F9 & p Up::

if fileexist("F9\p.url")
{
Run,"F9\p.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F9\p.lnk")
{
Run,"F9\p.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F9 & q Up::

if fileexist("F9\q.url")
{
Run,"F9\q.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F9\q.lnk")
{
Run,"F9\q.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F9 & r Up::

if fileexist("F9\r.url")
{
Run,"F9\r.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F9\r.lnk")
{
Run,"F9\r.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F9 & s Up::

if fileexist("F9\s.url")
{
Run,"F9\s.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F9\s.lnk")
{
Run,"F9\s.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F9 & t Up::

if fileexist("F9\t.url")
{
Run,"F9\t.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F9\t.lnk")
{
Run,"F9\t.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F9 & u Up::

if fileexist("F9\u.url")
{
Run,"F9\u.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F9\u.lnk")
{
Run,"F9\u.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F9 & v Up::

if fileexist("F9\v.url")
{
Run,"F9\v.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F9\v.lnk")
{
Run,"F9\v.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F9 & w Up::

if fileexist("F9\w.url")
{
Run,"F9\w.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F9\w.lnk")
{
Run,"F9\w.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F9 & x Up::

if fileexist("F9\x.url")
{
Run,"F9\x.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F9\x.lnk")
{
Run,"F9\x.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F9 & y Up::

if fileexist("F9\y.url")
{
Run,"F9\y.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F9\y.lnk")
{
Run,"F9\y.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F9 & z Up::

if fileexist("F9\z.url")
{
Run,"F9\z.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F9\z.lnk")
{
Run,"F9\z.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F9 & 1 Up::

if fileexist("F9\1.url")
{
Run,"F9\1.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F9\1.lnk")
{
Run,"F9\1.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F9 & 2 Up::

if fileexist("F9\2.url")
{
Run,"F9\2.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F9\2.lnk")
{
Run,"F9\2.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F9 & 3 Up::

if fileexist("F9\3.url")
{
Run,"F9\3.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F9\3.lnk")
{
Run,"F9\3.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F9 & 4 Up::

if fileexist("F9\4.url")
{
Run,"F9\4.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F9\4.lnk")
{
Run,"F9\4.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F9 & 5 Up::

if fileexist("F9\5.url")
{
Run,"F9\5.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F9\5.lnk")
{
Run,"F9\5.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F9 & 6 Up::

if fileexist("F9\6.url")
{
Run,"F9\6.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F9\6.lnk")
{
Run,"F9\6.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F9 & 7 Up::

if fileexist("F9\7.url")
{
Run,"F9\7.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F9\7.lnk")
{
Run,"F9\7.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F9 & 8 Up::

if fileexist("F9\8.url")
{
Run,"F9\8.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F9\8.lnk")
{
Run,"F9\8.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F9 & 9 Up::

if fileexist("F9\9.url")
{
Run,"F9\9.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F9\9.lnk")
{
Run,"F9\9.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F9 & 0 Up::

if fileexist("F9\0.url")
{
Run,"F9\0.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F9\0.lnk")
{
Run,"F9\0.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F10 & Enter Up::Run, F10

F10 & a Up::

if fileexist("F10\a.url")
{
Run,"F10\a.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F10\a.lnk")
{
Run,"F10\a.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F10 & b Up::

if fileexist("F10\b.url")
{
Run,"F10\b.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F10\b.lnk")
{
Run,"F10\b.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F10 & c Up::

if fileexist("F10\c.url")
{
Run,"F10\c.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F10\c.lnk")
{
Run,"F10\c.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F10 & d Up::

if fileexist("F10\d.url")
{
Run,"F10\d.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F10\d.lnk")
{
Run,"F10\d.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F10 & e Up::

if fileexist("F10\e.url")
{
Run,"F10\e.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F10\e.lnk")
{
Run,"F10\e.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F10 & f Up::

if fileexist("F10\f.url")
{
Run,"F10\f.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F10\f.lnk")
{
Run,"F10\f.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F10 & g Up::

if fileexist("F10\g.url")
{
Run,"F10\g.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F10\g.lnk")
{
Run,"F10\g.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F10 & h Up::

if fileexist("F10\h.url")
{
Run,"F10\h.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F10\h.lnk")
{
Run,"F10\h.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F10 & i Up::

if fileexist("F10\i.url")
{
Run,"F10\i.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F10\i.lnk")
{
Run,"F10\i.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F10 & j Up::

if fileexist("F10\j.url")
{
Run,"F10\j.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F10\j.lnk")
{
Run,"F10\j.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F10 & k Up::

if fileexist("F10\k.url")
{
Run,"F10\k.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F10\k.lnk")
{
Run,"F10\k.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F10 & l Up::

if fileexist("F10\l.url")
{
Run,"F10\l.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F10\l.lnk")
{
Run,"F10\l.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F10 & m Up::

if fileexist("F10\m.url")
{
Run,"F10\m.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F10\m.lnk")
{
Run,"F10\m.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F10 & n Up::

if fileexist("F10\n.url")
{
Run,"F10\n.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F10\n.lnk")
{
Run,"F10\n.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F10 & o Up::

if fileexist("F10\o.url")
{
Run,"F10\o.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F10\o.lnk")
{
Run,"F10\o.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F10 & p Up::

if fileexist("F10\p.url")
{
Run,"F10\p.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F10\p.lnk")
{
Run,"F10\p.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F10 & q Up::

if fileexist("F10\q.url")
{
Run,"F10\q.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F10\q.lnk")
{
Run,"F10\q.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F10 & r Up::

if fileexist("F10\r.url")
{
Run,"F10\r.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F10\r.lnk")
{
Run,"F10\r.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F10 & s Up::

if fileexist("F10\s.url")
{
Run,"F10\s.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F10\s.lnk")
{
Run,"F10\s.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F10 & t Up::

if fileexist("F10\t.url")
{
Run,"F10\t.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F10\t.lnk")
{
Run,"F10\t.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F10 & u Up::

if fileexist("F10\u.url")
{
Run,"F10\u.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F10\u.lnk")
{
Run,"F10\u.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F10 & v Up::

if fileexist("F10\v.url")
{
Run,"F10\v.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F10\v.lnk")
{
Run,"F10\v.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F10 & w Up::

if fileexist("F10\w.url")
{
Run,"F10\w.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F10\w.lnk")
{
Run,"F10\w.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F10 & x Up::

if fileexist("F10\x.url")
{
Run,"F10\x.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F10\x.lnk")
{
Run,"F10\x.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F10 & y Up::

if fileexist("F10\y.url")
{
Run,"F10\y.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F10\y.lnk")
{
Run,"F10\y.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F10 & z Up::

if fileexist("F10\z.url")
{
Run,"F10\z.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F10\z.lnk")
{
Run,"F10\z.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F10 & 1 Up::

if fileexist("F10\1.url")
{
Run,"F10\1.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F10\1.lnk")
{
Run,"F10\1.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F10 & 2 Up::

if fileexist("F10\2.url")
{
Run,"F10\2.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F10\2.lnk")
{
Run,"F10\2.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F10 & 3 Up::

if fileexist("F10\3.url")
{
Run,"F10\3.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F10\3.lnk")
{
Run,"F10\3.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F10 & 4 Up::

if fileexist("F10\4.url")
{
Run,"F10\4.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F10\4.lnk")
{
Run,"F10\4.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F10 & 5 Up::

if fileexist("F10\5.url")
{
Run,"F10\5.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F10\5.lnk")
{
Run,"F10\5.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F10 & 6 Up::

if fileexist("F10\6.url")
{
Run,"F10\6.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F10\6.lnk")
{
Run,"F10\6.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F10 & 7 Up::

if fileexist("F10\7.url")
{
Run,"F10\7.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F10\7.lnk")
{
Run,"F10\7.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F10 & 8 Up::

if fileexist("F10\8.url")
{
Run,"F10\8.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F10\8.lnk")
{
Run,"F10\8.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F10 & 9 Up::

if fileexist("F10\9.url")
{
Run,"F10\9.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F10\9.lnk")
{
Run,"F10\9.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F10 & 0 Up::

if fileexist("F10\0.url")
{
Run,"F10\0.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F10\0.lnk")
{
Run,"F10\0.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F11 & Enter Up::Run, F11

F11 & a Up::

if fileexist("F11\a.url")
{
Run,"F11\a.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F11\a.lnk")
{
Run,"F11\a.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F11 & b Up::

if fileexist("F11\b.url")
{
Run,"F11\b.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F11\b.lnk")
{
Run,"F11\b.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F11 & c Up::

if fileexist("F11\c.url")
{
Run,"F11\c.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F11\c.lnk")
{
Run,"F11\c.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F11 & d Up::

if fileexist("F11\d.url")
{
Run,"F11\d.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F11\d.lnk")
{
Run,"F11\d.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F11 & e Up::

if fileexist("F11\e.url")
{
Run,"F11\e.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F11\e.lnk")
{
Run,"F11\e.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F11 & f Up::

if fileexist("F11\f.url")
{
Run,"F11\f.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F11\f.lnk")
{
Run,"F11\f.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F11 & g Up::

if fileexist("F11\g.url")
{
Run,"F11\g.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F11\g.lnk")
{
Run,"F11\g.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F11 & h Up::

if fileexist("F11\h.url")
{
Run,"F11\h.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F11\h.lnk")
{
Run,"F11\h.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F11 & i Up::

if fileexist("F11\i.url")
{
Run,"F11\i.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F11\i.lnk")
{
Run,"F11\i.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F11 & j Up::

if fileexist("F11\j.url")
{
Run,"F11\j.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F11\j.lnk")
{
Run,"F11\j.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F11 & k Up::

if fileexist("F11\k.url")
{
Run,"F11\k.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F11\k.lnk")
{
Run,"F11\k.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F11 & l Up::

if fileexist("F11\l.url")
{
Run,"F11\l.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F11\l.lnk")
{
Run,"F11\l.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F11 & m Up::

if fileexist("F11\m.url")
{
Run,"F11\m.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F11\m.lnk")
{
Run,"F11\m.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F11 & n Up::

if fileexist("F11\n.url")
{
Run,"F11\n.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F11\n.lnk")
{
Run,"F11\n.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F11 & o Up::

if fileexist("F11\o.url")
{
Run,"F11\o.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F11\o.lnk")
{
Run,"F11\o.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F11 & p Up::

if fileexist("F11\p.url")
{
Run,"F11\p.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F11\p.lnk")
{
Run,"F11\p.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F11 & q Up::

if fileexist("F11\q.url")
{
Run,"F11\q.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F11\q.lnk")
{
Run,"F11\q.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F11 & r Up::

if fileexist("F11\r.url")
{
Run,"F11\r.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F11\r.lnk")
{
Run,"F11\r.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F11 & s Up::

if fileexist("F11\s.url")
{
Run,"F11\s.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F11\s.lnk")
{
Run,"F11\s.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F11 & t Up::

if fileexist("F11\t.url")
{
Run,"F11\t.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F11\t.lnk")
{
Run,"F11\t.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F11 & u Up::

if fileexist("F11\u.url")
{
Run,"F11\u.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F11\u.lnk")
{
Run,"F11\u.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F11 & v Up::

if fileexist("F11\v.url")
{
Run,"F11\v.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F11\v.lnk")
{
Run,"F11\v.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F11 & w Up::

if fileexist("F11\w.url")
{
Run,"F11\w.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F11\w.lnk")
{
Run,"F11\w.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F11 & x Up::

if fileexist("F11\x.url")
{
Run,"F11\x.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F11\x.lnk")
{
Run,"F11\x.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F11 & y Up::

if fileexist("F11\y.url")
{
Run,"F11\y.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F11\y.lnk")
{
Run,"F11\y.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F11 & z Up::

if fileexist("F11\z.url")
{
Run,"F11\z.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F11\z.lnk")
{
Run,"F11\z.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F11 & 1 Up::

if fileexist("F11\1.url")
{
Run,"F11\1.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F11\1.lnk")
{
Run,"F11\1.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F11 & 2 Up::

if fileexist("F11\2.url")
{
Run,"F11\2.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F11\2.lnk")
{
Run,"F11\2.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F11 & 3 Up::

if fileexist("F11\3.url")
{
Run,"F11\3.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F11\3.lnk")
{
Run,"F11\3.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F11 & 4 Up::

if fileexist("F11\4.url")
{
Run,"F11\4.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F11\4.lnk")
{
Run,"F11\4.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F11 & 5 Up::

if fileexist("F11\5.url")
{
Run,"F11\5.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F11\5.lnk")
{
Run,"F11\5.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F11 & 6 Up::

if fileexist("F11\6.url")
{
Run,"F11\6.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F11\6.lnk")
{
Run,"F11\6.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F11 & 7 Up::

if fileexist("F11\7.url")
{
Run,"F11\7.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F11\7.lnk")
{
Run,"F11\7.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F11 & 8 Up::

if fileexist("F11\8.url")
{
Run,"F11\8.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F11\8.lnk")
{
Run,"F11\8.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F11 & 9 Up::

if fileexist("F11\9.url")
{
Run,"F11\9.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F11\9.lnk")
{
Run,"F11\9.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F11 & 0 Up::

if fileexist("F11\0.url")
{
Run,"F11\0.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F11\0.lnk")
{
Run,"F11\0.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F12 & Enter Up::Run, F12

F12 & a Up::

if fileexist("F12\a.url")
{
Run,"F12\a.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F12\a.lnk")
{
Run,"F12\a.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F12 & b Up::

if fileexist("F12\b.url")
{
Run,"F12\b.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F12\b.lnk")
{
Run,"F12\b.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F12 & c Up::

if fileexist("F12\c.url")
{
Run,"F12\c.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F12\c.lnk")
{
Run,"F12\c.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F12 & d Up::

if fileexist("F12\d.url")
{
Run,"F12\d.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F12\d.lnk")
{
Run,"F12\d.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F12 & e Up::

if fileexist("F12\e.url")
{
Run,"F12\e.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F12\e.lnk")
{
Run,"F12\e.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F12 & f Up::

if fileexist("F12\f.url")
{
Run,"F12\f.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F12\f.lnk")
{
Run,"F12\f.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F12 & g Up::

if fileexist("F12\g.url")
{
Run,"F12\g.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F12\g.lnk")
{
Run,"F12\g.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F12 & h Up::

if fileexist("F12\h.url")
{
Run,"F12\h.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F12\h.lnk")
{
Run,"F12\h.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F12 & i Up::

if fileexist("F12\i.url")
{
Run,"F12\i.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F12\i.lnk")
{
Run,"F12\i.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F12 & j Up::

if fileexist("F12\j.url")
{
Run,"F12\j.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F12\j.lnk")
{
Run,"F12\j.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F12 & k Up::

if fileexist("F12\k.url")
{
Run,"F12\k.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F12\k.lnk")
{
Run,"F12\k.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F12 & l Up::

if fileexist("F12\l.url")
{
Run,"F12\l.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F12\l.lnk")
{
Run,"F12\l.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F12 & m Up::

if fileexist("F12\m.url")
{
Run,"F12\m.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F12\m.lnk")
{
Run,"F12\m.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F12 & n Up::

if fileexist("F12\n.url")
{
Run,"F12\n.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F12\n.lnk")
{
Run,"F12\n.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F12 & o Up::

if fileexist("F12\o.url")
{
Run,"F12\o.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F12\o.lnk")
{
Run,"F12\o.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F12 & p Up::

if fileexist("F12\p.url")
{
Run,"F12\p.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F12\p.lnk")
{
Run,"F12\p.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F12 & q Up::

if fileexist("F12\q.url")
{
Run,"F12\q.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F12\q.lnk")
{
Run,"F12\q.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F12 & r Up::

if fileexist("F12\r.url")
{
Run,"F12\r.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F12\r.lnk")
{
Run,"F12\r.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F12 & s Up::

if fileexist("F12\s.url")
{
Run,"F12\s.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F12\s.lnk")
{
Run,"F12\s.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F12 & t Up::

if fileexist("F12\t.url")
{
Run,"F12\t.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F12\t.lnk")
{
Run,"F12\t.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F12 & u Up::

if fileexist("F12\u.url")
{
Run,"F12\u.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F12\u.lnk")
{
Run,"F12\u.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F12 & v Up::

if fileexist("F12\v.url")
{
Run,"F12\v.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F12\v.lnk")
{
Run,"F12\v.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F12 & w Up::

if fileexist("F12\w.url")
{
Run,"F12\w.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F12\w.lnk")
{
Run,"F12\w.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F12 & x Up::

if fileexist("F12\x.url")
{
Run,"F12\x.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F12\x.lnk")
{
Run,"F12\x.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F12 & y Up::

if fileexist("F12\y.url")
{
Run,"F12\y.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F12\y.lnk")
{
Run,"F12\y.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F12 & z Up::

if fileexist("F12\z.url")
{
Run,"F12\z.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F12\z.lnk")
{
Run,"F12\z.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F12 & 1 Up::

if fileexist("F12\1.url")
{
Run,"F12\1.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F12\1.lnk")
{
Run,"F12\1.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F12 & 2 Up::

if fileexist("F12\2.url")
{
Run,"F12\2.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F12\2.lnk")
{
Run,"F12\2.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F12 & 3 Up::

if fileexist("F12\3.url")
{
Run,"F12\3.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F12\3.lnk")
{
Run,"F12\3.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F12 & 4 Up::

if fileexist("F12\4.url")
{
Run,"F12\4.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F12\4.lnk")
{
Run,"F12\4.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F12 & 5 Up::

if fileexist("F12\5.url")
{
Run,"F12\5.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F12\5.lnk")
{
Run,"F12\5.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F12 & 6 Up::

if fileexist("F12\6.url")
{
Run,"F12\6.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F12\6.lnk")
{
Run,"F12\6.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F12 & 7 Up::

if fileexist("F12\7.url")
{
Run,"F12\7.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F12\7.lnk")
{
Run,"F12\7.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F12 & 8 Up::

if fileexist("F12\8.url")
{
Run,"F12\8.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F12\8.lnk")
{
Run,"F12\8.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F12 & 9 Up::

if fileexist("F12\9.url")
{
Run,"F12\9.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F12\9.lnk")
{
Run,"F12\9.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return

F12 & 0 Up::

if fileexist("F12\0.url")
{
Run,"F12\0.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

if fileexist("F12\0.lnk")
{
Run,"F12\0.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}

return