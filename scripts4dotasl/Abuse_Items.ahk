; ////////////////////////
; Script for [DOTASL] Dota Scripts Loader
; ////////////////////////
var_loadconfig := 0
;~ Importantly! This var must be a first! (4 check load config or not)

var_x1_slot4abuse1 := 1220
var_x2_slot4abuse1 := 1275
var_y1_slot4abuse1 := 985
var_y2_slot4abuse1 := 1047
var_x1_slot4abuse2 := 1150
var_x2_slot4abuse2 := 1215
var_y1_slot4abuse2 := 990
var_y2_slot4abuse2 := 1030
var_x1_slot4abuse3 := 1285
var_x2_slot4abuse3 := 1340
var_y1_slot4abuse3 := 990
var_y2_slot4abuse3 := 1030
var_x1_slotbackpack1 := 1158
var_x2_slotbackpack1 := 1210
var_y1_slotbackpack1 := 1040
var_y2_slotbackpack1 := 1068
var_x1_slotbackpack2 := 1222
var_x2_slotbackpack2 := 1275
var_y1_slotbackpack2 := 1040
var_y2_slotbackpack2 := 1068
var_x1_slotbackpack3 := 1285
var_x2_slotbackpack3 := 1340
var_y1_slotbackpack3 := 1040
var_y2_slotbackpack3 := 1067
var_usingslot1 := 2
var_usingslot2 := 4
var_usingslot3 := 6
var_key_reload := "!F10"
var_key_start := "!x"
; ////////////////////////
; ////////////////////////
; ////////////////////////



#Include %A_AppData%
#Include DotaScriptsBuilder.ahk

SetSettings()
config("Abuse_Items")

Hotkey, %var_key_reload%, Reload, on
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
tick := !d - !i := !i
abuseitems(tick, "2", "2", "1", 15, 20)
abuseitems(tick, "2", "4", "2", 15, 20)
abuseitems(tick, "2", "6", "3", 15, 20)
return

Reload:
Reload
