IncreaseFont:
if Word()||PowerPoint()||Outlook()||OneNoteDesktop()||OneNoteUWP()||WordPad()||StickyNote()
Send {LCtrl Down}{LShift Down}{. Down}{. Up}{LShift Up}{LCtrl Up}
else if Excel()
Send {LCtrl Down}{WheelUp Down}{WheelUp Up}{LCtrl Up}
else
Send {LCtrl Down}{= Down}{= Up}{LCtrl Up}
Return

DecreaseFont:
if Word()||PowerPoint()||Outlook()||OneNoteDesktop()||OneNoteUWP()||WordPad()||StickyNote()
Send {LCtrl Down}{LShift Down}{, Down}{, Up}{LShift Up}{LCtrl Up}
else if Excel()
Send {LCtrl Down}{WheelDown Down}{WheelDown Up}{LCtrl Up}
else
Send {LCtrl Down}{- Down}{- Up}{LCtrl Up}
Return

AlignLeft:
if OneNoteDesktop()||OneNoteUWP()||Word()||PowerPoint()||Outlook()||WordPad()||StickyNote()
Send {LCtrl Down}{l Down}{l Up}{LCtrl Up}
Return

AlignCenter:
if Word()||PowerPoint()||Outlook()||WordPad()||StickyNote()
Send {LCtrl Down}{e Down}{e Up}{LCtrl Up}
Return

AlignRight:
if OneNoteDesktop()||OneNoteUWP()||Word()||PowerPoint()||Outlook()||WordPad()||StickyNote()
Send {LCtrl Down}{r Down}{r Up}{LCtrl Up}
Return

