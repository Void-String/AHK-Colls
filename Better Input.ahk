#Persistent
SetTimer, MoveMouse
MoveMouse:
If ( A_TimeIdle > 60000 ) {
  MouseMove, 10 , 0,, R
Sleep, 1000
  MouseMove, -10, 0,, R
}
Return

;Some of my keyboard keys doesn't work so I made alternative key to access disabled key
!q::
Send {i}
return
!w::
Send {I}
return
!e::
Send {k}
return
!r::
Send {K}
return
!1::
Send {<}
return
!2::
Send {,}
return
!3::
Send {8}
return
!4::
Send {*}
return

#c::opencmdhere()
; Press Win + C to open Command Prompt in the current directory.

opencmdhere() {
    If WinActive("ahk_class CabinetWClass") || WinActive("ahk_class ExploreWClass") {
        WinHWND := WinActive()
        For win in ComObjCreate("Shell.Application").Windows
            If (win.HWND = WinHWND) {
		currdir := SubStr(win.LocationURL, 9)
		currdir := RegExReplace(currdir, "%20", " ")
                Break
            }
    }
    Run, cmd, % currdir ? currdir : "C:\"
}

#+c::opencmdhereadmin()
; Press Win + Shift + C to open admin Command Prompt in the current directory.
opencmdhereadmin() {
    If WinActive("ahk_class CabinetWClass") || WinActive("ahk_class ExploreWClass") {
        WinHWND := WinActive()
        For win in ComObjCreate("Shell.Application").Windows
            If (win.HWND = WinHWND) {
		currdir := SubStr(win.LocationURL, 9)
		currdir := RegExReplace(currdir, "%20", " ")
		currdir := RegExReplace(currdir, "/", "\")
                Break
            }
    }

    Run *RunAs cmd.exe /k pushd %currdir%
}