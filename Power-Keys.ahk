#SingleInstance ignore
#MaxHotkeysPerInterval 1000
#Persistent
#InstallKeybdHook
#NoTrayIcon

v:="0.4.0"

if A_IsAdmin
exitapp

RegWrite,REG_DWORD,HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced,SeparateProcess,0
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

Menu, tray, NoStandard
Menu, tray, add, Power Keys %v% by Tom Zhu,Autorun
Menu, tray, disable, Power Keys %v% by Tom Zhu
Menu, tray, add
Menu, tray, add, 开机自启 (&A), Autorun
Menu, tray, add, 配置热键 (&C), Config
Menu, tray, add
Menu, tray, add, 帮助 (&H), Help
Menu, tray, add, 反馈 (&F), Feedback
Menu, tray, add
Menu, tray, add, 重启 Power Keys (&R), Restart
Menu, tray, add, 退出 Power Keys (&Q), Exit

RegRead, AutorunState, HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run, Power Keys
if AutorunState=%A_ScriptFullPath%
{
	Menu,tray,check,开机自启 (&A)
}
else
{
	Menu,tray,uncheck,开机自启 (&A)
}

return

Autorun:
RegRead, AutorunState, HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run, Power Keys
if AutorunState=%A_ScriptFullPath%
{
regdelete,HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run, Power Keys
Menu,tray,uncheck,开机自启 (&A)
}
else
{
RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run, Power Keys, %A_ScriptFullPath%
Menu,tray,check,开机自启 (&A)
}
return

Exit:
ExitApp
return

Config:
Run,%A_WorkingDir%
return

Help:
Run,%systemroot%\explorer.exe https://github.com/szzhiyang/PerfectWindows/blob/master/README.md
return

Feedback:
Run,%systemroot%\explorer.exe https://github.com/szzhiyang/PerfectWindows/issues
return

Restart:
Run,"%A_ScriptFullPath%" /restart
return

#=::Volume_Up
#-::Volume_Down

#,::Media_Prev
#.::Media_Next
#'::Media_Play_Pause

#Enter::^#d
#BackSpace::^#F4
#[::^#Left
#]::^#Right

#Esc::Send !{F4}
<#`::AltTab

#NumLock::run,%systemroot%\explorer.exe "%systemroot%\system32\calc.exe"

#0::run,%systemroot%\explorer.exe "%systemroot%\system32\calc.exe"

#CapsLock::winset,AlwaysOnTop,, A

#Delete::Run ::{645ff040-5081-101b-9f08-00aa002f954e}

#End::
Keywait,LWin
Keywait,RWin
DllCall("PowrProf\SetSuspendState", "int", 1, "int", 0, "int", 1)
return

#/::
menu,tray,show
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

F1 & Alt::F1
F2 & Alt::F2
F3 & Alt::F3
F4 & Alt::F4
F5 & Alt::F5
F6 & Alt::F6
F7 & Alt::F7
F8 & Alt::F8
F9 & Alt::F9
F10 & Alt::F10
F11 & Alt::F11
F12 & Alt::F12

F1 & Ctrl::F1
F2 & Ctrl::F2
F3 & Ctrl::F3
F4 & Ctrl::F4
F5 & Ctrl::F5
F6 & Ctrl::F6
F7 & Ctrl::F7
F8 & Ctrl::F8
F9 & Ctrl::F9
F10 & Ctrl::F10
F11 & Ctrl::F11
F12 & Ctrl::F12

F1 & LWin::F1
F2 & LWin::F2
F3 & LWin::F3
F4 & LWin::F4
F5 & LWin::F5
F6 & LWin::F6
F7 & LWin::F7
F8 & LWin::F8
F9 & LWin::F9
F10 & LWin::F10
F11 & LWin::F11
F12 & LWin::F12

F1 & RWin::F1
F2 & RWin::F2
F3 & RWin::F3
F4 & RWin::F4
F5 & RWin::F5
F6 & RWin::F6
F7 & RWin::F7
F8 & RWin::F8
F9 & RWin::F9
F10 & RWin::F10
F11 & RWin::F11
F12 & RWin::F12

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

F1 & Esc::Run,"%A_ScriptFullPath%" /restart
F2 & Esc::Run,"%A_ScriptFullPath%" /restart
F3 & Esc::Run,"%A_ScriptFullPath%" /restart
F4 & Esc::Run,"%A_ScriptFullPath%" /restart
F5 & Esc::Run,"%A_ScriptFullPath%" /restart
F6 & Esc::Run,"%A_ScriptFullPath%" /restart
F7 & Esc::Run,"%A_ScriptFullPath%" /restart
F8 & Esc::Run,"%A_ScriptFullPath%" /restart
F9 & Esc::Run,"%A_ScriptFullPath%" /restart
F10 & Esc::Run,"%A_ScriptFullPath%" /restart
F11 & Esc::Run,"%A_ScriptFullPath%" /restart
F12 & Esc::Run,"%A_ScriptFullPath%" /restart

F1 & Enter::Run, F1

F1 & a::
if fileexist("F1\a.url")
{
Run, explorer.exe "F1\a.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F1\a.lnk")
Run, explorer.exe "F1\a.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F1 & b::
if fileexist("F1\b.url")
{
Run, explorer.exe "F1\b.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F1\b.lnk")
Run, explorer.exe "F1\b.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F1 & c::
if fileexist("F1\c.url")
{
Run, explorer.exe "F1\c.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F1\c.lnk")
Run, explorer.exe "F1\c.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F1 & d::
if fileexist("F1\d.url")
{
Run, explorer.exe "F1\d.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F1\d.lnk")
Run, explorer.exe "F1\d.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F1 & e::
if fileexist("F1\e.url")
{
Run, explorer.exe "F1\e.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F1\e.lnk")
Run, explorer.exe "F1\e.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F1 & f::
if fileexist("F1\f.url")
{
Run, explorer.exe "F1\f.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F1\f.lnk")
Run, explorer.exe "F1\f.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F1 & g::
if fileexist("F1\g.url")
{
Run, explorer.exe "F1\g.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F1\g.lnk")
Run, explorer.exe "F1\g.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F1 & h::
if fileexist("F1\h.url")
{
Run, explorer.exe "F1\h.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F1\h.lnk")
Run, explorer.exe "F1\h.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F1 & i::
if fileexist("F1\i.url")
{
Run, explorer.exe "F1\i.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F1\i.lnk")
Run, explorer.exe "F1\i.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F1 & j::
if fileexist("F1\j.url")
{
Run, explorer.exe "F1\j.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F1\j.lnk")
Run, explorer.exe "F1\j.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F1 & k::
if fileexist("F1\k.url")
{
Run, explorer.exe "F1\k.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F1\k.lnk")
Run, explorer.exe "F1\k.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F1 & l::
if fileexist("F1\l.url")
{
Run, explorer.exe "F1\l.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F1\l.lnk")
Run, explorer.exe "F1\l.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F1 & m::
if fileexist("F1\m.url")
{
Run, explorer.exe "F1\m.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F1\m.lnk")
Run, explorer.exe "F1\m.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F1 & n::
if fileexist("F1\n.url")
{
Run, explorer.exe "F1\n.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F1\n.lnk")
Run, explorer.exe "F1\n.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F1 & o::
if fileexist("F1\o.url")
{
Run, explorer.exe "F1\o.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F1\o.lnk")
Run, explorer.exe "F1\o.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F1 & p::
if fileexist("F1\p.url")
{
Run, explorer.exe "F1\p.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F1\p.lnk")
Run, explorer.exe "F1\p.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F1 & q::
if fileexist("F1\q.url")
{
Run, explorer.exe "F1\q.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F1\q.lnk")
Run, explorer.exe "F1\q.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F1 & r::
if fileexist("F1\r.url")
{
Run, explorer.exe "F1\r.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F1\r.lnk")
Run, explorer.exe "F1\r.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F1 & s::
if fileexist("F1\s.url")
{
Run, explorer.exe "F1\s.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F1\s.lnk")
Run, explorer.exe "F1\s.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F1 & t::
if fileexist("F1\t.url")
{
Run, explorer.exe "F1\t.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F1\t.lnk")
Run, explorer.exe "F1\t.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F1 & u::
if fileexist("F1\u.url")
{
Run, explorer.exe "F1\u.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F1\u.lnk")
Run, explorer.exe "F1\u.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F1 & v::
if fileexist("F1\v.url")
{
Run, explorer.exe "F1\v.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F1\v.lnk")
Run, explorer.exe "F1\v.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F1 & w::
if fileexist("F1\w.url")
{
Run, explorer.exe "F1\w.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F1\w.lnk")
Run, explorer.exe "F1\w.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F1 & x::
if fileexist("F1\x.url")
{
Run, explorer.exe "F1\x.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F1\x.lnk")
Run, explorer.exe "F1\x.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F1 & y::
if fileexist("F1\y.url")
{
Run, explorer.exe "F1\y.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F1\y.lnk")
Run, explorer.exe "F1\y.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F1 & z::
if fileexist("F1\z.url")
{
Run, explorer.exe "F1\z.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F1\z.lnk")
Run, explorer.exe "F1\z.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F1 & 1::
if fileexist("F1\1.url")
{
Run, explorer.exe "F1\1.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F1\1.lnk")
Run, explorer.exe "F1\1.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F1 & 2::
if fileexist("F1\2.url")
{
Run, explorer.exe "F1\2.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F1\2.lnk")
Run, explorer.exe "F1\2.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F1 & 3::
if fileexist("F1\3.url")
{
Run, explorer.exe "F1\3.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F1\3.lnk")
Run, explorer.exe "F1\3.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F1 & 4::
if fileexist("F1\4.url")
{
Run, explorer.exe "F1\4.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F1\4.lnk")
Run, explorer.exe "F1\4.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F1 & 5::
if fileexist("F1\5.url")
{
Run, explorer.exe "F1\5.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F1\5.lnk")
Run, explorer.exe "F1\5.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F1 & 6::
if fileexist("F1\6.url")
{
Run, explorer.exe "F1\6.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F1\6.lnk")
Run, explorer.exe "F1\6.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F1 & 7::
if fileexist("F1\7.url")
{
Run, explorer.exe "F1\7.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F1\7.lnk")
Run, explorer.exe "F1\7.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F1 & 8::
if fileexist("F1\8.url")
{
Run, explorer.exe "F1\8.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F1\8.lnk")
Run, explorer.exe "F1\8.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F1 & 9::
if fileexist("F1\9.url")
{
Run, explorer.exe "F1\9.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F1\9.lnk")
Run, explorer.exe "F1\9.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F1 & 0::
if fileexist("F1\0.url")
{
Run, explorer.exe "F1\0.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F1\0.lnk")
Run, explorer.exe "F1\0.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F2 & Enter::Run, F2

