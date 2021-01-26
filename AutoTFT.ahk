#MaxThreadsPerHotkey 3

; testing
F9::
    if WinActive("League of Legends")
        WinGet, active_id, PID, "League of Legends"
        ; UniqueID := WinGet("League of Legends")
        Msgbox, %active_id%

        WinGetPos, X, Y, Width, Height, active_id
        Msgbox, "League of Legends is at" %X%"`,"%Y%

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