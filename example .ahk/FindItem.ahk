#Include DotaScriptsLib.ahk
SetSettings()

setslotcoords("0", "1", "0", "0", "0", "0", "inventory")

!1::
SoundBeep, 1500, 30
if !itemsearch("2", "tranquilboots.png")
	MsgBox yes
return








f3::ExitApp
