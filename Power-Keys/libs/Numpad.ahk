#if !flaunch&&oneenabled&&!two1&&!two2&&!GameMode

1::
settimer,onetimer,%delay1%,2018
settimer,oneDisabler,%delay2%,1009
spaceenabled=0
onesent=0
one1=0
one2=1
isenabled2=0
keywait,1
settimer,onetimer,delete
settimer,oneDisabler,delete
BlockInput,off
if (!onesent)
send {1}
one1=0
one2=0
onesent=1
isenabled2=1
spaceenabled=1
return

onetimer:
BlockInput,on
settimer,onetimer,delete
one1=1
one2=0
return

oneDisabler:
settimer,oneDisabler,delete
onesent=1
return

#if

#if one1
n::Send {1}
m::Send {2}
,::Send {3}
h::Send {4}
j::Send {5}
k::Send {6}
y::Send {7}
u::Send {8}
i::Send {9}
Space::Send {0}
Alt::Send {.}
Ctrl::Send {Enter}
.::Send {Enter}
Enter::Send {Enter}
l::Send +{=}
o::Send +{=}
=::Send +{=}
-::Send {-}
9::Send {-}
8::Send +{8}
/::Send {/}
7::Send {/}
Backspace::Send {Backspace}

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