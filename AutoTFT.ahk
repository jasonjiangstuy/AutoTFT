#MaxThreadsPerHotkey 3
#InstallMouseHook

;dimentions used to find the buttons on the league client in cm 
    ;main client
    
    LeagueWidth := 35 
    LeagueHeight := 19.5

    ; order: play button => tft logo
    myPostions := [[3, 1],[20, 6]]

DetectHiddenWindows, On
; start program
F10::
    if WinExist("League of Legends")
        UniqueID := WinExist("League of Legends")
        WinShow ; for debug only, will be completely hidden in final
        WinGetPos, X, Y, Width, Height, ahk_id %UniqueID%
        CoordMode, Mouse , Relative
        Msgbox, "League of Legends size" %Width% "," %Height%
        StartQueue(X, Y, Width, Height, UniqueID)

StartQueue(X, Y, Width, Height, UniqueID){
    global ;assume all variables are global except Paras
    
    SetControlDelay -1 ;instantly run all commands, code wont break if click is held down
    
    ; click buttons to queue up
    For key, value in myPostions{
        playButtonX := Width * (value[1]/LeagueWidth)
        playButtonY := Height * (value[2]/LeagueHeight)
        clickLeague(playButtonX, playButtonY, UniqueID)
        Sleep, 500
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


^!r::Reload
return
