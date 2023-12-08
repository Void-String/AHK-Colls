#include RapidHotkey.ahk
#include Morse.ahk

;Press h 3 times rapidly to send Hello World!
~h::RapidHotkey("{Raw}Hello World!", 3) 

;Be careful, if you use this hotkey, above will not work properly
~o::RapidHotkey("^o", 4, 0.2) 

;Press Esc 4 times rapidly to exit this script
~Esc::RapidHotkey("exit", 4, 0.2, 1)

;Press LControl rapidly twice to AltTab
~LControl::RapidHotkey("!{TAB}",2)

;Press RControl rapidly twice to ShiftAltTab
~RControl::RapidHotkey("+!{TAB}",2) 

;Switch back in internal windows
~LShift::RapidHotkey("^{TAB}", 2) 

;Switch between internal windows
~RShift::RapidHotkey("^+{TAB}", 2) 

;Run Windows Explorer
~e::RapidHotkey("#e""#r",3) 
~^!7::RapidHotkey("{{}{}}{Left}", 2)

;You Can also specify a Label to be launched
~a::RapidHotkey("test", 2, 0.3, 1) 
test:
MsgBox, Test
Return

Exit:
ExitApp

~LButton & RButton::RapidHotkey("Menu1""Menu2""Menu3",1,0.3,1)
Menu1:
Menu2:
Menu3:
MsgBox % A_ThisLabel
Return

;Sub Commands
~space::RapidHotkey("Menu1""Menu2", 2, 0.2, 1) 

Menu1:
MyCommand(1)
Return

Menu2:
MyCommand(2)
Return

MyCommand(num){
	If (num == 1) {
		Run, notepad.exe
	}
	Else if(num == 2) {
		Run, cmd.exe C:/
	}
	return
}