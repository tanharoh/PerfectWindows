#if !flaunch&&spaceenabled&&!SpaceDisabled&&!GameMode

space::
settimer,spacetimer,%delay%
oneenabled=0
twoenabled=0
spacesent=0
space1=0
space3=0
space2=1
isenabled2=0
keywait,space
settimer,spacetimer,delete
if (!space1)&(!spacesent)
send {space} 
space1=0 
space2=0
space3=0
spacesent=1
isenabled2=1
oneenabled=1
twoenabled=1
gosub,HideRed
return

spacetimer:
settimer,spacetimer,delete
space2=0
space3=0
space1=1
gosub,ShowRed
return

#If

#if space1|space3

A::
`;::
space1=0
space3=1
gosub,ShowYellow
KeyWait, a
KeyWait, `;
space3=0
space1=1
gosub,HideYellow
return

#if

#if space1
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
LCtrl::Send {bs}
RCtrl::Send {bs}
CapsLock::Send {bs}
Shift::Space
]::Send {Tab}
[::Send +{Tab}
Q::Send ^{s}
3::Send +{3}
`::Send {``}
8::Send +{8}
/::Send ^{Enter}
Enter::Send +{Enter}
bs::Send {Delete}
Esc::Send !{F4}

#if

#if space3
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
LCtrl::Send {bs}
RCtrl::Send {bs}
CapsLock::Send {bs}
Shift::Space
]::Send {Tab}
[::Send +{Tab}
Q::Send ^{s}
3::Send +{3}
`::Send {``}
8::Send +{8}
/::Send ^{Enter}
Enter::Send +{Enter}
bs::Send {Delete}
Esc::Send !{F4}

#if

#if space2&(spacesent=0)

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
settimer,spacetimer,delete
spacesent=1
Send {Space}{%A_ThisLabel%}
return

`::
settimer,spacetimer,delete
spacesent=1
Send {Space}{``}
return

`;::
settimer,spacetimer,delete
spacesent=1
Send {Space}{;}
return

#if