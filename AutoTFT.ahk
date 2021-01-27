#MaxThreadsPerHotkey 3
#InstallMouseHook
; testing
F9::
    if WinActive("League of Legends")
        UniqueID := WinActive("League of Legends")
        Msgbox %UniqueID%
        WinGetPos, X, Y, Width, Height, ahk_id %UniqueID%
        Msgbox, League of Legends is at %X%`,%Y%
        Msgbox, League of Legends size %Width%`,%Height%

; start program
F10::
    if WinActive("League of Legends")
        UniqueID := WinActive("League of Legends")
        WinGetPos, X, Y, Width, Height, ahk_id %UniqueID%
        CoordMode, Mouse , Relative
        ;Msgbox, "League of Legends size" %Width% "," %Height%
        StartQueue(X, Y, Width, Height, UniqueID)

StartQueue(X, Y, Width, Height, UniqueID){
; click play
    playXY = x
    playXY .= Width * (3/35)
    playXY .= " y"
    playXY .= Height * (1 / 19.5)
    ; testX := Width * (3/35)
    ; testY := Height * (1 / 19.5)
    ; Msgbox, %playXY%
    Msgbox, %testX% %testY%
    SetControlDelay -1 ;This avoids holding the mouse button down during the click

    ; testing
    ; MouseMove, testX, testY
    ; Click 

    ControlClick, %playXY%, ahk_id %UniqueID%
    ; allow for auto tft grinding in the background

    ;* 3/35
    ;* 1 / 19.5
}
    
^!r::Reload
return


; toggle = 0
; #MaxThreadsPerHotkey 2

; F9::
;     Toggle := !Toggle
;      While Toggle{
;         click
;         sleep 1500
;     }
; ^!r::Reload
; return