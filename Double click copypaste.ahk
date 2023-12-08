~*LButton::
T := !T
If (A_TimeSincePriorHotkey < 400) and (A_TimeSincePriorHotkey<>-1)
	If (T == 0) {
		Send {Ctrl Down}c{Ctrl Up}
		T=1
		;MsgBox, Ctrl+C was pressed
		TrayTip , Double Click Command, Ctrl+C, 3
	}
	else if (T == 1) {
		Send {Ctrl Down}v{Ctrl Up}
		T=0
		;MsgBox, Ctrl+V was pressed
		TrayTip , Double Click Command, Ctrl+V, 3
	}
Return