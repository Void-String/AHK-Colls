^p::Reload

1::
SetMouseDelay, 0
MouseGetPos, x, y
Click, 670, 350, down
MouseMove, x, y, 0
KeyWait, %A_ThisHotkey%
Click, up
Return

p::Suspend