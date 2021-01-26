#MaxThreadsPerHotkey 3

; testing
F9::
    if WinActive("League of Legends")
        UniqueID := WinActive("League of Legends")
        Msgbox %UniqueID%
        WinGetPos, X, Y, Width, Height, ahk_id %UniqueID%
        Msgbox, League of Legends is at %X%`,%Y%

; start program
F10::
    if WinActive("League of Legends")
        UniqueID := WinActive("League of Legends")
        


    
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