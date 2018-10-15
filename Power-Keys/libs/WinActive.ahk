OneNoteDesktop(){
    If WinActive("ahk_exe OneNote.exe")
    Return 1
    else
    Return 0
}

OneNoteUWP(){
    If OneNoteDesktop() or !WinActive("ahk_exe ApplicationFrameHost.exe")
    Return 0
    WinGetTitle,Title,A
    if Title contains OneNote
    Return 1
    Return 0
}

Word(){
    If WinActive("ahk_exe WinWord.exe")
    Return 1
    else
    Return 0
}

Excel(){
    If WinActive("ahk_exe Excel.exe")
    Return 1
    else
    Return 0
}

PowerPoint(){
    If WinActive("ahk_exe PowerPnt.exe")
    Return 1
    else
    Return 0
}

Outlook(){
    If WinActive("ahk_exe Outlook.exe")
    Return 1
    else
    Return 0
}

WordPad(){
    If WinActive("ahk_exe WordPad.exe")
    Return 1
    else
    Return 0
}