#if !flaunch&&twoenabled&&!one1&&!one2&&!GameMode

2::
settimer,twotimer,%delay%
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
settimer,twotimer,delete
twosent=1
Send {2}{%A_ThisLabel%}
return

`::
settimer,twotimer,delete
twosent=1
Send {2}{``}
return

`;::
settimer,twotimer,delete
twosent=1
Send {2}{;}
return

#if