F2 & a::
if fileexist("F2\a.url")
{
Run, explorer.exe "F2\a.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F2\a.lnk")
Run, explorer.exe "F2\a.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F2 & b::
if fileexist("F2\b.url")
{
Run, explorer.exe "F2\b.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F2\b.lnk")
Run, explorer.exe "F2\b.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F2 & c::
if fileexist("F2\c.url")
{
Run, explorer.exe "F2\c.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F2\c.lnk")
Run, explorer.exe "F2\c.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F2 & d::
if fileexist("F2\d.url")
{
Run, explorer.exe "F2\d.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F2\d.lnk")
Run, explorer.exe "F2\d.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F2 & e::
if fileexist("F2\e.url")
{
Run, explorer.exe "F2\e.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F2\e.lnk")
Run, explorer.exe "F2\e.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F2 & f::
if fileexist("F2\f.url")
{
Run, explorer.exe "F2\f.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F2\f.lnk")
Run, explorer.exe "F2\f.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F2 & g::
if fileexist("F2\g.url")
{
Run, explorer.exe "F2\g.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F2\g.lnk")
Run, explorer.exe "F2\g.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F2 & h::
if fileexist("F2\h.url")
{
Run, explorer.exe "F2\h.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F2\h.lnk")
Run, explorer.exe "F2\h.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F2 & i::
if fileexist("F2\i.url")
{
Run, explorer.exe "F2\i.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F2\i.lnk")
Run, explorer.exe "F2\i.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F2 & j::
if fileexist("F2\j.url")
{
Run, explorer.exe "F2\j.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F2\j.lnk")
Run, explorer.exe "F2\j.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F2 & k::
if fileexist("F2\k.url")
{
Run, explorer.exe "F2\k.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F2\k.lnk")
Run, explorer.exe "F2\k.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F2 & l::
if fileexist("F2\l.url")
{
Run, explorer.exe "F2\l.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F2\l.lnk")
Run, explorer.exe "F2\l.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F2 & m::
if fileexist("F2\m.url")
{
Run, explorer.exe "F2\m.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F2\m.lnk")
Run, explorer.exe "F2\m.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F2 & n::
if fileexist("F2\n.url")
{
Run, explorer.exe "F2\n.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F2\n.lnk")
Run, explorer.exe "F2\n.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F2 & o::
if fileexist("F2\o.url")
{
Run, explorer.exe "F2\o.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F2\o.lnk")
Run, explorer.exe "F2\o.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F2 & p::
if fileexist("F2\p.url")
{
Run, explorer.exe "F2\p.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F2\p.lnk")
Run, explorer.exe "F2\p.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F2 & q::
if fileexist("F2\q.url")
{
Run, explorer.exe "F2\q.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F2\q.lnk")
Run, explorer.exe "F2\q.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F2 & r::
if fileexist("F2\r.url")
{
Run, explorer.exe "F2\r.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F2\r.lnk")
Run, explorer.exe "F2\r.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F2 & s::
if fileexist("F2\s.url")
{
Run, explorer.exe "F2\s.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F2\s.lnk")
Run, explorer.exe "F2\s.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F2 & t::
if fileexist("F2\t.url")
{
Run, explorer.exe "F2\t.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F2\t.lnk")
Run, explorer.exe "F2\t.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F2 & u::
if fileexist("F2\u.url")
{
Run, explorer.exe "F2\u.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F2\u.lnk")
Run, explorer.exe "F2\u.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F2 & v::
if fileexist("F2\v.url")
{
Run, explorer.exe "F2\v.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F2\v.lnk")
Run, explorer.exe "F2\v.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F2 & w::
if fileexist("F2\w.url")
{
Run, explorer.exe "F2\w.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F2\w.lnk")
Run, explorer.exe "F2\w.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F2 & x::
if fileexist("F2\x.url")
{
Run, explorer.exe "F2\x.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F2\x.lnk")
Run, explorer.exe "F2\x.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F2 & y::
if fileexist("F2\y.url")
{
Run, explorer.exe "F2\y.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F2\y.lnk")
Run, explorer.exe "F2\y.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F2 & z::
if fileexist("F2\z.url")
{
Run, explorer.exe "F2\z.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F2\z.lnk")
Run, explorer.exe "F2\z.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F2 & 1::
if fileexist("F2\1.url")
{
Run, explorer.exe "F2\1.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F2\1.lnk")
Run, explorer.exe "F2\1.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F2 & 2::
if fileexist("F2\2.url")
{
Run, explorer.exe "F2\2.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F2\2.lnk")
Run, explorer.exe "F2\2.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F2 & 3::
if fileexist("F2\3.url")
{
Run, explorer.exe "F2\3.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F2\3.lnk")
Run, explorer.exe "F2\3.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F2 & 4::
if fileexist("F2\4.url")
{
Run, explorer.exe "F2\4.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F2\4.lnk")
Run, explorer.exe "F2\4.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F2 & 5::
if fileexist("F2\5.url")
{
Run, explorer.exe "F2\5.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F2\5.lnk")
Run, explorer.exe "F2\5.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F2 & 6::
if fileexist("F2\6.url")
{
Run, explorer.exe "F2\6.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F2\6.lnk")
Run, explorer.exe "F2\6.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F2 & 7::
if fileexist("F2\7.url")
{
Run, explorer.exe "F2\7.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F2\7.lnk")
Run, explorer.exe "F2\7.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F2 & 8::
if fileexist("F2\8.url")
{
Run, explorer.exe "F2\8.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F2\8.lnk")
Run, explorer.exe "F2\8.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F2 & 9::
if fileexist("F2\9.url")
{
Run, explorer.exe "F2\9.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F2\9.lnk")
Run, explorer.exe "F2\9.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F2 & 0::
if fileexist("F2\0.url")
{
Run, explorer.exe "F2\0.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F2\0.lnk")
Run, explorer.exe "F2\0.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F3 & Enter::Run, F3

