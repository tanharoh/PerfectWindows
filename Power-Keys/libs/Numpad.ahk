#if !flaunch&&oneenabled&&!two1&&!two2&&!GameMode

1::
settimer,onetimer,%delay%
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
settimer,onetimer,delete
onesent=1
Send {1}{%A_ThisLabel%}
return

`::
settimer,onetimer,delete
onesent=1
Send {1}{``}
return

`;::
settimer,onetimer,delete
onesent=1
Send {1}{;}
return

#if