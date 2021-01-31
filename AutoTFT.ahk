#MaxThreadsPerHotkey 1
#InstallMouseHook
; After running this script, right click the tray icon and click Exit to test the OnExit callback function.
#Persistent  ; Prevent the script from exiting automatically.
SetTitleMatchMode 2
DetectHiddenWindows On

; Register a function to be called on exit:
OnExit("ExitFunc")

myHidden := []
ExitFunc(ExitReason, ExitCode){
    global
    if ExitReason not in Logoff,Shutdown
    {
        MsgBox, 4, , Are you sure you want to exit?
        IfMsgBox, No
            return 1  ; OnExit functions must return non-zero to prevent exit.
    }
    Loop, %myHidden%{

    }

    ; Do not call ExitApp -- that would prevent other OnExit functions from being called.
}
;dimentions used to find the buttons on the league client in cm 
LeagueWidth := 35 
LeagueHeight := 19.5

; order: play button => tft logo => play x2
; [cm width from left, cm height from right, delay before command(Load time)]
QueueButtons := [[3, 1, 500],[20, 6, 1000], [14, 18.5, 3000], [14, 18.5, 3000]]



; start program


F10::
    if WinExist("League of Legends")
        UniqueID := WinExist("League of Legends")
        WinShow ; for debug only, will be completely hidden in final
        WinGetPos, X, Y, Width, Height, ahk_id %UniqueID%
        CoordMode, Mouse , Relative
        Msgbox, "League of Legends size" %Width% "," %Height%
        StartQueue(X, Y, Width, Height, UniqueID) ;start the queue
        ; Accept() ;check if accept button came up
            


    StartQueue(X, Y, Width, Height, UniqueID){
        global ;assume all variables are global except Paras
        SetControlDelay -1 ;instantly run all commands, code wont break if click is held down
        ; click buttons to queue up
        For key, value in QueueButtons{
            Sleep, value[3]
            ButtonX := Width * (value[1]/LeagueWidth)
            ButtonY := Height * (value[2]/LeagueHeight)
            clickLeague(ButtonX, ButtonY, UniqueID)
        }
    }

    ;Par: relative XY coords
    clickLeague(rX, rY, UniqueID){
        playXY = x
        playXY .= rX
        playXY .= " y"
        playXY .= rY
        ControlClick, %playXY%, ahk_id %UniqueID%
    }

    ; Accept
    return

^!r::Reload
return
