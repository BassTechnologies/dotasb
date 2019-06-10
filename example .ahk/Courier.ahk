#Include DotaScriptsLib.ahk
SetSettings()

InventoryKeys := ["1", "2", "3", "4", "5", "6"]
SkillKeys := ["q", "w", "e", "r", "d", "f"]

!3:: 
SoundBeep, 1500, 30
loop
{
sleep 10
vksend("72", "0")
if GetKeyState("F3", "P") ; Âûêëþ÷åíèå
	break
}
return



end::ExitApp
