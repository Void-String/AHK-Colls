SetBatchLines -1
UPDATE_TASKBAR()

loop {
    WinWaitActive ahk_class Windows.UI.Core.CoreWindow
    UPDATE_TASKBAR()
    WinWaitNotActive ahk_class Windows.UI.Core.CoreWindow
    UPDATE_TASKBAR()
    hA := WinActive("A")
    WinWaitNotActive % "ahk_id" hA
    UPDATE_TASKBAR()
}
return

UPDATE_TASKBAR() {
    TaskBar_SetAttr(3)
}