F3 & a::
if fileexist("F3\a.url")
{
Run, explorer.exe "F3\a.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F3\a.lnk")
Run, explorer.exe "F3\a.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F3 & b::
if fileexist("F3\b.url")
{
Run, explorer.exe "F3\b.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F3\b.lnk")
Run, explorer.exe "F3\b.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F3 & c::
if fileexist("F3\c.url")
{
Run, explorer.exe "F3\c.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F3\c.lnk")
Run, explorer.exe "F3\c.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F3 & d::
if fileexist("F3\d.url")
{
Run, explorer.exe "F3\d.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F3\d.lnk")
Run, explorer.exe "F3\d.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F3 & e::
if fileexist("F3\e.url")
{
Run, explorer.exe "F3\e.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F3\e.lnk")
Run, explorer.exe "F3\e.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F3 & f::
if fileexist("F3\f.url")
{
Run, explorer.exe "F3\f.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F3\f.lnk")
Run, explorer.exe "F3\f.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F3 & g::
if fileexist("F3\g.url")
{
Run, explorer.exe "F3\g.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F3\g.lnk")
Run, explorer.exe "F3\g.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F3 & h::
if fileexist("F3\h.url")
{
Run, explorer.exe "F3\h.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F3\h.lnk")
Run, explorer.exe "F3\h.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F3 & i::
if fileexist("F3\i.url")
{
Run, explorer.exe "F3\i.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F3\i.lnk")
Run, explorer.exe "F3\i.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F3 & j::
if fileexist("F3\j.url")
{
Run, explorer.exe "F3\j.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F3\j.lnk")
Run, explorer.exe "F3\j.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F3 & k::
if fileexist("F3\k.url")
{
Run, explorer.exe "F3\k.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F3\k.lnk")
Run, explorer.exe "F3\k.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F3 & l::
if fileexist("F3\l.url")
{
Run, explorer.exe "F3\l.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F3\l.lnk")
Run, explorer.exe "F3\l.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F3 & m::
if fileexist("F3\m.url")
{
Run, explorer.exe "F3\m.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F3\m.lnk")
Run, explorer.exe "F3\m.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F3 & n::
if fileexist("F3\n.url")
{
Run, explorer.exe "F3\n.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F3\n.lnk")
Run, explorer.exe "F3\n.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F3 & o::
if fileexist("F3\o.url")
{
Run, explorer.exe "F3\o.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F3\o.lnk")
Run, explorer.exe "F3\o.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F3 & p::
if fileexist("F3\p.url")
{
Run, explorer.exe "F3\p.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F3\p.lnk")
Run, explorer.exe "F3\p.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F3 & q::
if fileexist("F3\q.url")
{
Run, explorer.exe "F3\q.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F3\q.lnk")
Run, explorer.exe "F3\q.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F3 & r::
if fileexist("F3\r.url")
{
Run, explorer.exe "F3\r.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F3\r.lnk")
Run, explorer.exe "F3\r.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F3 & s::
if fileexist("F3\s.url")
{
Run, explorer.exe "F3\s.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F3\s.lnk")
Run, explorer.exe "F3\s.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F3 & t::
if fileexist("F3\t.url")
{
Run, explorer.exe "F3\t.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F3\t.lnk")
Run, explorer.exe "F3\t.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F3 & u::
if fileexist("F3\u.url")
{
Run, explorer.exe "F3\u.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F3\u.lnk")
Run, explorer.exe "F3\u.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F3 & v::
if fileexist("F3\v.url")
{
Run, explorer.exe "F3\v.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F3\v.lnk")
Run, explorer.exe "F3\v.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F3 & w::
if fileexist("F3\w.url")
{
Run, explorer.exe "F3\w.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F3\w.lnk")
Run, explorer.exe "F3\w.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F3 & x::
if fileexist("F3\x.url")
{
Run, explorer.exe "F3\x.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F3\x.lnk")
Run, explorer.exe "F3\x.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F3 & y::
if fileexist("F3\y.url")
{
Run, explorer.exe "F3\y.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F3\y.lnk")
Run, explorer.exe "F3\y.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F3 & z::
if fileexist("F3\z.url")
{
Run, explorer.exe "F3\z.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F3\z.lnk")
Run, explorer.exe "F3\z.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F3 & 1::
if fileexist("F3\1.url")
{
Run, explorer.exe "F3\1.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F3\1.lnk")
Run, explorer.exe "F3\1.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F3 & 2::
if fileexist("F3\2.url")
{
Run, explorer.exe "F3\2.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F3\2.lnk")
Run, explorer.exe "F3\2.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F3 & 3::
if fileexist("F3\3.url")
{
Run, explorer.exe "F3\3.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F3\3.lnk")
Run, explorer.exe "F3\3.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F3 & 4::
if fileexist("F3\4.url")
{
Run, explorer.exe "F3\4.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F3\4.lnk")
Run, explorer.exe "F3\4.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F3 & 5::
if fileexist("F3\5.url")
{
Run, explorer.exe "F3\5.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F3\5.lnk")
Run, explorer.exe "F3\5.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F3 & 6::
if fileexist("F3\6.url")
{
Run, explorer.exe "F3\6.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F3\6.lnk")
Run, explorer.exe "F3\6.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F3 & 7::
if fileexist("F3\7.url")
{
Run, explorer.exe "F3\7.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F3\7.lnk")
Run, explorer.exe "F3\7.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F3 & 8::
if fileexist("F3\8.url")
{
Run, explorer.exe "F3\8.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F3\8.lnk")
Run, explorer.exe "F3\8.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F3 & 9::
if fileexist("F3\9.url")
{
Run, explorer.exe "F3\9.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F3\9.lnk")
Run, explorer.exe "F3\9.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F3 & 0::
if fileexist("F3\0.url")
{
Run, explorer.exe "F3\0.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F3\0.lnk")
Run, explorer.exe "F3\0.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F4 & Enter::Run, F4

F4 & a::
if fileexist("F4\a.url")
{
Run, explorer.exe "F4\a.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F4\a.lnk")
Run, explorer.exe "F4\a.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F4 & b::
if fileexist("F4\b.url")
{
Run, explorer.exe "F4\b.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F4\b.lnk")
Run, explorer.exe "F4\b.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F4 & c::
if fileexist("F4\c.url")
{
Run, explorer.exe "F4\c.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F4\c.lnk")
Run, explorer.exe "F4\c.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F4 & d::
if fileexist("F4\d.url")
{
Run, explorer.exe "F4\d.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F4\d.lnk")
Run, explorer.exe "F4\d.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F4 & e::
if fileexist("F4\e.url")
{
Run, explorer.exe "F4\e.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F4\e.lnk")
Run, explorer.exe "F4\e.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F4 & f::
if fileexist("F4\f.url")
{
Run, explorer.exe "F4\f.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F4\f.lnk")
Run, explorer.exe "F4\f.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F4 & g::
if fileexist("F4\g.url")
{
Run, explorer.exe "F4\g.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F4\g.lnk")
Run, explorer.exe "F4\g.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F4 & h::
if fileexist("F4\h.url")
{
Run, explorer.exe "F4\h.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F4\h.lnk")
Run, explorer.exe "F4\h.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F4 & i::
if fileexist("F4\i.url")
{
Run, explorer.exe "F4\i.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F4\i.lnk")
Run, explorer.exe "F4\i.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F4 & j::
if fileexist("F4\j.url")
{
Run, explorer.exe "F4\j.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F4\j.lnk")
Run, explorer.exe "F4\j.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F4 & k::
if fileexist("F4\k.url")
{
Run, explorer.exe "F4\k.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F4\k.lnk")
Run, explorer.exe "F4\k.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F4 & l::
if fileexist("F4\l.url")
{
Run, explorer.exe "F4\l.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F4\l.lnk")
Run, explorer.exe "F4\l.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F4 & m::
if fileexist("F4\m.url")
{
Run, explorer.exe "F4\m.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F4\m.lnk")
Run, explorer.exe "F4\m.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F4 & n::
if fileexist("F4\n.url")
{
Run, explorer.exe "F4\n.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F4\n.lnk")
Run, explorer.exe "F4\n.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F4 & o::
if fileexist("F4\o.url")
{
Run, explorer.exe "F4\o.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F4\o.lnk")
Run, explorer.exe "F4\o.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F4 & p::
if fileexist("F4\p.url")
{
Run, explorer.exe "F4\p.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F4\p.lnk")
Run, explorer.exe "F4\p.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F4 & q::
if fileexist("F4\q.url")
{
Run, explorer.exe "F4\q.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F4\q.lnk")
Run, explorer.exe "F4\q.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F4 & r::
if fileexist("F4\r.url")
{
Run, explorer.exe "F4\r.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F4\r.lnk")
Run, explorer.exe "F4\r.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F4 & s::
if fileexist("F4\s.url")
{
Run, explorer.exe "F4\s.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F4\s.lnk")
Run, explorer.exe "F4\s.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F4 & t::
if fileexist("F4\t.url")
{
Run, explorer.exe "F4\t.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F4\t.lnk")
Run, explorer.exe "F4\t.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F4 & u::
if fileexist("F4\u.url")
{
Run, explorer.exe "F4\u.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F4\u.lnk")
Run, explorer.exe "F4\u.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F4 & v::
if fileexist("F4\v.url")
{
Run, explorer.exe "F4\v.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F4\v.lnk")
Run, explorer.exe "F4\v.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F4 & w::
if fileexist("F4\w.url")
{
Run, explorer.exe "F4\w.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F4\w.lnk")
Run, explorer.exe "F4\w.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F4 & x::
if fileexist("F4\x.url")
{
Run, explorer.exe "F4\x.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F4\x.lnk")
Run, explorer.exe "F4\x.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F4 & y::
if fileexist("F4\y.url")
{
Run, explorer.exe "F4\y.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F4\y.lnk")
Run, explorer.exe "F4\y.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F4 & z::
if fileexist("F4\z.url")
{
Run, explorer.exe "F4\z.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F4\z.lnk")
Run, explorer.exe "F4\z.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F4 & 1::
if fileexist("F4\1.url")
{
Run, explorer.exe "F4\1.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F4\1.lnk")
Run, explorer.exe "F4\1.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F4 & 2::
if fileexist("F4\2.url")
{
Run, explorer.exe "F4\2.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F4\2.lnk")
Run, explorer.exe "F4\2.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F4 & 3::
if fileexist("F4\3.url")
{
Run, explorer.exe "F4\3.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F4\3.lnk")
Run, explorer.exe "F4\3.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F4 & 4::
if fileexist("F4\4.url")
{
Run, explorer.exe "F4\4.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F4\4.lnk")
Run, explorer.exe "F4\4.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F4 & 5::
if fileexist("F4\5.url")
{
Run, explorer.exe "F4\5.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F4\5.lnk")
Run, explorer.exe "F4\5.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F4 & 6::
if fileexist("F4\6.url")
{
Run, explorer.exe "F4\6.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F4\6.lnk")
Run, explorer.exe "F4\6.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F4 & 7::
if fileexist("F4\7.url")
{
Run, explorer.exe "F4\7.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F4\7.lnk")
Run, explorer.exe "F4\7.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F4 & 8::
if fileexist("F4\8.url")
{
Run, explorer.exe "F4\8.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F4\8.lnk")
Run, explorer.exe "F4\8.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F4 & 9::
if fileexist("F4\9.url")
{
Run, explorer.exe "F4\9.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F4\9.lnk")
Run, explorer.exe "F4\9.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F4 & 0::
if fileexist("F4\0.url")
{
Run, explorer.exe "F4\0.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F4\0.lnk")
Run, explorer.exe "F4\0.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F5 & Enter::Run, F5