Save:
if OneNoteDesktop()||OneNoteUWP()
Send {F9 Down}{F9 Up}
else
Send {LCtrl Down}{s Down}{s Up}{LCtrl Up}
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
D::Send {LCtrl Down}{Left Down}{Left Up}{LCtrl Up}
K::Send {LCtrl Down}{Right Down}{Right Up}{LCtrl Up}
H::Send {LShift Down}{F10 Down}{F10 Up}{LShift Up}
G::Send {Esc Down}{Esc Up}
9::Send {LShift Down}{WheelUp Down}{WheelUp Up}{LShift Up}
0::Send {LShift Down}{WheelDown Down}{WheelDown Up}{LShift Up}
'::Send {Enter Down}{Enter Up}
S::Send {Home Down}{Home Up}
L::Send {End Down}{End Up}
W::Send {LCtrl Down}{Home Down}{Home Up}{LCtrl Up}
.::Send {LCtrl Down}{End Down}{End Up}{LCtrl Up}
T::Send {PgUp Down}{PgDn Up}
E::Send {LCtrl Down}{Up Down}{Up Up}{LCtrl Up}
N::Send {PgDn Down}{PgDn Up}
,::Send {LCtrl Down}{Down Down}{Down Up}{LCtrl Up}
B::Send {LCtrl Down}{b Down}{b Up}{LCtrl Up}
I::Send {LCtrl Down}{i Down}{i Up}{LCtrl Up}
U::Send {LCtrl Down}{u Down}{u Up}{LCtrl Up}
Z::Send {LCtrl Down}{z Down}{z Up}{LCtrl Up}
X::Send {LCtrl Down}{x Down}{x Up}{LCtrl Up}
C::Send {LCtrl Down}{c Down}{c Up}{LCtrl Up}
V::Send {LCtrl Down}{v Down}{v Up}{LCtrl Up}
Y::Send {LCtrl Down}{y Down}{y Up}{LCtrl Up}
Tab::Send {Tab Down}{Tab Up}
=::Send {LCtrl Down}{WheelUp Down}{WheelUp Up}{LCtrl Up}
-::Send {LCtrl Down}{WheelDown Down}{WheelDown Up}{LCtrl Up}
LCtrl::Send {Enter Down}{Enter Up}
CapsLock::Send {BackSpace Down}{BackSpace Up}
LShift::Space
RShift::Space
[::Send {LShift Down}{Tab Down}{Tab Up}{LShift Up}
]::Send {LShift Down}{Tab Down}{Tab Up}{LShift Up}
Q::Gosub,Save
3::Send {LShift Down}{3 Down}{3 Up}{LShift Up}
`::Send {`` Down}{`` Up}
8::Send {LShift Down}{8 Down}{8 Up}{LShift Up}
/::Send {LCtrl Down}{Enter Down}{Enter Up}{LCtrl Up}
Enter::Send {LShift Down}{Enter Down}{Enter Up}{LShift Up}
BackSpace::Send {Delete Down}{Delete Up}
\::Send {LShift Down}{\ Down}{\ Up}{LShift Up}
Esc::Send {Delete Down}{Delete Up}
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
R::Send {LShift Down}{Up Down}{Up Up}{LShift Up}
M::Send {LShift Down}{Down Down}{Down Up}{LShift Up}
F::Send {LShift Down}{Left Down}{Left Up}{LShift Up}
J::Send {LShift Down}{Right Down}{Right Up}{LShift Up}
D::Send {LCtrl Down}{LShift Down}{Left Down}{Left Up}{LShift Up}{LCtrl Up}
K::Send {LCtrl Down}{LShift Down}{Right Down}{Right Up}{LShift Up}{LCtrl Up}
H::Send {LShift Down}{F10 Down}{F10 Up}{LShift Up}
G::Send {Esc Down}{Esc Up}
9::Send {LShift Down}{WheelUp Down}{WheelUp Up}{LShift Up}
0::Send {LShift Down}{WheelDown Down}{WheelDown Up}{LShift Up}
'::Send {Enter Down}{Enter Up}
S::Send {LShift Down}{Home Down}{Home Up}{LShift Up}
L::Send {LShift Down}{End Down}{End Up}{LShift Up}
W::Send {LCtrl Down}{LShift Down}{Home Down}{Home Up}{LShift Up}{LCtrl Up}
.::Send {LCtrl Down}{LShift Down}{End Down}{End Up}{LShift Up}{LCtrl Up}
T::Send {LShift Down}{PgUp Down}{PgDn Up}{LShift Up}
E::Send {LCtrl Down}{LShift Down}{Up Down}{Up Up}{LShift Up}{LCtrl Up}
N::Send {LShift Down}{PgDn Down}{PgDn Up}{LShift Up}
,::Send {LCtrl Down}{LShift Down}{Down Down}{Down Up}{LShift Up}{LCtrl Up}
B::Send {LCtrl Down}{b Down}{b Up}{LCtrl Up}
I::Send {LCtrl Down}{i Down}{i Up}{LCtrl Up}
U::Send {LCtrl Down}{u Down}{u Up}{LCtrl Up}
Z::Send {LCtrl Down}{z Down}{z Up}{LCtrl Up}
X::Send {LCtrl Down}{x Down}{x Up}{LCtrl Up}
C::Send {LCtrl Down}{c Down}{c Up}{LCtrl Up}
V::Send {LCtrl Down}{v Down}{v Up}{LCtrl Up}
Y::Send {LCtrl Down}{y Down}{y Up}{LCtrl Up}
Tab::Send {Tab Down}{Tab Up}
=::Send {LCtrl Down}{WheelUp Down}{WheelUp Up}{LCtrl Up}
-::Send {LCtrl Down}{WheelDown Down}{WheelDown Up}{LCtrl Up}
LCtrl::Send {Enter Down}{Enter Up}
CapsLock::Send {BackSpace Down}{BackSpace Up}
LShift::Space
RShift::Space
[::Send {LShift Down}{Tab Down}{Tab Up}{LShift Up}
]::Send {LShift Down}{Tab Down}{Tab Up}{LShift Up}
Q::Gosub,Save
3::Send {LShift Down}{3 Down}{3 Up}{LShift Up}
`::Send {`` Down}{`` Up}
8::Send {LShift Down}{8 Down}{8 Up}{LShift Up}
/::Send {LCtrl Down}{Enter Down}{Enter Up}{LCtrl Up}
Enter::Send {LShift Down}{Enter Down}{Enter Up}{LShift Up}
BackSpace::Send {Delete Down}{Delete Up}
\::Send {LShift Down}{\ Down}{\ Up}{LShift Up}
Esc::Send {Delete Down}{Delete Up}
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
Tab::
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
Spacesent=1
Send {Space Down}{%A_ThisLabel% Down}{Space Up}{%A_ThisLabel% Up}
Return

`::
Spacesent=1
Send {Space Down}{`` Down}{Space Up}{`` Up}
Return

`;::
Spacesent=1
Send {Space Down}{; Down}{Space Up}{; Up}
Return

#if