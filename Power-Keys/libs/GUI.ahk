CreateGUI:
global h:=A_ScreenHeight*0.01
global y:=A_ScreenHeight*0.99
Gui,redu: Color, red
Gui,redd: Color, red
Gui,yellowu: Color, yellow
Gui,yellowd: Color, yellow
Return

ShowYellow:
Gui,yellowu: +LastFound +AlwaysOnTop -Caption +ToolWindow
Gui,yellowu: Show, xCenter y0 h%h% w%A_ScreenWidth% NoActivate
Gui,yellowd: +LastFound +AlwaysOnTop -Caption +ToolWindow
Gui,yellowd: Show, xCenter y%y% h%h% w%A_ScreenWidth% NoActivate
Return

HideYellow:
Gui,yellowu:Hide
Gui,yellowd:Hide
Return

ShowRed:
Gui,redu: +LastFound +AlwaysOnTop -Caption +ToolWindow
Gui,redu: Show, xCenter y0 h%h% w%A_ScreenWidth% NoActivate
Gui,redd: +LastFound +AlwaysOnTop -Caption +ToolWindow
Gui,redd: Show, xCenter y%y% h%h% w%A_ScreenWidth% NoActivate
Return

HideRed:
Gui,redu:Hide
Gui,redd:Hide
Return