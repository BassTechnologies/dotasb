#Include DotaScriptsLib.ahk
SetSettings()

setslotcoords("0", "1", "0", "1", "0", "0", "inventory")
setslotcoords("1", "1", "1", "0", "0", "0", "backpack")

bhsetslotcoords("x", "1", "6", "1488", "inventory")
bhsetslotcoords("x", "2", "6", "1528", "inventory")
bhsetslotcoords("y", "1", "6", "1019", "inventory")
bhsetslotcoords("y", "2", "6", "1047", "inventory")

!x::
tick := !d - !i := !i
abuseitems(tick, "2", "2", "1", 5, 10)
abuseitems(tick, "2", "4", "2", 5, 10)
abuseitems(tick, "2", "6", "3", 5, 10) 
; В функции setslotcoords() мы не указали координаты 6-го слота, однако мы их указали вручную функцией bhsetslotcoords()
return





f3::ExitApp