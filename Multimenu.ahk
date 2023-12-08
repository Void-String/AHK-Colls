;Press RButton twice to display Programs Menu, 3 times for Settings Menu, 4 times for FolderMenu.
;To add a menu item, you need to add a new Label in your script and add its name to programs, settings or folders variable in first lines.

Menu = Programs|Settings|Folders
Programs = PROGRAMS|Notepad|Explorer|Calculator
Settings = SETTINGS|ControlPanel|Display
Folders = FOLDERS|Windows|ProgramFiles|Desktop
Loop, Parse, Menu, |
{
	B_LoopField := A_LoopField
	Loop, Parse, %B_LoopField%, |
	{
		Menu, %B_LoopField%, Add, %A_LoopField%, %A_LoopField%
		If A_Index = 1
		{
			Menu, %B_LoopField%, Default, %A_LoopField%
			Menu, %B_LoopField%, Add
		}
	}
}
Return

~RButton::RapidHotkey("Programs""Settings""Folders", 2,0.4,1)

Folders:
Settings:
Programs:
Menu,%A_ThisLabel%, Show
Return

Notepad:
Run, notepad.exe
Return
Explorer:
Run, explorer.exe
Return
Calculator:
Run, calc.exe
Return
ControlPanel:
Run, control.exe
Return
Display:
Run, desk.cpl
Return
Windows:
Run, explorer.exe "C:\Windows"
Return
ProgramFiles:
Run, explorer.exe "%A_ProgramFiles%"
Return
Desktop:
Run, explorer.exe "%A_Desktop%"
Return

RapidHotkey(keystroke, times="", delay=0.15, IsLabel=0)
{
	Pattern := Morse(delay*1000)
	If (StrLen(Pattern) < 2 and Chr(Asc(times)) != "1")
		Return
	If (times = "" and InStr(keystroke, """"))
	{
		Loop, Parse, keystroke,""	
			If (StrLen(Pattern) = A_Index+1)
				continue := A_Index, times := StrLen(Pattern)
	}
	Else if (RegExMatch(times, "^\d+$") and InStr(keystroke, """"))
	{
		Loop, Parse, keystroke,""
			If (StrLen(Pattern) = A_Index+times-1)
				times := StrLen(Pattern), continue := A_Index
	}
	Else if InStr(times, """")
	{
		Loop, Parse, times,""
			If (StrLen(Pattern) = A_LoopField)
				continue := A_Index, times := A_LoopField
	}
	Else if (times = "")
		continue = 1, times = 1
	Else if (times = StrLen(Pattern))
		continue = 1
	If !continue
		Return
	Loop, Parse, keystroke,""
		If (continue = A_Index)
			keystr := A_LoopField
	Loop, Parse, IsLabel,""
		If (continue = A_Index)
			IsLabel := A_LoopField
	hotkey := RegExReplace(A_ThisHotkey, "[\*\~\$\#\+\!\^]")
	Loop % times
		backspace .= "{Backspace}"
	keywait = Ctrl|Alt|Shift|LWin|RWin
	Loop, Parse, keywait, |
		KeyWait, %A_LoopField%
	If ((!IsLabel or (IsLabel and IsLabel(keystr))) and InStr(A_ThisHotkey, "~") and !RegExMatch(A_ThisHotkey
	, "i)\^[^\!\d]|![^\d]|#|Control|Ctrl|LCtrl|RCtrl|Shift|RShift|LShift|RWin|LWin|Escape|BackSpace|F\d\d?|"
	. "Insert|Esc|Escape|BS|Delete|Home|End|PgDn|PgUp|Up|Down|Left|Right|ScrollLock|CapsLock|NumLock|AppsKey|"
	. "PrintScreen|CtrlDown|Pause|Break|Help|Sleep|Browser_Back|Browser_Forward|Browser_Refresh|Browser_Stop|"
	. "Browser_Search|Browser_Favorites|Browser_Home|Volume_Mute|Volume_Down|Volume_Up|MButton|RButton|LButton|"
	. "Media_Next|Media_Prev|Media_Stop|Media_Play_Pause|Launch_Mail|Launch_Media|Launch_App1|Launch_App2"))
		Send % backspace
	If (WinExist("AHK_class #32768") and hotkey = "RButton")
		WinClose, AHK_class #32768
	If !IsLabel
		Send % keystr
	else if IsLabel(keystr)
		Gosub, %keystr%
	Return
}	
Morse(timeout = 400) { ;by Laszo -> http://www.autohotkey.com/forum/viewtopic.php?t=16951 (Modified to return: KeyWait %key%, T%tout%)
   static lastkey
   tout := timeout/1000
   key := RegExReplace(A_ThisHotKey,"[\*\~\$\#\+\!\^]")
   Loop {
      t := A_TickCount
      KeyWait %key%, T%tout%
	  Pattern .= A_TickCount-t > timeout
	  If(ErrorLevel)
		Return Pattern
	  KeyWait %key%,DT%tout%
      If (ErrorLevel)
         Return Pattern
   }
}