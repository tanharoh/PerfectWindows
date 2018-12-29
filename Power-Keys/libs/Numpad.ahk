#if !flaunch&&oneenabled&&!two1&&!two2&&!GameMode

1::
settimer,onetimer,300,2018
settimer,oneDisabler,450,1009
Spaceenabled=0
onesent=0
one1=0
one2=1
isenabled2=0
Keywait,1
settimer,onetimer,delete
settimer,oneDisabler,delete
BlockInput,off
if (!onesent)
Send {1 Down}{1 Up}
one1=0
one2=0
onesent=1
isenabled2=1
Spaceenabled=1
Return

onetimer:
BlockInput,on
settimer,onetimer,delete
one1=1
one2=0
Return

oneDisabler:
settimer,oneDisabler,delete
onesent=1
Return

#if

#if one1
n::Send {1 Down}{1 Up}
m::Send {2 Down}{2 Up}
,::Send {3 Down}{3 Up}
h::Send {4 Down}{4 Up}
j::Send {5 Down}{5 Up}
k::Send {6 Down}{6 Up}
y::Send {7 Down}{7 Up}
u::Send {8 Down}{8 Up}
i::Send {9 Down}{9 Up}
Space::Send {0 Down}{0 Up}
Alt::Send {. Down}{. Up}
RCtrl::Send {Enter Down}{Enter Up}
.::Send {Enter Down}{Enter Up}
Enter::Send {Enter Down}{Enter Up}
l::Send {LShift Down}{= Down}{= Up}{LShift Up}
o::Send {LShift Down}{= Down}{= Up}{LShift Up}
=::Send {LShift Down}{= Down}{= Up}{LShift Up}
9::Send {- Down}{- Up}
-::Send {- Down}{- Up}
8::Send {LShift Down}{8 Down}{8 Up}{LShift Up}
7::Send {/ Down}{/ Up}
/::Send {/ Down}{/ Up}
BackSpace::Send {BackSpace Down}{Backspace Up}

`::
Send {1 Down}{`` Down}{1 Up}{`` Up}
onesent=1
Return

2::
Send {1 Down}{2 Down}{1 Up}{2 Up}
onesent=1
Return

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
Tab::
Space::
Enter::
BackSpace::
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
Send {1 Down}{%A_ThisLabel% Down}{1 Up}{%A_ThisLabel% Up}
Return

`::
onesent=1
Send {1 Down}{`` Down}{1 Up}{`` Up}
Return

`;::
onesent=1
Send {1 Down}{; Down}{1 Up}{; Up}
Return

#if