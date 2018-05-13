Updater:
SetTimer,RestartUpdater,1800000
FileRemoveDir,%UpdateDir%,1
UrlDownloadToFile, https://raw.githubusercontent.com/szzhiyang/PerfectWindows/master/Power-Keys/Version.txt,%UpdateDir%\version.txt
FileReadLine, latestversion, %UpdateDir%\version.txt, 1
RegRead, temp, HKLM\Software\szzhiyang\Power Keys,GameMode
if (latestversion>CurrentVersion)&&(temp!=1)
{
    UrlDownloadToFile, https://raw.githubusercontent.com/szzhiyang/PerfectWindows/master/Power-Keys/Power-Keys-x%bit%.exe,%UpdateDir%\latest.exe
    RegRead, temp, HKLM\Software\szzhiyang\Power Keys,GameMode
    if temp!=1
    {
        Loop,5
        {
            Process, Close, %2%
            filecopy,%UpdateDir%\latest.exe,%3%,1
        }
        run,"%3%" silent,,UseErrorLevel
    }
}
return

RestartUpdater:
run,"%A_ScriptFullPath%" /restart update "%2%" "%3%",UseErrorLevel
return