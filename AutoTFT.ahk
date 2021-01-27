#MaxThreadsPerHotkey 3
#InstallMouseHook

;dimentions used to find the buttons on the league client in cm 
    ;main client
    
    LeagueWidth := 35 
    LeagueHeight := 19.5

    ; order: play button => tft logo
    myPostions := [[3, 1],[20, 6]]
    
    LeaguePlayX := 3
    LeaguePlayY := 1
    
    LeagueSelectTftX := 20
    LeagueSelectTftY := 6


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
    ; For value in myPostions    
        playButtonX := Width * (LeaguePlayX/LeagueWidth)
        playButtonY := Height * (LeaguePlayY/LeagueHeight)

        ;testing
        ; Msgbox, "Target" %playButtonX% "," %playButtonY% 

        clickLeague(playButtonX, playButtonY, UniqueID)
        Sleep, 500

    ;choose tft in gamemode
        selectTftX := Width * (LeagueSelectTftX/LeagueWidth)
        selectTftY := Height * (LeagueSelectTftY/LeagueHeight)
        ; Msgbox, "Target" %selectTftX% "," %selectTftY% 
        clickLeague(selectTftX, selectTftY, UniqueID)



    

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
