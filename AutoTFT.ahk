#MaxThreadsPerHotkey 3
#InstallMouseHook

;dimentions used to find the buttons on the league client
    ;main client
    const LeagueWidth := 35 
    const LeagueHeight := 19.5
    ;play button
    const LeaguePlayX := 3
    const LeaguePlayY := 1
    ;tft logo
    const LeagueSelectTftX := 
    const LeagueSelectTftY := 


DetectHiddenWindows, On
; start program
F10::
    if WinExist("League of Legends")
        UniqueID := WinExist("League of Legends")
        WinShow
        ; for debug only, will be completely hidden in final
        WinGetPos, X, Y, Width, Height, ahk_id %UniqueID%
        CoordMode, Mouse , Relative
        Msgbox, "League of Legends size" %Width% "," %Height%
        StartQueue(X, Y, Width, Height, UniqueID)

StartQueue(X, Y, Width, Height, UniqueID){
    ;instantly run all commands, code wont break if click is held down
    SetControlDelay -1 
    ; click play
    playButtonX := Width * (LeaguePlayX/LeagueWidth)
    playButtonY := Height * (LeaguePlayY / LeagueHeight)
    clickLeague(playButtonX, playButtonY, UniqueID)
    

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
