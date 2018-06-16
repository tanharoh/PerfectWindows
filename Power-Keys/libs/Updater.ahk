Updater:

Gui,Updating: +LastFound +AlwaysOnTop -Caption +ToolWindow
Gui,Updating: Color, red
Gui,Updating: Font,cwhite s%FontSize% wbold q5,Segoe UI
Gui,Updating: Add, Text, ,%_Updating%
Gui,Updating: Show,AutoSize Center NoActivate
UrlDownloadToFile, https://raw.githubusercontent.com/szzhiyang/PerfectWindows/master/Power-Keys/Power-Keys-x%bit%.exe, %ProgramFilesDir%\latest-Power-Keys.exe
if ErrorLevel
{
    FileDelete, %ProgramFilesDir%\latest-Power-Keys.exe
    run,%2%
    ExitApp
}
Else
{
    FileMove,%ProgramFilesDir%\latest-Power-Keys.exe, %2%,1
    run,%2%
    ExitApp
}
