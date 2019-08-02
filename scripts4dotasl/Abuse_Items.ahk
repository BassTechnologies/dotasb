; ////////////////////////
; Script for [DOTASL] Dota Scripts Loader
; ////////////////////////
var_loadconfig := 0
;~ Importantly! This var must be a first! (4 check load config or not)

var_x1_slot4abuse1 := 1180
var_x2_slot4abuse1 := 1235
var_y1_slot4abuse1 := 942
var_y2_slot4abuse1 := 987
var_x1_slot4abuse2 := 1115
var_x2_slot4abuse2 := 1170
var_y1_slot4abuse2 := 992
var_y2_slot4abuse2 := 1030
var_x1_slot4abuse3 := 1245
var_x2_slot4abuse3 := 1300
var_y1_slot4abuse3 := 990
var_y2_slot4abuse3 := 1030
var_x1_slotbackpack1 := 1110
var_x2_slotbackpack1 := 1160
var_y1_slotbackpack1 := 1040
var_y2_slotbackpack1 := 1068
var_x1_slotbackpack2 := 1177
var_x2_slotbackpack2 := 1230
var_y1_slotbackpack2 := 1040
var_y2_slotbackpack2 := 1068
var_x1_slotbackpack3 := 1240
var_x2_slotbackpack3 := 1300
var_y1_slotbackpack3 := 1040
var_y2_slotbackpack3 := 1067
; 1920/1080 ^

var_usingslot1 := 2
var_usingslot2 := 4
var_usingslot3 := 6
var_key_start := "!x"
; ////////////////////////
; ////////////////////////
; ////////////////////////



#NoTrayIcon
#Include %A_AppData%
#Include DotaScriptsBuilder.ahk

SetSettings()
config("Abuse_Items")

Hotkey, %var_key_start%, start, on

var_type := "inventory"
loop, 3
{
	bhsetslotcoords("x", "1", var_usingslot%a_index%, var_x1_slot4abuse%a_index%, var_type)
	bhsetslotcoords("x", "2", var_usingslot%a_index%, var_x2_slot4abuse%a_index%, var_type)
	bhsetslotcoords("y", "1", var_usingslot%a_index%, var_y1_slot4abuse%a_index%, var_type)
	bhsetslotcoords("y", "2", var_usingslot%a_index%, var_y2_slot4abuse%a_index%, var_type)
}

var_type := "backpack"
loop, 3
{
	bhsetslotcoords("x", "1", a_index, var_x1_slotbackpack%a_index%, var_type)
	bhsetslotcoords("x", "2", a_index, var_x2_slotbackpack%a_index%, var_type)
	bhsetslotcoords("y", "1", a_index, var_y1_slotbackpack%a_index%, var_type)
	bhsetslotcoords("y", "2", a_index, var_y2_slotbackpack%a_index%, var_type)
}
return

start:
IfWinNotActive, Dota 2
	return
tick := !d - !i := !i
abuseitems(tick, "2", "2", "1", 15, 20)
abuseitems(tick, "2", "4", "2", 15, 20)
abuseitems(tick, "2", "6", "3", 15, 20)
return
