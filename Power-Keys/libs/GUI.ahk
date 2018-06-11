CreateGUI:
Gui,SpaceEnabled: Color, red
Gui,SpaceEnabled: Font,cwhite s%FontSize% wbold q5,Segoe UI
Gui,SpaceEnabled: Add, Text, ,%_SpaceEnabled%
Gui,SpaceDisabled: Color, 303030
Gui,SpaceDisabled: Font,cB7B7B7 s%FontSize% wbold q5,Segoe UI
Gui,SpaceDisabled: Add, Text, ,%_SpaceDisabled%
Gui,GameModeEnabled: Color, red
Gui,GameModeEnabled: Font,cwhite s%FontSize% wbold q5,Segoe UI
Gui,GameModeEnabled: Add, Text, ,%_GameModeEnabled%
Gui,GameModeDisabled: Color, 303030
Gui,GameModeDisabled: Font,cB7B7B7 s%FontSize% wbold q5,Segoe UI
Gui,GameModeDisabled: Add, Text, ,%_GameModeDisabled%
Return

SpaceEnabled:
Gui,SpaceEnabled: +LastFound +AlwaysOnTop -Caption +ToolWindow
Gui,SpaceEnabled: Show,AutoSize Center NoActivate
sleep 1000
Gui,SpaceEnabled:Hide
Return

SpaceDisabled:
Gui,SpaceDisabled: +LastFound +AlwaysOnTop -Caption +ToolWindow
Gui,SpaceDisabled: Show,AutoSize Center NoActivate
sleep 1000
Gui,SpaceDisabled:Hide
Return

GameModeEnabled:
Gui,GameModeEnabled: +LastFound +AlwaysOnTop -Caption +ToolWindow
Gui,GameModeEnabled: Show,AutoSize Center NoActivate
sleep 1000
Gui,GameModeEnabled:Hide
Return

GameModeDisabled:
Gui,GameModeDisabled: +LastFound +AlwaysOnTop -Caption +ToolWindow
Gui,GameModeDisabled: Show,AutoSize Center NoActivate
sleep 1000
Gui,GameModeDisabled:Hide
Return