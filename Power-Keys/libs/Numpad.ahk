#if !flaunch&&oneenabled&&!two1&&!two2&&!GameMode

1::
settimer,onetimer,%delay%
isNumLockOn:=GetKeyState("NumLock","T")
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
if isNumLockOn
SetNumLockState, on
Else
SetNumLockState, off
gosub,HideRed
return

onetimer:
BlockInput,on
settimer,onetimer,delete
one1=1
one2=0
SetNumLockState, on
gosub,ShowRed
return

#if

#if one1
n::Send {Numpad1}
m::Send {Numpad2}
,::Send {Numpad3}
h::Send {Numpad4}
j::Send {Numpad5}
k::Send {Numpad6}
y::Send {Numpad7}
u::Send {Numpad8}
i::Send {Numpad9}
Space::Send {Numpad0}
Alt::Send {NumpadDot}
Ctrl::Send {NumpadEnter}
.::Send {NumpadEnter}
Enter::Send {NumpadEnter}
l::Send {NumpadAdd}
o::Send {NumpadAdd}
=::Send {NumpadAdd}
-::Send {NumpadSub}
9::Send {NumpadSub}
8::Send {NumpadMult}
/::Send {NumpadDiv}
7::Send {NumpadDiv}
bs::Send {bs}
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
/::
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