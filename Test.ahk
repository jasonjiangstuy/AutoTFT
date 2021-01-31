; Testing finding hidden windows
Hidden = 0
WinGet, All, List
WinGet, NotHidden, List
Loop, %All%
{
    ID := All%A_Index%
    Loop, %NotHidden%
        If (ID = NotHidden%A_Index%)
            ID =
    IF !ID
        Continue
    Hidden++
    Hidden%Hidden% := ID
}
MsgBox,%  "Number of windows:`nAll: " All "`nHidden: " Hidden "`nNotHidden: " NotHidden