F5 & a::
if fileexist("F5\a.url")
{
Run, explorer.exe "F5\a.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F5\a.lnk")
Run, explorer.exe "F5\a.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F5 & b::
if fileexist("F5\b.url")
{
Run, explorer.exe "F5\b.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F5\b.lnk")
Run, explorer.exe "F5\b.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F5 & c::
if fileexist("F5\c.url")
{
Run, explorer.exe "F5\c.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F5\c.lnk")
Run, explorer.exe "F5\c.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F5 & d::
if fileexist("F5\d.url")
{
Run, explorer.exe "F5\d.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F5\d.lnk")
Run, explorer.exe "F5\d.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F5 & e::
if fileexist("F5\e.url")
{
Run, explorer.exe "F5\e.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F5\e.lnk")
Run, explorer.exe "F5\e.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F5 & f::
if fileexist("F5\f.url")
{
Run, explorer.exe "F5\f.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F5\f.lnk")
Run, explorer.exe "F5\f.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F5 & g::
if fileexist("F5\g.url")
{
Run, explorer.exe "F5\g.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F5\g.lnk")
Run, explorer.exe "F5\g.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F5 & h::
if fileexist("F5\h.url")
{
Run, explorer.exe "F5\h.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F5\h.lnk")
Run, explorer.exe "F5\h.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F5 & i::
if fileexist("F5\i.url")
{
Run, explorer.exe "F5\i.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F5\i.lnk")
Run, explorer.exe "F5\i.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F5 & j::
if fileexist("F5\j.url")
{
Run, explorer.exe "F5\j.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F5\j.lnk")
Run, explorer.exe "F5\j.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F5 & k::
if fileexist("F5\k.url")
{
Run, explorer.exe "F5\k.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F5\k.lnk")
Run, explorer.exe "F5\k.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F5 & l::
if fileexist("F5\l.url")
{
Run, explorer.exe "F5\l.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F5\l.lnk")
Run, explorer.exe "F5\l.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F5 & m::
if fileexist("F5\m.url")
{
Run, explorer.exe "F5\m.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F5\m.lnk")
Run, explorer.exe "F5\m.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F5 & n::
if fileexist("F5\n.url")
{
Run, explorer.exe "F5\n.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F5\n.lnk")
Run, explorer.exe "F5\n.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F5 & o::
if fileexist("F5\o.url")
{
Run, explorer.exe "F5\o.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F5\o.lnk")
Run, explorer.exe "F5\o.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F5 & p::
if fileexist("F5\p.url")
{
Run, explorer.exe "F5\p.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F5\p.lnk")
Run, explorer.exe "F5\p.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F5 & q::
if fileexist("F5\q.url")
{
Run, explorer.exe "F5\q.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F5\q.lnk")
Run, explorer.exe "F5\q.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F5 & r::
if fileexist("F5\r.url")
{
Run, explorer.exe "F5\r.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F5\r.lnk")
Run, explorer.exe "F5\r.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F5 & s::
if fileexist("F5\s.url")
{
Run, explorer.exe "F5\s.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F5\s.lnk")
Run, explorer.exe "F5\s.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F5 & t::
if fileexist("F5\t.url")
{
Run, explorer.exe "F5\t.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F5\t.lnk")
Run, explorer.exe "F5\t.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F5 & u::
if fileexist("F5\u.url")
{
Run, explorer.exe "F5\u.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F5\u.lnk")
Run, explorer.exe "F5\u.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F5 & v::
if fileexist("F5\v.url")
{
Run, explorer.exe "F5\v.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F5\v.lnk")
Run, explorer.exe "F5\v.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F5 & w::
if fileexist("F5\w.url")
{
Run, explorer.exe "F5\w.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F5\w.lnk")
Run, explorer.exe "F5\w.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F5 & x::
if fileexist("F5\x.url")
{
Run, explorer.exe "F5\x.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F5\x.lnk")
Run, explorer.exe "F5\x.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F5 & y::
if fileexist("F5\y.url")
{
Run, explorer.exe "F5\y.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F5\y.lnk")
Run, explorer.exe "F5\y.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F5 & z::
if fileexist("F5\z.url")
{
Run, explorer.exe "F5\z.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F5\z.lnk")
Run, explorer.exe "F5\z.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F5 & 1::
if fileexist("F5\1.url")
{
Run, explorer.exe "F5\1.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F5\1.lnk")
Run, explorer.exe "F5\1.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F5 & 2::
if fileexist("F5\2.url")
{
Run, explorer.exe "F5\2.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F5\2.lnk")
Run, explorer.exe "F5\2.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F5 & 3::
if fileexist("F5\3.url")
{
Run, explorer.exe "F5\3.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F5\3.lnk")
Run, explorer.exe "F5\3.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F5 & 4::
if fileexist("F5\4.url")
{
Run, explorer.exe "F5\4.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F5\4.lnk")
Run, explorer.exe "F5\4.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F5 & 5::
if fileexist("F5\5.url")
{
Run, explorer.exe "F5\5.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F5\5.lnk")
Run, explorer.exe "F5\5.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F5 & 6::
if fileexist("F5\6.url")
{
Run, explorer.exe "F5\6.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F5\6.lnk")
Run, explorer.exe "F5\6.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F5 & 7::
if fileexist("F5\7.url")
{
Run, explorer.exe "F5\7.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F5\7.lnk")
Run, explorer.exe "F5\7.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F5 & 8::
if fileexist("F5\8.url")
{
Run, explorer.exe "F5\8.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F5\8.lnk")
Run, explorer.exe "F5\8.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F5 & 9::
if fileexist("F5\9.url")
{
Run, explorer.exe "F5\9.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F5\9.lnk")
Run, explorer.exe "F5\9.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F5 & 0::
if fileexist("F5\0.url")
{
Run, explorer.exe "F5\0.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F5\0.lnk")
Run, explorer.exe "F5\0.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F6 & Enter::Run, F6

F6 & a::
if fileexist("F6\a.url")
{
Run, explorer.exe "F6\a.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F6\a.lnk")
Run, explorer.exe "F6\a.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F6 & b::
if fileexist("F6\b.url")
{
Run, explorer.exe "F6\b.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F6\b.lnk")
Run, explorer.exe "F6\b.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F6 & c::
if fileexist("F6\c.url")
{
Run, explorer.exe "F6\c.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F6\c.lnk")
Run, explorer.exe "F6\c.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F6 & d::
if fileexist("F6\d.url")
{
Run, explorer.exe "F6\d.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F6\d.lnk")
Run, explorer.exe "F6\d.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F6 & e::
if fileexist("F6\e.url")
{
Run, explorer.exe "F6\e.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F6\e.lnk")
Run, explorer.exe "F6\e.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F6 & f::
if fileexist("F6\f.url")
{
Run, explorer.exe "F6\f.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F6\f.lnk")
Run, explorer.exe "F6\f.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F6 & g::
if fileexist("F6\g.url")
{
Run, explorer.exe "F6\g.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F6\g.lnk")
Run, explorer.exe "F6\g.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F6 & h::
if fileexist("F6\h.url")
{
Run, explorer.exe "F6\h.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F6\h.lnk")
Run, explorer.exe "F6\h.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F6 & i::
if fileexist("F6\i.url")
{
Run, explorer.exe "F6\i.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F6\i.lnk")
Run, explorer.exe "F6\i.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F6 & j::
if fileexist("F6\j.url")
{
Run, explorer.exe "F6\j.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F6\j.lnk")
Run, explorer.exe "F6\j.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F6 & k::
if fileexist("F6\k.url")
{
Run, explorer.exe "F6\k.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F6\k.lnk")
Run, explorer.exe "F6\k.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F6 & l::
if fileexist("F6\l.url")
{
Run, explorer.exe "F6\l.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F6\l.lnk")
Run, explorer.exe "F6\l.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F6 & m::
if fileexist("F6\m.url")
{
Run, explorer.exe "F6\m.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F6\m.lnk")
Run, explorer.exe "F6\m.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F6 & n::
if fileexist("F6\n.url")
{
Run, explorer.exe "F6\n.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F6\n.lnk")
Run, explorer.exe "F6\n.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F6 & o::
if fileexist("F6\o.url")
{
Run, explorer.exe "F6\o.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F6\o.lnk")
Run, explorer.exe "F6\o.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F6 & p::
if fileexist("F6\p.url")
{
Run, explorer.exe "F6\p.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F6\p.lnk")
Run, explorer.exe "F6\p.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F6 & q::
if fileexist("F6\q.url")
{
Run, explorer.exe "F6\q.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F6\q.lnk")
Run, explorer.exe "F6\q.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F6 & r::
if fileexist("F6\r.url")
{
Run, explorer.exe "F6\r.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F6\r.lnk")
Run, explorer.exe "F6\r.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F6 & s::
if fileexist("F6\s.url")
{
Run, explorer.exe "F6\s.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F6\s.lnk")
Run, explorer.exe "F6\s.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F6 & t::
if fileexist("F6\t.url")
{
Run, explorer.exe "F6\t.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F6\t.lnk")
Run, explorer.exe "F6\t.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F6 & u::
if fileexist("F6\u.url")
{
Run, explorer.exe "F6\u.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F6\u.lnk")
Run, explorer.exe "F6\u.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F6 & v::
if fileexist("F6\v.url")
{
Run, explorer.exe "F6\v.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F6\v.lnk")
Run, explorer.exe "F6\v.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F6 & w::
if fileexist("F6\w.url")
{
Run, explorer.exe "F6\w.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F6\w.lnk")
Run, explorer.exe "F6\w.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F6 & x::
if fileexist("F6\x.url")
{
Run, explorer.exe "F6\x.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F6\x.lnk")
Run, explorer.exe "F6\x.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F6 & y::
if fileexist("F6\y.url")
{
Run, explorer.exe "F6\y.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F6\y.lnk")
Run, explorer.exe "F6\y.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F6 & z::
if fileexist("F6\z.url")
{
Run, explorer.exe "F6\z.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F6\z.lnk")
Run, explorer.exe "F6\z.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F6 & 1::
if fileexist("F6\1.url")
{
Run, explorer.exe "F6\1.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F6\1.lnk")
Run, explorer.exe "F6\1.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F6 & 2::
if fileexist("F6\2.url")
{
Run, explorer.exe "F6\2.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F6\2.lnk")
Run, explorer.exe "F6\2.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F6 & 3::
if fileexist("F6\3.url")
{
Run, explorer.exe "F6\3.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F6\3.lnk")
Run, explorer.exe "F6\3.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F6 & 4::
if fileexist("F6\4.url")
{
Run, explorer.exe "F6\4.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F6\4.lnk")
Run, explorer.exe "F6\4.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F6 & 5::
if fileexist("F6\5.url")
{
Run, explorer.exe "F6\5.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F6\5.lnk")
Run, explorer.exe "F6\5.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F6 & 6::
if fileexist("F6\6.url")
{
Run, explorer.exe "F6\6.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F6\6.lnk")
Run, explorer.exe "F6\6.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F6 & 7::
if fileexist("F6\7.url")
{
Run, explorer.exe "F6\7.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F6\7.lnk")
Run, explorer.exe "F6\7.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F6 & 8::
if fileexist("F6\8.url")
{
Run, explorer.exe "F6\8.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F6\8.lnk")
Run, explorer.exe "F6\8.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F6 & 9::
if fileexist("F6\9.url")
{
Run, explorer.exe "F6\9.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F6\9.lnk")
Run, explorer.exe "F6\9.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F6 & 0::
if fileexist("F6\0.url")
{
Run, explorer.exe "F6\0.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F6\0.lnk")
Run, explorer.exe "F6\0.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F7 & Enter::Run, F7

