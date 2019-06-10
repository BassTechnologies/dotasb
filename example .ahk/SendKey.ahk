#Include DotaScriptsLib.ahk
SetSettings()
InventoryKeys := ["1", "2", "3", "4", "space", "6"]
SkillKeys := ["q", "w", "e", "r", "d", "f"]

z::
modsend("2", "alt")
SoundBeep, 1500, 30
return

x::
vksend("57", "0")
SoundBeep, 1500, 30
SoundBeep, 1500, 30
return

c::
send(InventoryKeys[2], "0")
SoundBeep, 1500, 30
SoundBeep, 1500, 30
SoundBeep, 1500, 30
return

f3::ExitApp


