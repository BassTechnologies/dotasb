#Include DotaScriptsLib.ahk
SetSettings()

InventoryKeys := ["1", "2", "3", "4", "space", "6"]
SkillKeys := ["q", "w", "e", "r", "d", "f"]

setslotcoords("0", "1", "0", "1", "0", "1", "inventory")
setslotcoords("1", "1", "1", "0", "0", "0", "backpack")

MsgBox % eventlist("inventory.key.2")
MsgBox % eventlist("inventory.key.5") 

MsgBox % eventlist("inventory.coords.2.1.x") ;x1 2 slot
MsgBox % eventlist("inventory.coords.3.2.y") ;y2 3 slot
; Пусто, ибо координаты мы НЕ указывали.

MsgBox % eventlist("backpack.coords.all")
MsgBox % eventlist("backpack.coords.3.1.y") ; y1 3 slot

f3::ExitApp