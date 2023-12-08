#Persistent
SetTimer, RefreshTrayTip, 1000
Gosub, RefreshTrayTip  ; Call it once to get it started right away.
return

RefreshTrayTip:
TrayTip, Refreshed TrayTip, This is a more permanent TrayTip., , 16
return