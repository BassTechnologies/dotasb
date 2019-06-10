#Include DotaScriptsLib.ahk
SetSettings()
InventoryKeys := ["1", "2", "3", "4", "space", "6"]
SkillKeys := ["q", "w", "e", "r", "d", "f"]

v::
SoundBeep, 1500, 30
send(SkillKeys[1], "0")
sleep 100
send(SkillKeys[3], "0")
sleep 100
send(InventoryKeys[1], "0")
sleep 100
send(InventoryKeys[2], "0")
sleep 100
send(InventoryKeys[3], "0")•
sleep 100
send(InventoryKeys[4], "0")
sleep 100
send(InventoryKeys[5], "0")
sleep 100
send(SkillKeys[2], "0")
sleep 100
send(SkillKeys[4], "0")
return

f3::ExitApp