F7 & a::
if fileexist("F7\a.url")
{
Run, explorer.exe "F7\a.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F7\a.lnk")
Run, explorer.exe "F7\a.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F7 & b::
if fileexist("F7\b.url")
{
Run, explorer.exe "F7\b.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F7\b.lnk")
Run, explorer.exe "F7\b.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F7 & c::
if fileexist("F7\c.url")
{
Run, explorer.exe "F7\c.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F7\c.lnk")
Run, explorer.exe "F7\c.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F7 & d::
if fileexist("F7\d.url")
{
Run, explorer.exe "F7\d.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F7\d.lnk")
Run, explorer.exe "F7\d.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F7 & e::
if fileexist("F7\e.url")
{
Run, explorer.exe "F7\e.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F7\e.lnk")
Run, explorer.exe "F7\e.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F7 & f::
if fileexist("F7\f.url")
{
Run, explorer.exe "F7\f.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F7\f.lnk")
Run, explorer.exe "F7\f.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F7 & g::
if fileexist("F7\g.url")
{
Run, explorer.exe "F7\g.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F7\g.lnk")
Run, explorer.exe "F7\g.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F7 & h::
if fileexist("F7\h.url")
{
Run, explorer.exe "F7\h.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F7\h.lnk")
Run, explorer.exe "F7\h.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F7 & i::
if fileexist("F7\i.url")
{
Run, explorer.exe "F7\i.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F7\i.lnk")
Run, explorer.exe "F7\i.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F7 & j::
if fileexist("F7\j.url")
{
Run, explorer.exe "F7\j.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F7\j.lnk")
Run, explorer.exe "F7\j.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F7 & k::
if fileexist("F7\k.url")
{
Run, explorer.exe "F7\k.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F7\k.lnk")
Run, explorer.exe "F7\k.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F7 & l::
if fileexist("F7\l.url")
{
Run, explorer.exe "F7\l.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F7\l.lnk")
Run, explorer.exe "F7\l.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F7 & m::
if fileexist("F7\m.url")
{
Run, explorer.exe "F7\m.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F7\m.lnk")
Run, explorer.exe "F7\m.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F7 & n::
if fileexist("F7\n.url")
{
Run, explorer.exe "F7\n.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F7\n.lnk")
Run, explorer.exe "F7\n.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F7 & o::
if fileexist("F7\o.url")
{
Run, explorer.exe "F7\o.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F7\o.lnk")
Run, explorer.exe "F7\o.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F7 & p::
if fileexist("F7\p.url")
{
Run, explorer.exe "F7\p.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F7\p.lnk")
Run, explorer.exe "F7\p.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F7 & q::
if fileexist("F7\q.url")
{
Run, explorer.exe "F7\q.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F7\q.lnk")
Run, explorer.exe "F7\q.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F7 & r::
if fileexist("F7\r.url")
{
Run, explorer.exe "F7\r.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F7\r.lnk")
Run, explorer.exe "F7\r.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F7 & s::
if fileexist("F7\s.url")
{
Run, explorer.exe "F7\s.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F7\s.lnk")
Run, explorer.exe "F7\s.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F7 & t::
if fileexist("F7\t.url")
{
Run, explorer.exe "F7\t.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F7\t.lnk")
Run, explorer.exe "F7\t.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F7 & u::
if fileexist("F7\u.url")
{
Run, explorer.exe "F7\u.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F7\u.lnk")
Run, explorer.exe "F7\u.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F7 & v::
if fileexist("F7\v.url")
{
Run, explorer.exe "F7\v.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F7\v.lnk")
Run, explorer.exe "F7\v.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F7 & w::
if fileexist("F7\w.url")
{
Run, explorer.exe "F7\w.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F7\w.lnk")
Run, explorer.exe "F7\w.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F7 & x::
if fileexist("F7\x.url")
{
Run, explorer.exe "F7\x.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F7\x.lnk")
Run, explorer.exe "F7\x.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F7 & y::
if fileexist("F7\y.url")
{
Run, explorer.exe "F7\y.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F7\y.lnk")
Run, explorer.exe "F7\y.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F7 & z::
if fileexist("F7\z.url")
{
Run, explorer.exe "F7\z.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F7\z.lnk")
Run, explorer.exe "F7\z.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F7 & 1::
if fileexist("F7\1.url")
{
Run, explorer.exe "F7\1.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F7\1.lnk")
Run, explorer.exe "F7\1.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F7 & 2::
if fileexist("F7\2.url")
{
Run, explorer.exe "F7\2.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F7\2.lnk")
Run, explorer.exe "F7\2.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F7 & 3::
if fileexist("F7\3.url")
{
Run, explorer.exe "F7\3.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F7\3.lnk")
Run, explorer.exe "F7\3.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F7 & 4::
if fileexist("F7\4.url")
{
Run, explorer.exe "F7\4.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F7\4.lnk")
Run, explorer.exe "F7\4.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F7 & 5::
if fileexist("F7\5.url")
{
Run, explorer.exe "F7\5.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F7\5.lnk")
Run, explorer.exe "F7\5.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F7 & 6::
if fileexist("F7\6.url")
{
Run, explorer.exe "F7\6.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F7\6.lnk")
Run, explorer.exe "F7\6.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F7 & 7::
if fileexist("F7\7.url")
{
Run, explorer.exe "F7\7.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F7\7.lnk")
Run, explorer.exe "F7\7.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F7 & 8::
if fileexist("F7\8.url")
{
Run, explorer.exe "F7\8.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F7\8.lnk")
Run, explorer.exe "F7\8.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F7 & 9::
if fileexist("F7\9.url")
{
Run, explorer.exe "F7\9.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F7\9.lnk")
Run, explorer.exe "F7\9.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F7 & 0::
if fileexist("F7\0.url")
{
Run, explorer.exe "F7\0.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F7\0.lnk")
Run, explorer.exe "F7\0.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F8 & Enter::Run, F8

