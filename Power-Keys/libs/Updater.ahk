Updater:
SetTimer,RestartUpdater,1800000
FileDelete, %UpdateDir%\latest.exe
FileDelete, %UpdateDir%\version.txt
UrlDownloadToFile, https://raw.githubusercontent.com/szzhiyang/PerfectWindows/master/Power-Keys/Version.txt,%UpdateDir%\version.txt
FileReadLine, latestversion, %UpdateDir%\version.txt, 1
RegRead, temp, HKLM\Software\szzhiyang\Power Keys,GameMode
if (latestversion>CurrentVersion)&&(temp!=1)
{
    UrlDownloadToFile, https://raw.githubusercontent.com/szzhiyang/PerfectWindows/master/Power-Keys/Power-Keys-x%bit%.exe,%UpdateDir%\latest.exe
    RegRead, temp, HKLM\Software\szzhiyang\Power Keys,GameMode
    if temp!=1
    {
        RunWait, %A_WinDir%\system32\taskkill.exe /im "%2%",,Hide
        filecopy,%UpdateDir%\latest.exe,%3%,1
        run,"%3%" silent,,UseErrorLevel
    }
}
return

RestartUpdater:
run,"%A_ScriptFullPath%" /restart update "%2%" "%3%",UseErrorLevel
return