#if !flaunch&&Spaceenabled&&!SpaceDisabled&&!GameMode

Space::
settimer,Spacetimer,%delay1%,2018
settimer,SpaceDisabler,%delay2%,1009
oneenabled=0
twoenabled=0
Spacesent=0
Space1=0
Space3=0
Space2=1
isenabled2=0
Keywait,Space
settimer,Spacetimer,delete
settimer,SpaceDisabler,delete
if (!Spacesent)
Send {Space Down}{Space Up}
Space1=0 
Space2=0
Space3=0
Spacesent=1
isenabled2=1
oneenabled=1
twoenabled=1
Return

Spacetimer:
settimer,Spacetimer,delete
Space2=0
Space3=0
Space1=1
Return

SpaceDisabler:
settimer,SpaceDisabler,delete
Spacesent=1
Return

#If

#if Space1|Space3

A::
KeyWait, `;
Spacesent=1
Space1=0
Space3=1
KeyWait, a
Space3=0
Space1=1
Return

`;::
KeyWait, a
Spacesent=1
Space1=0
Space3=1
KeyWait, `;
Space3=0
Space1=1
Return

#if

#if Space1
F1::
Gosub,ShowPowerSpaceLayout
KeyWait,F1
Gosub,HidePowerSpaceLayout
Return

F::Send {Left}
J::Send {Right}
D::Send ^{Left}
K::Send ^{Right}
H::Send +{F10}
G::Send {Esc}
9::Send +{WheelUp}
0::Send +{WheelDown}
'::Send {Enter}
S::Send {Home}
L::Send {End}
W::Send ^{Home}
.::Send ^{End}
R::Send {Up}
T::Send {PgUp}
E::Send ^{Up}
M::Send {Down}
N::Send {PgDn}
,::Send ^{Down}
B::Send ^{b}
I::Send ^{i}
U::Send ^{u}
Z::Send ^{z}
X::Send ^{x}
C::Send ^{c}
V::Send ^{v}
Y::Send ^{y}
5::Send ^{l}
6::Send ^{e}
7::Send ^{r}
Tab::Send ^{a}
O::Send ^+{,}
P::Send ^+{.}
=::Send ^{WheelUp}
-::Send ^{WheelDown}
Ctrl::Send {BackSpace}
CapsLock::Send {BackSpace}
Shift::Space
]::Send {Tab}
[::Send +{Tab}
Q::Send ^{s}
3::Send +{3}
`::Send {``}
8::Send +{8}
/::Send ^{Enter}
Enter::Send +{Enter}
BackSpace::Send {Delete}
Esc::Return
1::Return
2::Return
4::Return
LWin::Return
RWin::Return
F2::Return
F3::Return
F4::Return
F5::Return
F6::Return
F7::Return
F8::Return
F9::Return
F10::Return
F11::Return
F12::Return
Insert::Return
Home::Return
End::Return
Delete::Return
PgUp::Return
PgDn::Return
Up::Return
Down::Return
Left::Return
Right::Return
PrintScreen::Return
#if

#if Space3
F::Send +{Left}
J::Send +{Right}
D::Send ^+{Left}
K::Send ^+{Right}
H::Send +{F10}
G::Send {Esc}
9::Send +{WheelUp}
0::Send +{WheelDown}
'::Send {Enter}
S::Send +{Home}
L::Send +{End}
W::Send ^+{Home}
.::Send ^+{End}
R::Send +{Up}
T::Send +{PgUp}
E::Send +^{Up}
M::Send +{Down}
N::Send +{PgDn}
,::Send ^+{Down}
B::Send ^{b}
I::Send ^{i}
U::Send ^{u}
Z::Send ^{z}
X::Send ^{x}
C::Send ^{c}
V::Send ^{v}
Y::Send ^{y}
5::Send ^{l}
6::Send ^{e}
7::Send ^{r}
Tab::Send ^{a}
O::Send ^+{,}
P::Send ^+{.}
=::Send ^{WheelUp}
-::Send ^{WheelDown}
Ctrl::Send {BackSpace}
CapsLock::Send {BackSpace}
Shift::Space
]::Send {Tab}
[::Send +{Tab}
Q::Send ^{s}
3::Send +{3}
`::Send {``}
8::Send +{8}
/::Send ^{Enter}
Enter::Send +{Enter}
BackSpace::Send {Delete}
Esc::Send !{F4}
1::Return
2::Return
4::Return
LWin::Return
RWin::Return
F1::Return
F2::Return
F3::Return
F4::Return
F5::Return
F6::Return
F7::Return
F8::Return
F9::Return
F10::Return
F11::Return
F12::Return
Insert::Return
Home::Return
End::Return
Delete::Return
PgUp::Return
PgDn::Return
Up::Return
Down::Return
Left::Return
Right::Return
PrintScreen::Return

#if

#if Space2&(Spacesent=0)

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
/::
\::
-::
=::
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
settimer,Spacetimer,delete
Spacesent=1
Send {Space Down}{%A_ThisLabel% Down}{Space Up}{%A_ThisLabel% Up}
Return

`::
settimer,Spacetimer,delete
Spacesent=1
Send {Space Down}{`` Down}{Space Up}{`` Up}
Return

`;::
settimer,Spacetimer,delete
Spacesent=1
Send {Space Down}{; Down}{Space Up}{; Up}
Return

#if