F8 & a::
if fileexist("F8\a.url")
{
Run, explorer.exe "F8\a.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F8\a.lnk")
Run, explorer.exe "F8\a.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F8 & b::
if fileexist("F8\b.url")
{
Run, explorer.exe "F8\b.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F8\b.lnk")
Run, explorer.exe "F8\b.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F8 & c::
if fileexist("F8\c.url")
{
Run, explorer.exe "F8\c.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F8\c.lnk")
Run, explorer.exe "F8\c.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F8 & d::
if fileexist("F8\d.url")
{
Run, explorer.exe "F8\d.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F8\d.lnk")
Run, explorer.exe "F8\d.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F8 & e::
if fileexist("F8\e.url")
{
Run, explorer.exe "F8\e.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F8\e.lnk")
Run, explorer.exe "F8\e.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F8 & f::
if fileexist("F8\f.url")
{
Run, explorer.exe "F8\f.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F8\f.lnk")
Run, explorer.exe "F8\f.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F8 & g::
if fileexist("F8\g.url")
{
Run, explorer.exe "F8\g.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F8\g.lnk")
Run, explorer.exe "F8\g.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F8 & h::
if fileexist("F8\h.url")
{
Run, explorer.exe "F8\h.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F8\h.lnk")
Run, explorer.exe "F8\h.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F8 & i::
if fileexist("F8\i.url")
{
Run, explorer.exe "F8\i.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F8\i.lnk")
Run, explorer.exe "F8\i.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F8 & j::
if fileexist("F8\j.url")
{
Run, explorer.exe "F8\j.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F8\j.lnk")
Run, explorer.exe "F8\j.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F8 & k::
if fileexist("F8\k.url")
{
Run, explorer.exe "F8\k.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F8\k.lnk")
Run, explorer.exe "F8\k.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F8 & l::
if fileexist("F8\l.url")
{
Run, explorer.exe "F8\l.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F8\l.lnk")
Run, explorer.exe "F8\l.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F8 & m::
if fileexist("F8\m.url")
{
Run, explorer.exe "F8\m.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F8\m.lnk")
Run, explorer.exe "F8\m.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F8 & n::
if fileexist("F8\n.url")
{
Run, explorer.exe "F8\n.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F8\n.lnk")
Run, explorer.exe "F8\n.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F8 & o::
if fileexist("F8\o.url")
{
Run, explorer.exe "F8\o.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F8\o.lnk")
Run, explorer.exe "F8\o.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F8 & p::
if fileexist("F8\p.url")
{
Run, explorer.exe "F8\p.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F8\p.lnk")
Run, explorer.exe "F8\p.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F8 & q::
if fileexist("F8\q.url")
{
Run, explorer.exe "F8\q.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F8\q.lnk")
Run, explorer.exe "F8\q.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F8 & r::
if fileexist("F8\r.url")
{
Run, explorer.exe "F8\r.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F8\r.lnk")
Run, explorer.exe "F8\r.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F8 & s::
if fileexist("F8\s.url")
{
Run, explorer.exe "F8\s.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F8\s.lnk")
Run, explorer.exe "F8\s.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F8 & t::
if fileexist("F8\t.url")
{
Run, explorer.exe "F8\t.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F8\t.lnk")
Run, explorer.exe "F8\t.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F8 & u::
if fileexist("F8\u.url")
{
Run, explorer.exe "F8\u.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F8\u.lnk")
Run, explorer.exe "F8\u.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F8 & v::
if fileexist("F8\v.url")
{
Run, explorer.exe "F8\v.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F8\v.lnk")
Run, explorer.exe "F8\v.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F8 & w::
if fileexist("F8\w.url")
{
Run, explorer.exe "F8\w.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F8\w.lnk")
Run, explorer.exe "F8\w.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F8 & x::
if fileexist("F8\x.url")
{
Run, explorer.exe "F8\x.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F8\x.lnk")
Run, explorer.exe "F8\x.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F8 & y::
if fileexist("F8\y.url")
{
Run, explorer.exe "F8\y.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F8\y.lnk")
Run, explorer.exe "F8\y.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F8 & z::
if fileexist("F8\z.url")
{
Run, explorer.exe "F8\z.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F8\z.lnk")
Run, explorer.exe "F8\z.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F8 & 1::
if fileexist("F8\1.url")
{
Run, explorer.exe "F8\1.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F8\1.lnk")
Run, explorer.exe "F8\1.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F8 & 2::
if fileexist("F8\2.url")
{
Run, explorer.exe "F8\2.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F8\2.lnk")
Run, explorer.exe "F8\2.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F8 & 3::
if fileexist("F8\3.url")
{
Run, explorer.exe "F8\3.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F8\3.lnk")
Run, explorer.exe "F8\3.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F8 & 4::
if fileexist("F8\4.url")
{
Run, explorer.exe "F8\4.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F8\4.lnk")
Run, explorer.exe "F8\4.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F8 & 5::
if fileexist("F8\5.url")
{
Run, explorer.exe "F8\5.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F8\5.lnk")
Run, explorer.exe "F8\5.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F8 & 6::
if fileexist("F8\6.url")
{
Run, explorer.exe "F8\6.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F8\6.lnk")
Run, explorer.exe "F8\6.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F8 & 7::
if fileexist("F8\7.url")
{
Run, explorer.exe "F8\7.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F8\7.lnk")
Run, explorer.exe "F8\7.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F8 & 8::
if fileexist("F8\8.url")
{
Run, explorer.exe "F8\8.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F8\8.lnk")
Run, explorer.exe "F8\8.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F8 & 9::
if fileexist("F8\9.url")
{
Run, explorer.exe "F8\9.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F8\9.lnk")
Run, explorer.exe "F8\9.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F8 & 0::
if fileexist("F8\0.url")
{
Run, explorer.exe "F8\0.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F8\0.lnk")
Run, explorer.exe "F8\0.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F9 & Enter::Run, F9

F9 & a::
if fileexist("F9\a.url")
{
Run, explorer.exe "F9\a.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F9\a.lnk")
Run, explorer.exe "F9\a.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F9 & b::
if fileexist("F9\b.url")
{
Run, explorer.exe "F9\b.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F9\b.lnk")
Run, explorer.exe "F9\b.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F9 & c::
if fileexist("F9\c.url")
{
Run, explorer.exe "F9\c.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F9\c.lnk")
Run, explorer.exe "F9\c.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F9 & d::
if fileexist("F9\d.url")
{
Run, explorer.exe "F9\d.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F9\d.lnk")
Run, explorer.exe "F9\d.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F9 & e::
if fileexist("F9\e.url")
{
Run, explorer.exe "F9\e.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F9\e.lnk")
Run, explorer.exe "F9\e.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F9 & f::
if fileexist("F9\f.url")
{
Run, explorer.exe "F9\f.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F9\f.lnk")
Run, explorer.exe "F9\f.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F9 & g::
if fileexist("F9\g.url")
{
Run, explorer.exe "F9\g.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F9\g.lnk")
Run, explorer.exe "F9\g.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F9 & h::
if fileexist("F9\h.url")
{
Run, explorer.exe "F9\h.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F9\h.lnk")
Run, explorer.exe "F9\h.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F9 & i::
if fileexist("F9\i.url")
{
Run, explorer.exe "F9\i.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F9\i.lnk")
Run, explorer.exe "F9\i.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F9 & j::
if fileexist("F9\j.url")
{
Run, explorer.exe "F9\j.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F9\j.lnk")
Run, explorer.exe "F9\j.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F9 & k::
if fileexist("F9\k.url")
{
Run, explorer.exe "F9\k.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F9\k.lnk")
Run, explorer.exe "F9\k.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F9 & l::
if fileexist("F9\l.url")
{
Run, explorer.exe "F9\l.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F9\l.lnk")
Run, explorer.exe "F9\l.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F9 & m::
if fileexist("F9\m.url")
{
Run, explorer.exe "F9\m.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F9\m.lnk")
Run, explorer.exe "F9\m.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F9 & n::
if fileexist("F9\n.url")
{
Run, explorer.exe "F9\n.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F9\n.lnk")
Run, explorer.exe "F9\n.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F9 & o::
if fileexist("F9\o.url")
{
Run, explorer.exe "F9\o.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F9\o.lnk")
Run, explorer.exe "F9\o.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F9 & p::
if fileexist("F9\p.url")
{
Run, explorer.exe "F9\p.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F9\p.lnk")
Run, explorer.exe "F9\p.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F9 & q::
if fileexist("F9\q.url")
{
Run, explorer.exe "F9\q.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F9\q.lnk")
Run, explorer.exe "F9\q.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F9 & r::
if fileexist("F9\r.url")
{
Run, explorer.exe "F9\r.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F9\r.lnk")
Run, explorer.exe "F9\r.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F9 & s::
if fileexist("F9\s.url")
{
Run, explorer.exe "F9\s.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F9\s.lnk")
Run, explorer.exe "F9\s.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F9 & t::
if fileexist("F9\t.url")
{
Run, explorer.exe "F9\t.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F9\t.lnk")
Run, explorer.exe "F9\t.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F9 & u::
if fileexist("F9\u.url")
{
Run, explorer.exe "F9\u.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F9\u.lnk")
Run, explorer.exe "F9\u.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F9 & v::
if fileexist("F9\v.url")
{
Run, explorer.exe "F9\v.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F9\v.lnk")
Run, explorer.exe "F9\v.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F9 & w::
if fileexist("F9\w.url")
{
Run, explorer.exe "F9\w.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F9\w.lnk")
Run, explorer.exe "F9\w.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F9 & x::
if fileexist("F9\x.url")
{
Run, explorer.exe "F9\x.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F9\x.lnk")
Run, explorer.exe "F9\x.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F9 & y::
if fileexist("F9\y.url")
{
Run, explorer.exe "F9\y.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F9\y.lnk")
Run, explorer.exe "F9\y.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F9 & z::
if fileexist("F9\z.url")
{
Run, explorer.exe "F9\z.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F9\z.lnk")
Run, explorer.exe "F9\z.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F9 & 1::
if fileexist("F9\1.url")
{
Run, explorer.exe "F9\1.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F9\1.lnk")
Run, explorer.exe "F9\1.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F9 & 2::
if fileexist("F9\2.url")
{
Run, explorer.exe "F9\2.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F9\2.lnk")
Run, explorer.exe "F9\2.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F9 & 3::
if fileexist("F9\3.url")
{
Run, explorer.exe "F9\3.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F9\3.lnk")
Run, explorer.exe "F9\3.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F9 & 4::
if fileexist("F9\4.url")
{
Run, explorer.exe "F9\4.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F9\4.lnk")
Run, explorer.exe "F9\4.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F9 & 5::
if fileexist("F9\5.url")
{
Run, explorer.exe "F9\5.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F9\5.lnk")
Run, explorer.exe "F9\5.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F9 & 6::
if fileexist("F9\6.url")
{
Run, explorer.exe "F9\6.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F9\6.lnk")
Run, explorer.exe "F9\6.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F9 & 7::
if fileexist("F9\7.url")
{
Run, explorer.exe "F9\7.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F9\7.lnk")
Run, explorer.exe "F9\7.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F9 & 8::
if fileexist("F9\8.url")
{
Run, explorer.exe "F9\8.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F9\8.lnk")
Run, explorer.exe "F9\8.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F9 & 9::
if fileexist("F9\9.url")
{
Run, explorer.exe "F9\9.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F9\9.lnk")
Run, explorer.exe "F9\9.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F9 & 0::
if fileexist("F9\0.url")
{
Run, explorer.exe "F9\0.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F9\0.lnk")
Run, explorer.exe "F9\0.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F10 & Enter::Run, F10

