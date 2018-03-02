#SingleInstance force
#MaxHotkeysPerInterval 1000
#Persistent
SetWorkingDir %A_ScriptDir%

Menu, tray, Tip, Power Space
Menu, tray, NoStandard
Menu, tray, add, 开机自启, Autorun
Menu, tray, add, 配置热键, Config
Menu, tray, add
Menu, tray, add, 帮助, Help
Menu, tray, add, 反馈, Feedback
Menu, tray, add
Menu, tray, add, 退出, Exit
Menu, tray, default, 配置热键

RegRead, AutorunState, HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run, Power Space
if AutorunState=%A_ScriptFullPath%
{
	Menu,tray,check,开机自启
}
else
{
	Menu,tray,uncheck,开机自启
}

return

Autorun:
RegRead, AutorunState, HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run, Power Space
if AutorunState=%A_ScriptFullPath%
{
	regdelete,HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run, Power Space
	Menu,tray,uncheck,开机自启
}
else
{
	RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run, Power Space, %A_ScriptFullPath%
	Menu,tray,check,开机自启
}
return

Exit:
ExitApp
return

Config:
Run,%A_ScriptDir%
return

Help:
Run, https://github.com/szzhiyang/PerfectWindows/blob/master/README.md
return

Feedback:
Run, https://github.com/szzhiyang/PerfectWindows/issues
return

Space::Space

Space & Alt::Space

Space & /::Run, https://github.com/szzhiyang/PerfectWindows/blob/master/README.md

Space & Tab::AltTab

Space & Up::Send {Volume_Up}
Space & Down::Send {Volume_Down}
Space & Left::Send {Media_Prev}
Space & Right::Send {Media_Next}
Space & '::Send {Media_Play_Pause}

Space & WheelUp::Send {Volume_Up}
Space & WheelDown::Send {Volume_Down}
Space & LButton::Send {Media_Prev}
Space & RButton::Send {Media_Next}
Space & MButton::Send {Media_Play_Pause}

Space & <::Send ^#{Left}
Space & >::Send ^#{Right}
Space & =::Send ^#d
Space & -::Send ^#{F4}

Space & Esc::Send !{F4}

Space & `::Send !{Esc}

Space & CapsLock::winset,AlwaysOnTop,, A

Space & a::
If FileExist("a.lnk")
Run, a.lnk
return

Space & b::
If FileExist("b.lnk")
Run, b.lnk
return

Space & c::
If FileExist("c.lnk")
Run, c.lnk
return

Space & d::
If FileExist("d.lnk")
Run, d.lnk
return

Space & e::
If FileExist("e.lnk")
Run, e.lnk
return

Space & f::
If FileExist("f.lnk")
Run, f.lnk
return

Space & g::
If FileExist("g.lnk")
Run, g.lnk
return

Space & h::
If FileExist("h.lnk")
Run, h.lnk
return

Space & i::
If FileExist("i.lnk")
Run, i.lnk
return

Space & j::
If FileExist("j.lnk")
Run, j.lnk
return

Space & k::
If FileExist("k.lnk")
Run, k.lnk
return

Space & l::
If FileExist("l.lnk")
Run, l.lnk
return

Space & m::
If FileExist("m.lnk")
Run, m.lnk
return

Space & n::
If FileExist("n.lnk")
Run, n.lnk
return

Space & o::
If FileExist("o.lnk")
Run, o.lnk
return

Space & p::
If FileExist("p.lnk")
Run, p.lnk
return

Space & q::
If FileExist("q.lnk")
Run, q.lnk
return

Space & r::
If FileExist("r.lnk")
Run, r.lnk
return

Space & s::
If FileExist("s.lnk")
Run, s.lnk
return

Space & t::
If FileExist("t.lnk")
Run, t.lnk
return

Space & u::
If FileExist("u.lnk")
Run, u.lnk
return

Space & v::
If FileExist("v.lnk")
Run, v.lnk
return

Space & w::
If FileExist("w.lnk")
Run, w.lnk
return

Space & x::
If FileExist("x.lnk")
Run, x.lnk
return

Space & y::
If FileExist("y.lnk")
Run, y.lnk
return

Space & z::
If FileExist("z.lnk")
Run, z.lnk
return

Space & 1::
If FileExist("1.lnk")
Run, 1.lnk
return

Space & 2::
If FileExist("2.lnk")
Run, 2.lnk
return

Space & 3::
If FileExist("3.lnk")
Run, 3.lnk
return

Space & 4::
If FileExist("4.lnk")
Run, 4.lnk
return

Space & 5::
If FileExist("5.lnk")
Run, 5.lnk
return

Space & 6::
If FileExist("6.lnk")
Run, 6.lnk
return

Space & 7::
If FileExist("7.lnk")
Run, 7.lnk
return

Space & 8::
If FileExist("8.lnk")
Run, 8.lnk
return

Space & 9::
If FileExist("9.lnk")
Run, 9.lnk
return

Space & 0::
If FileExist("0.lnk")
Run, 0.lnk
return

Space & F1::
If FileExist("F1.lnk")
Run, F1.lnk
return

Space & F2::
If FileExist("F2.lnk")
Run, F2.lnk
return

Space & F3::
If FileExist("F3.lnk")
Run, F3.lnk
return

Space & F4::
If FileExist("F4.lnk")
Run, F4.lnk
return

Space & F5::
If FileExist("F5.lnk")
Run, F5.lnk
return

Space & F6::
If FileExist("F6.lnk")
Run, F6.lnk
return

Space & F7::
If FileExist("F7.lnk")
Run, F7.lnk
return

Space & F8::
If FileExist("F8.lnk")
Run, F8.lnk
return

Space & F9::
If FileExist("F9.lnk")
Run, F9.lnk
return

Space & F10::
If FileExist("F10.lnk")
Run, F10.lnk
return

Space & F11::
If FileExist("F11.lnk")
Run, F11.lnk
return

Space & F12::
If FileExist("F12.lnk")
Run, F12.lnk
return

Space & Enter::
If FileExist("Enter.lnk")
Run, Enter.lnk
return

Space & Home::
If FileExist("home.lnk")
Run, home.lnk
return

Space & End::
If FileExist("End.lnk")
Run, End.lnk
return

Space & BackSpace::
If FileExist("BackSpace.lnk")
Run, BackSpace.lnk
return

Space & PrintScreen::
If FileExist("Print Screen.lnk")
Run, "Print Screen.lnk"
return

Space & Delete::
If FileExist("Delete.lnk")
Run, Delete.lnk
return

Space & Insert::
If FileExist("Insert.lnk")
Run, Insert.lnk
return

Space & ScrollLock::
If FileExist("Scroll Lock.lnk")
Run, "Scroll Lock.lnk"
return

Space & NumLock::
If FileExist("Numpad Lock.lnk")
Run, "Numpad Lock.lnk"
return

Space & Ctrl::
If FileExist("Ctrl.lnk")
Run, "Ctrl.lnk"
return

Space & Shift:: 
If FileExist("Shift.lnk")
Run, "Shift.lnk"
return

Space & LWin::
If FileExist("Win.lnk")
Run, "Win.lnk"
return

Space & RWin::
If FileExist("Win.lnk")
Run, "Win.lnk"
return