#SingleInstance, Force
try 
{
	If not A_IsAdmin
	Run *RunAs "%A_ScriptFullPath%"
} 
catch 
{
	MsgBox, Could not obtain admin privileges.
	Pause
}


App1 = SppExtComObj.Exe
App2 = sppsvc.exe
App3 = CompPkgSrv.exe
App4 = MoUsoCoreWorker.exe
App5 = TiWorker.exe

Loop
{
	Process, Exist, % App1
	If !ErrorLevel {
		; Break
		Sleep 7000
	} 
	else 
	{
		Process, Close, % App1
		;TrayTip, Message, % App1 " has been killed.", , 16
		Sleep 7000
	}
	
	Process, Exist, % App2
	If !ErrorLevel {
		; Break
		Sleep 7000
	} 
	else 
	{
		Process, Close, % App2
		;TrayTip, Message, % App2 " has been killed.", , 16
		Sleep 7000
	}
	
	Process, Exist, % App3
	If !ErrorLevel {
		; Break
		Sleep 7000
	} 
	else 
	{
		Process, Close, % App3
		;TrayTip, Message, % App3 " has been killed.", , 16
		Sleep 7000
	}

	Process, Exist, % App4
	If !ErrorLevel {
		; Break
		Sleep 7000
	} 
	else 
	{
		Process, Close, % App4
		;TrayTip, Message, % App4 " has been killed.", , 16
		Sleep 7000
	}
	
		Process, Exist, % App5
	If !ErrorLevel {
		; Break
		Sleep 7000
	} 
	else 
	{
		Process, Close, % App5
		;TrayTip, Message, % App5 " has been killed.", , 16
		Sleep 7000
	}
}

return