F10 & a::
if fileexist("F10\a.url")
{
Run, explorer.exe "F10\a.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F10\a.lnk")
Run, explorer.exe "F10\a.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F10 & b::
if fileexist("F10\b.url")
{
Run, explorer.exe "F10\b.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F10\b.lnk")
Run, explorer.exe "F10\b.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F10 & c::
if fileexist("F10\c.url")
{
Run, explorer.exe "F10\c.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F10\c.lnk")
Run, explorer.exe "F10\c.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F10 & d::
if fileexist("F10\d.url")
{
Run, explorer.exe "F10\d.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F10\d.lnk")
Run, explorer.exe "F10\d.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F10 & e::
if fileexist("F10\e.url")
{
Run, explorer.exe "F10\e.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F10\e.lnk")
Run, explorer.exe "F10\e.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F10 & f::
if fileexist("F10\f.url")
{
Run, explorer.exe "F10\f.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F10\f.lnk")
Run, explorer.exe "F10\f.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F10 & g::
if fileexist("F10\g.url")
{
Run, explorer.exe "F10\g.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F10\g.lnk")
Run, explorer.exe "F10\g.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F10 & h::
if fileexist("F10\h.url")
{
Run, explorer.exe "F10\h.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F10\h.lnk")
Run, explorer.exe "F10\h.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F10 & i::
if fileexist("F10\i.url")
{
Run, explorer.exe "F10\i.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F10\i.lnk")
Run, explorer.exe "F10\i.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F10 & j::
if fileexist("F10\j.url")
{
Run, explorer.exe "F10\j.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F10\j.lnk")
Run, explorer.exe "F10\j.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F10 & k::
if fileexist("F10\k.url")
{
Run, explorer.exe "F10\k.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F10\k.lnk")
Run, explorer.exe "F10\k.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F10 & l::
if fileexist("F10\l.url")
{
Run, explorer.exe "F10\l.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F10\l.lnk")
Run, explorer.exe "F10\l.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F10 & m::
if fileexist("F10\m.url")
{
Run, explorer.exe "F10\m.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F10\m.lnk")
Run, explorer.exe "F10\m.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F10 & n::
if fileexist("F10\n.url")
{
Run, explorer.exe "F10\n.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F10\n.lnk")
Run, explorer.exe "F10\n.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F10 & o::
if fileexist("F10\o.url")
{
Run, explorer.exe "F10\o.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F10\o.lnk")
Run, explorer.exe "F10\o.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F10 & p::
if fileexist("F10\p.url")
{
Run, explorer.exe "F10\p.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F10\p.lnk")
Run, explorer.exe "F10\p.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F10 & q::
if fileexist("F10\q.url")
{
Run, explorer.exe "F10\q.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F10\q.lnk")
Run, explorer.exe "F10\q.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F10 & r::
if fileexist("F10\r.url")
{
Run, explorer.exe "F10\r.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F10\r.lnk")
Run, explorer.exe "F10\r.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F10 & s::
if fileexist("F10\s.url")
{
Run, explorer.exe "F10\s.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F10\s.lnk")
Run, explorer.exe "F10\s.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F10 & t::
if fileexist("F10\t.url")
{
Run, explorer.exe "F10\t.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F10\t.lnk")
Run, explorer.exe "F10\t.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F10 & u::
if fileexist("F10\u.url")
{
Run, explorer.exe "F10\u.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F10\u.lnk")
Run, explorer.exe "F10\u.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F10 & v::
if fileexist("F10\v.url")
{
Run, explorer.exe "F10\v.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F10\v.lnk")
Run, explorer.exe "F10\v.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F10 & w::
if fileexist("F10\w.url")
{
Run, explorer.exe "F10\w.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F10\w.lnk")
Run, explorer.exe "F10\w.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F10 & x::
if fileexist("F10\x.url")
{
Run, explorer.exe "F10\x.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F10\x.lnk")
Run, explorer.exe "F10\x.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F10 & y::
if fileexist("F10\y.url")
{
Run, explorer.exe "F10\y.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F10\y.lnk")
Run, explorer.exe "F10\y.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F10 & z::
if fileexist("F10\z.url")
{
Run, explorer.exe "F10\z.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F10\z.lnk")
Run, explorer.exe "F10\z.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F10 & 1::
if fileexist("F10\1.url")
{
Run, explorer.exe "F10\1.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F10\1.lnk")
Run, explorer.exe "F10\1.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F10 & 2::
if fileexist("F10\2.url")
{
Run, explorer.exe "F10\2.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F10\2.lnk")
Run, explorer.exe "F10\2.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F10 & 3::
if fileexist("F10\3.url")
{
Run, explorer.exe "F10\3.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F10\3.lnk")
Run, explorer.exe "F10\3.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F10 & 4::
if fileexist("F10\4.url")
{
Run, explorer.exe "F10\4.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F10\4.lnk")
Run, explorer.exe "F10\4.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F10 & 5::
if fileexist("F10\5.url")
{
Run, explorer.exe "F10\5.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F10\5.lnk")
Run, explorer.exe "F10\5.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F10 & 6::
if fileexist("F10\6.url")
{
Run, explorer.exe "F10\6.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F10\6.lnk")
Run, explorer.exe "F10\6.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F10 & 7::
if fileexist("F10\7.url")
{
Run, explorer.exe "F10\7.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F10\7.lnk")
Run, explorer.exe "F10\7.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F10 & 8::
if fileexist("F10\8.url")
{
Run, explorer.exe "F10\8.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F10\8.lnk")
Run, explorer.exe "F10\8.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F10 & 9::
if fileexist("F10\9.url")
{
Run, explorer.exe "F10\9.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F10\9.lnk")
Run, explorer.exe "F10\9.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F10 & 0::
if fileexist("F10\0.url")
{
Run, explorer.exe "F10\0.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F10\0.lnk")
Run, explorer.exe "F10\0.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F11 & Enter::Run, F11

