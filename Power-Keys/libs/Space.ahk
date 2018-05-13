#if !flaunch&&spaceenabled&&!SpaceDisabled&&!GameMode

space::
settimer,spacetimer,%delay%
oneenabled=0
twoenabled=0
spacesent=0
space1=0
space2=1
space3=0
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
Gui,indicator: Hide
return

spacetimer:
settimer,spacetimer,delete
space1=1
space2=0
space3=0
Gui,indicator: +LastFound +AlwaysOnTop -Caption +ToolWindow
Gui,indicator: Show, xCenter y%y% h%h% w%A_ScreenWidth% NoActivate
return

#If

#if space1|space3

Space & A::
Space & `;::
space1=0
space3=1
Gui,indicator2: +LastFound +AlwaysOnTop -Caption +ToolWindow
Gui,indicator2: Show, xCenter y%y% h%h% w%A_ScreenWidth% NoActivate
KeyWait, a
KeyWait, `;
space1=1
space3=0
Gui,indicator2: Hide
return

#if

#if space1
Space & F::Send {Left}
Space & J::Send {Right}
Space & D::Send ^{Left}
Space & K::Send ^{Right}
Space & H::Send +{F10}
Space & G::Send {Esc}
Space & 9::Send +{WheelUp}
Space & 0::Send +{WheelDown}
Space & '::Send {Enter}
Space & S::Send {Home}
Space & L::Send {End}
Space & W::Send ^{Home}
Space & .::Send ^{End}
Space & R::Send {Up}
Space & T::Send {PgUp}
Space & E::Send ^{Up}
Space & M::Send {Down}
Space & N::Send {PgDn}
Space & ,::Send ^{Down}
Space & B::Send ^{b}
Space & I::Send ^{i}
Space & U::Send ^{u}
Space & Z::Send ^{z}
Space & X::Send ^{x}
Space & C::Send ^{c}
Space & V::Send ^{v}
Space & Y::Send ^{y}
Space & 5::Send ^{l}
Space & 6::Send ^{e}
Space & 7::Send ^{r}
Space & Tab::Send ^{a}
Space & O::Send ^+{,}
Space & P::Send ^+{.}
Space & =::Send ^{WheelUp}
Space & -::Send ^{WheelDown}
Space & LCtrl::Send {BackSpace}
Space & RCtrl::Send {BackSpace}
Space & CapsLock::Send {BackSpace}
Space & Shift::Space
Space & ]::Send {Tab}
Space & [::Send +{Tab}
Space & Q::Send ^{s}
Space & 3::Send +{3}
Space & `::Send {``}
Space & 8::Send +{8}
Space & /::Send ^{Enter}
Space & Enter::Send +{Enter}
Space & bs::Send {Delete}
Space & Esc::Send !{F4}
Space & F1::Send {F1}
Space & F2::Send {F2}
Space & F3::Send {F3}
Space & F4::Send {F4}
Space & F5::Send {F5}
Space & F6::Send {F6}
Space & F7::Send {F7}
Space & F8::Send {F8}
Space & F9::Send {F9}
Space & F10::Send {F10}
Space & F11::Send {F11}
Space & F12::Send {F12}
Space & Up::Send {Up}
Space & Down::Send {Down}
Space & Left::Send {Left}
Space & Right::Send {Right}
Space & Home::Send {Home}
Space & End::Send {End}
Space & PgUp::Send {PgUp}
Space & PgDn::Send {PgDn}

#if

#if space3
Space & F::Send +{Left}
Space & J::Send +{Right}
Space & D::Send ^+{Left}
Space & K::Send ^+{Right}
Space & H::Send +{F10}
Space & G::Send {Esc}
Space & 9::Send +{WheelUp}
Space & 0::Send +{WheelDown}
Space & '::Send {Enter}
Space & S::Send +{Home}
Space & L::Send +{End}
Space & W::Send ^+{Home}
Space & .::Send ^+{End}
Space & R::Send +{Up}
Space & T::Send {PgUp}
Space & E::Send +^{Up}
Space & M::Send +{Down}
Space & N::Send {PgDn}
Space & ,::Send ^+{Down}
Space & B::Send ^{b}
Space & I::Send ^{i}
Space & U::Send ^{u}
Space & Z::Send ^{z}
Space & X::Send ^{x}
Space & C::Send ^{c}
Space & V::Send ^{v}
Space & Y::Send ^{y}
Space & 5::Send ^{l}
Space & 6::Send ^{e}
Space & 7::Send ^{r}
Space & Tab::Send ^{a}
Space & O::Send ^+{,}
Space & P::Send ^+{.}
Space & =::Send ^{WheelUp}
Space & -::Send ^{WheelDown}
Space & LCtrl::Send {BackSpace}
Space & RCtrl::Send {BackSpace}
Space & CapsLock::Send {BackSpace}
Space & Shift::Space
Space & ]::Send {Tab}
Space & [::Send +{Tab}
Space & Q::Send ^{s}
Space & 3::Send +{3}
Space & `::Send {``}
Space & 8::Send +{8}
Space & /::Send ^{Enter}
Space & Enter::Send +{Enter}
Space & bs::Send {Delete}
Space & Esc::Send !{F4}
Space & F1::Send {F1}
Space & F2::Send {F2}
Space & F3::Send {F3}
Space & F4::Send {F4}
Space & F5::Send {F5}
Space & F6::Send {F6}
Space & F7::Send {F7}
Space & F8::Send {F8}
Space & F9::Send {F9}
Space & F10::Send {F10}
Space & F11::Send {F11}
Space & F12::Send {F12}
Space & Up::Send {Up}
Space & Down::Send {Down}
Space & Left::Send {Left}
Space & Right::Send {Right}
Space & Home::Send {Home}
Space & End::Send {End}
Space & PgUp::Send {PgUp}
Space & PgDn::Send {PgDn}

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
Send {space}{%A_ThisLabel%}
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