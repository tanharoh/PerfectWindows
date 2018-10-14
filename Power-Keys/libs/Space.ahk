IncreaseFont:
if OneNoteDesktop()||OneNoteUWP()||WordPad()
Send {Ctrl Down}{Shift Down}{. Down}{. Up}{Shift Up}{Ctrl Up}
else if Word()||PowerPoint()||Outlook()
Send {Ctrl Down}{] Down}{] Up}{Ctrl Up}
else if Excel()
Send {Ctrl Down}{WheelUp Down}{WheelUp Up}{Ctrl Up}
else
Send {Ctrl Down}{= Down}{= Up}{Ctrl Up}
Return

DecreaseFont:
if OneNoteDesktop()||OneNoteUWP()||WordPad()
Send {Ctrl Down}{Shift Down}{, Down}{, Up}{Shift Up}{Ctrl Up}
else if Word()||PowerPoint()||Outlook()
Send {Ctrl Down}{[ Down}{[ Up}{Ctrl Up}
else if Excel()
Send {Ctrl Down}{WheelDown Down}{WheelDown Up}{Ctrl Up}
else
Send {Ctrl Down}{- Down}{- Up}{Ctrl Up}
Return

AlignLeft:
if OneNoteDesktop()||OneNoteUWP()||Word()||PowerPoint()||Outlook()||WordPad()
Send {Ctrl Down}{l Down}{l Up}{Ctrl Up}
Return

AlignCenter:
if Word()||PowerPoint()||Outlook()||WordPad()
Send {Ctrl Down}{e Down}{e Up}{Ctrl Up}
Return

AlignRight:
if OneNoteDesktop()||OneNoteUWP()||Word()||PowerPoint()||Outlook()||WordPad()
Send {Ctrl Down}{r Down}{r Up}{Ctrl Up}
Return

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

5::Gosub,AlignLeft
6::Gosub,AlignCenter
7::Gosub,AlignRight
O::Gosub,DecreaseFont
P::Gosub,IncreaseFont
M::Send {Down Down}{Down Up}
R::Send {Up Down}{Up Up}
F::Send {Left Down}{Left Up}
J::Send {Right Down}{Right Up}
D::Send {Ctrl Down}{Left Down}{Left Up}{Ctrl Up}
K::Send {Ctrl Down}{Right Down}{Right Up}{Ctrl Up}
H::Send {Shift Down}{F10 Down}{F10 Up}{Shift Up}
G::Send {Esc Down}{Esc Up}
9::Send {Shift Down}{WheelUp Down}{WheelUp Up}{Shift Up}
0::Send {Shift Down}{WheelDown Down}{WheelDown Up}{Shift Up}
'::Send {Enter Down}{Enter Up}
S::Send {Home Down}{Home Up}
L::Send {End Down}{End Up}
W::Send {Ctrl Down}{Home Down}{Home Up}{Ctrl Up}
.::Send {Ctrl Down}{End Down}{End Up}{Ctrl Up}
T::Send {PgUp Down}{PgDn Up}
E::Send {Ctrl Down}{Up Down}{Up Up}{Ctrl Up}
N::Send {PgDn Down}{PgDn Up}
,::Send {Ctrl Down}{Down Down}{Down Up}{Ctrl Up}
B::Send {Ctrl Down}{b Down}{b Up}{Ctrl Up}
I::Send {Ctrl Down}{i Down}{i Up}{Ctrl Up}
U::Send {Ctrl Down}{u Down}{u Up}{Ctrl Up}
Z::Send {Ctrl Down}{z Down}{z Up}{Ctrl Up}
X::Send {Ctrl Down}{x Down}{x Up}{Ctrl Up}
C::Send {Ctrl Down}{c Down}{c Up}{Ctrl Up}
V::Send {Ctrl Down}{v Down}{v Up}{Ctrl Up}
Y::Send {Ctrl Down}{y Down}{y Up}{Ctrl Up}
Tab::Send {Ctrl Down}{a Down}{a Up}{Ctrl Up}
=::Send {Ctrl Down}{WheelUp Down}{WheelUp Up}{Ctrl Up}
-::Send {Ctrl Down}{WheelDown Down}{WheelDown Up}{Ctrl Up}
Ctrl::Send {BackSpace Down}{BackSpace Up}
CapsLock::Send {BackSpace Down}{BackSpace Up}
Shift::Space
]::Send {Tab Down}{Tab Up}
[::Send {Shift Down}{Tab Down}{Tab Up}{Shift Up}
Q::Send {Ctrl Down}{s Down}{s Up}{Ctrl Up}
3::Send {Shift Down}{3 Down}{3 Up}{Shift Up}
`::Send {`` Down}{`` Up}
8::Send {Shift Down}{8 Down}{8 Up}{Shift Up}
/::Send {Ctrl Down}{Enter Down}{Enter Up}{Ctrl Up}
Enter::Send {Shift Down}{Enter Down}{Enter Up}{Shift Up}
BackSpace::Send {Delete Down}{Delete Up}
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
5::Gosub,AlignLeft
6::Gosub,AlignCenter
7::Gosub,AlignRight
O::Gosub,DecreaseFont
P::Gosub,IncreaseFont
R::Send {Shift Down}{Up Down}{Up Up}{Shift Up}
M::Send {Shift Down}{Down Down}{Down Up}{Shift Up}
F::Send {Shift Down}{Left Down}{Left Up}{Shift Up}
J::Send {Shift Down}{Right Down}{Right Up}{Shift Up}
D::Send {Ctrl Down}{Shift Down}{Left Down}{Left Up}{Shift Up}{Ctrl Up}
K::Send {Ctrl Down}{Shift Down}{Right Down}{Right Up}{Shift Up}{Ctrl Up}
H::Send {Shift Down}{F10 Down}{F10 Up}{Shift Up}
G::Send {Esc Down}{Esc Up}
9::Send {Shift Down}{WheelUp Down}{WheelUp Up}{Shift Up}
0::Send {Shift Down}{WheelDown Down}{WheelDown Up}{Shift Up}
'::Send {Enter Down}{Enter Up}
S::Send {Shift Down}{Home Down}{Home Up}{Shift Up}
L::Send {Shift Down}{End Down}{End Up}{Shift Up}
W::Send {Ctrl Down}{Shift Down}{Home Down}{Home Up}{Shift Up}{Ctrl Up}
.::Send {Ctrl Down}{Shift Down}{End Down}{End Up}{Shift Up}{Ctrl Up}
T::Send {Shift Down}{PgUp Down}{PgDn Up}{Shift Up}
E::Send {Ctrl Down}{Shift Down}{Up Down}{Up Up}{Shift Up}{Ctrl Up}
N::Send {Shift Down}{PgDn Down}{PgDn Up}{Shift Up}
,::Send {Ctrl Down}{Shift Down}{Down Down}{Down Up}{Shift Up}{Ctrl Up}
B::Send {Ctrl Down}{b Down}{b Up}{Ctrl Up}
I::Send {Ctrl Down}{i Down}{i Up}{Ctrl Up}
U::Send {Ctrl Down}{u Down}{u Up}{Ctrl Up}
Z::Send {Ctrl Down}{z Down}{z Up}{Ctrl Up}
X::Send {Ctrl Down}{x Down}{x Up}{Ctrl Up}
C::Send {Ctrl Down}{c Down}{c Up}{Ctrl Up}
V::Send {Ctrl Down}{v Down}{v Up}{Ctrl Up}
Y::Send {Ctrl Down}{y Down}{y Up}{Ctrl Up}
Tab::Send {Ctrl Down}{a Down}{a Up}{Ctrl Up}
=::Send {Ctrl Down}{WheelUp Down}{WheelUp Up}{Ctrl Up}
-::Send {Ctrl Down}{WheelDown Down}{WheelDown Up}{Ctrl Up}
Ctrl::Send {BackSpace Down}{BackSpace Up}
CapsLock::Send {BackSpace Down}{BackSpace Up}
Shift::Space
]::Send {Tab Down}{Tab Up}
[::Send {Shift Down}{Tab Down}{Tab Up}{Shift Up}
Q::Send {Ctrl Down}{s Down}{s Up}{Ctrl Up}
3::Send {Shift Down}{3 Down}{3 Up}{Shift Up}
`::Send {`` Down}{`` Up}
8::Send {Shift Down}{8 Down}{8 Up}{Shift Up}
/::Send {Ctrl Down}{Enter Down}{Enter Up}{Ctrl Up}
Enter::Send {Shift Down}{Enter Down}{Enter Up}{Shift Up}
BackSpace::Send {Delete Down}{Delete Up}
Esc::Return
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