F11 & a::
if fileexist("F11\a.url")
{
Run, explorer.exe "F11\a.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F11\a.lnk")
Run, explorer.exe "F11\a.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F11 & b::
if fileexist("F11\b.url")
{
Run, explorer.exe "F11\b.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F11\b.lnk")
Run, explorer.exe "F11\b.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F11 & c::
if fileexist("F11\c.url")
{
Run, explorer.exe "F11\c.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F11\c.lnk")
Run, explorer.exe "F11\c.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F11 & d::
if fileexist("F11\d.url")
{
Run, explorer.exe "F11\d.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F11\d.lnk")
Run, explorer.exe "F11\d.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F11 & e::
if fileexist("F11\e.url")
{
Run, explorer.exe "F11\e.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F11\e.lnk")
Run, explorer.exe "F11\e.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F11 & f::
if fileexist("F11\f.url")
{
Run, explorer.exe "F11\f.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F11\f.lnk")
Run, explorer.exe "F11\f.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F11 & g::
if fileexist("F11\g.url")
{
Run, explorer.exe "F11\g.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F11\g.lnk")
Run, explorer.exe "F11\g.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F11 & h::
if fileexist("F11\h.url")
{
Run, explorer.exe "F11\h.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F11\h.lnk")
Run, explorer.exe "F11\h.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F11 & i::
if fileexist("F11\i.url")
{
Run, explorer.exe "F11\i.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F11\i.lnk")
Run, explorer.exe "F11\i.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F11 & j::
if fileexist("F11\j.url")
{
Run, explorer.exe "F11\j.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F11\j.lnk")
Run, explorer.exe "F11\j.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F11 & k::
if fileexist("F11\k.url")
{
Run, explorer.exe "F11\k.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F11\k.lnk")
Run, explorer.exe "F11\k.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F11 & l::
if fileexist("F11\l.url")
{
Run, explorer.exe "F11\l.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F11\l.lnk")
Run, explorer.exe "F11\l.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F11 & m::
if fileexist("F11\m.url")
{
Run, explorer.exe "F11\m.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F11\m.lnk")
Run, explorer.exe "F11\m.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F11 & n::
if fileexist("F11\n.url")
{
Run, explorer.exe "F11\n.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F11\n.lnk")
Run, explorer.exe "F11\n.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F11 & o::
if fileexist("F11\o.url")
{
Run, explorer.exe "F11\o.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F11\o.lnk")
Run, explorer.exe "F11\o.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F11 & p::
if fileexist("F11\p.url")
{
Run, explorer.exe "F11\p.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F11\p.lnk")
Run, explorer.exe "F11\p.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F11 & q::
if fileexist("F11\q.url")
{
Run, explorer.exe "F11\q.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F11\q.lnk")
Run, explorer.exe "F11\q.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F11 & r::
if fileexist("F11\r.url")
{
Run, explorer.exe "F11\r.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F11\r.lnk")
Run, explorer.exe "F11\r.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F11 & s::
if fileexist("F11\s.url")
{
Run, explorer.exe "F11\s.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F11\s.lnk")
Run, explorer.exe "F11\s.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F11 & t::
if fileexist("F11\t.url")
{
Run, explorer.exe "F11\t.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F11\t.lnk")
Run, explorer.exe "F11\t.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F11 & u::
if fileexist("F11\u.url")
{
Run, explorer.exe "F11\u.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F11\u.lnk")
Run, explorer.exe "F11\u.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F11 & v::
if fileexist("F11\v.url")
{
Run, explorer.exe "F11\v.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F11\v.lnk")
Run, explorer.exe "F11\v.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F11 & w::
if fileexist("F11\w.url")
{
Run, explorer.exe "F11\w.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F11\w.lnk")
Run, explorer.exe "F11\w.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F11 & x::
if fileexist("F11\x.url")
{
Run, explorer.exe "F11\x.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F11\x.lnk")
Run, explorer.exe "F11\x.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F11 & y::
if fileexist("F11\y.url")
{
Run, explorer.exe "F11\y.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F11\y.lnk")
Run, explorer.exe "F11\y.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F11 & z::
if fileexist("F11\z.url")
{
Run, explorer.exe "F11\z.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F11\z.lnk")
Run, explorer.exe "F11\z.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F11 & 1::
if fileexist("F11\1.url")
{
Run, explorer.exe "F11\1.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F11\1.lnk")
Run, explorer.exe "F11\1.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F11 & 2::
if fileexist("F11\2.url")
{
Run, explorer.exe "F11\2.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F11\2.lnk")
Run, explorer.exe "F11\2.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F11 & 3::
if fileexist("F11\3.url")
{
Run, explorer.exe "F11\3.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F11\3.lnk")
Run, explorer.exe "F11\3.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F11 & 4::
if fileexist("F11\4.url")
{
Run, explorer.exe "F11\4.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F11\4.lnk")
Run, explorer.exe "F11\4.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F11 & 5::
if fileexist("F11\5.url")
{
Run, explorer.exe "F11\5.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F11\5.lnk")
Run, explorer.exe "F11\5.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F11 & 6::
if fileexist("F11\6.url")
{
Run, explorer.exe "F11\6.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F11\6.lnk")
Run, explorer.exe "F11\6.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F11 & 7::
if fileexist("F11\7.url")
{
Run, explorer.exe "F11\7.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F11\7.lnk")
Run, explorer.exe "F11\7.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F11 & 8::
if fileexist("F11\8.url")
{
Run, explorer.exe "F11\8.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F11\8.lnk")
Run, explorer.exe "F11\8.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F11 & 9::
if fileexist("F11\9.url")
{
Run, explorer.exe "F11\9.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F11\9.lnk")
Run, explorer.exe "F11\9.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F11 & 0::
if fileexist("F11\0.url")
{
Run, explorer.exe "F11\0.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F11\0.lnk")
Run, explorer.exe "F11\0.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F12 & Enter::Run, F12

F12 & a::
if fileexist("F12\a.url")
{
Run, explorer.exe "F12\a.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F12\a.lnk")
Run, explorer.exe "F12\a.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F12 & b::
if fileexist("F12\b.url")
{
Run, explorer.exe "F12\b.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F12\b.lnk")
Run, explorer.exe "F12\b.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F12 & c::
if fileexist("F12\c.url")
{
Run, explorer.exe "F12\c.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F12\c.lnk")
Run, explorer.exe "F12\c.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F12 & d::
if fileexist("F12\d.url")
{
Run, explorer.exe "F12\d.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F12\d.lnk")
Run, explorer.exe "F12\d.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F12 & e::
if fileexist("F12\e.url")
{
Run, explorer.exe "F12\e.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F12\e.lnk")
Run, explorer.exe "F12\e.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F12 & f::
if fileexist("F12\f.url")
{
Run, explorer.exe "F12\f.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F12\f.lnk")
Run, explorer.exe "F12\f.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F12 & g::
if fileexist("F12\g.url")
{
Run, explorer.exe "F12\g.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F12\g.lnk")
Run, explorer.exe "F12\g.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F12 & h::
if fileexist("F12\h.url")
{
Run, explorer.exe "F12\h.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F12\h.lnk")
Run, explorer.exe "F12\h.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F12 & i::
if fileexist("F12\i.url")
{
Run, explorer.exe "F12\i.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F12\i.lnk")
Run, explorer.exe "F12\i.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F12 & j::
if fileexist("F12\j.url")
{
Run, explorer.exe "F12\j.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F12\j.lnk")
Run, explorer.exe "F12\j.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F12 & k::
if fileexist("F12\k.url")
{
Run, explorer.exe "F12\k.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F12\k.lnk")
Run, explorer.exe "F12\k.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F12 & l::
if fileexist("F12\l.url")
{
Run, explorer.exe "F12\l.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F12\l.lnk")
Run, explorer.exe "F12\l.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F12 & m::
if fileexist("F12\m.url")
{
Run, explorer.exe "F12\m.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F12\m.lnk")
Run, explorer.exe "F12\m.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F12 & n::
if fileexist("F12\n.url")
{
Run, explorer.exe "F12\n.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F12\n.lnk")
Run, explorer.exe "F12\n.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F12 & o::
if fileexist("F12\o.url")
{
Run, explorer.exe "F12\o.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F12\o.lnk")
Run, explorer.exe "F12\o.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F12 & p::
if fileexist("F12\p.url")
{
Run, explorer.exe "F12\p.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F12\p.lnk")
Run, explorer.exe "F12\p.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F12 & q::
if fileexist("F12\q.url")
{
Run, explorer.exe "F12\q.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F12\q.lnk")
Run, explorer.exe "F12\q.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F12 & r::
if fileexist("F12\r.url")
{
Run, explorer.exe "F12\r.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F12\r.lnk")
Run, explorer.exe "F12\r.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F12 & s::
if fileexist("F12\s.url")
{
Run, explorer.exe "F12\s.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F12\s.lnk")
Run, explorer.exe "F12\s.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F12 & t::
if fileexist("F12\t.url")
{
Run, explorer.exe "F12\t.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F12\t.lnk")
Run, explorer.exe "F12\t.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F12 & u::
if fileexist("F12\u.url")
{
Run, explorer.exe "F12\u.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F12\u.lnk")
Run, explorer.exe "F12\u.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F12 & v::
if fileexist("F12\v.url")
{
Run, explorer.exe "F12\v.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F12\v.lnk")
Run, explorer.exe "F12\v.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F12 & w::
if fileexist("F12\w.url")
{
Run, explorer.exe "F12\w.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F12\w.lnk")
Run, explorer.exe "F12\w.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F12 & x::
if fileexist("F12\x.url")
{
Run, explorer.exe "F12\x.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F12\x.lnk")
Run, explorer.exe "F12\x.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F12 & y::
if fileexist("F12\y.url")
{
Run, explorer.exe "F12\y.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F12\y.lnk")
Run, explorer.exe "F12\y.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F12 & z::
if fileexist("F12\z.url")
{
Run, explorer.exe "F12\z.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F12\z.lnk")
Run, explorer.exe "F12\z.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F12 & 1::
if fileexist("F12\1.url")
{
Run, explorer.exe "F12\1.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F12\1.lnk")
Run, explorer.exe "F12\1.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F12 & 2::
if fileexist("F12\2.url")
{
Run, explorer.exe "F12\2.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F12\2.lnk")
Run, explorer.exe "F12\2.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F12 & 3::
if fileexist("F12\3.url")
{
Run, explorer.exe "F12\3.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F12\3.lnk")
Run, explorer.exe "F12\3.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F12 & 4::
if fileexist("F12\4.url")
{
Run, explorer.exe "F12\4.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F12\4.lnk")
Run, explorer.exe "F12\4.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F12 & 5::
if fileexist("F12\5.url")
{
Run, explorer.exe "F12\5.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F12\5.lnk")
Run, explorer.exe "F12\5.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F12 & 6::
if fileexist("F12\6.url")
{
Run, explorer.exe "F12\6.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F12\6.lnk")
Run, explorer.exe "F12\6.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F12 & 7::
if fileexist("F12\7.url")
{
Run, explorer.exe "F12\7.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F12\7.lnk")
Run, explorer.exe "F12\7.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F12 & 8::
if fileexist("F12\8.url")
{
Run, explorer.exe "F12\8.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F12\8.lnk")
Run, explorer.exe "F12\8.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F12 & 9::
if fileexist("F12\9.url")
{
Run, explorer.exe "F12\9.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F12\9.lnk")
Run, explorer.exe "F12\9.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

F12 & 0::
if fileexist("F12\0.url")
{
Run, explorer.exe "F12\0.url",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return
}
if fileexist("F12\0.lnk")
Run, explorer.exe "F12\0.lnk",,useerrorlevel
Run,"%A_ScriptFullPath%" /restart
return

