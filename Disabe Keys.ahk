#NoEnv  						; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  				; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  	; Ensures a consistent starting directory.

; Find a window
Loop
{
	if not WinExist("Password Prompt")
		ExitApp
}

; Disabling Some Hotkeys
Alt::Return
Tab::Return
LControl::Return
Del::Return
LWin::Return
RWin::Return

; Only code to close program when emergency
; Left Shift + End
>+End::ExitApp