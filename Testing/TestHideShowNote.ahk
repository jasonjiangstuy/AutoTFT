#Persistent
; DetectHiddenWindows On
deBugToggleShow = True
OnExit("ExitFunc")
myHidden := []
; testing Show + Hide
Run, notepad.exe
WinWait, Untitled - Notepad, , 3
if ErrorLevel
{
    MsgBox, WinWait timed out.
    return
}
else{
    Msgbox "go" ;
    UniqueID := WinExist("Untitled - Notepad") 
    WinGetTitle, WindowName, ahk_id %UniqueID%  
    myHidden.Push(%UniqueID%)
}


F1::
    Suspend
    return

A::
    Msgbox "run" %UniqueID% %WindowName%
    IfWinExist, ahk_id %UniqueID% %WindowName%
        WinHide, ahk_id %UniqueID%
    Else
        WinShow, ahk_id %UniqueID%

    return

B::
    WinKill, ahk_id %UniqueID%
    return

ExitFunc(ExitReason, ExitCode){
    global
    if ExitReason not in Logoff,Shutdown
    {
        MsgBox, 4, , Are you sure you want to exit?
        IfMsgBox, No
            return 1  ; OnExit functions must return non-zero to prevent exit.
    }
    Loop, %myHidden%{
        WinShow ahk_id myHidden%A_Index%
    }

    ; Do not call ExitApp -- that would prevent other OnExit functions from being called.
}

^!r::Reload
return
