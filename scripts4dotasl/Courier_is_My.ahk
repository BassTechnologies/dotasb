; ////////////////////////
; Script for [DOTASL] Dota Scripts Loader
; ////////////////////////
var_loadconfig := 0
;~ Importantly! This var must be a first! (4 check load config or not)

var_cour_use := "F3"
var_key_start := "!F3"
; ////////////////////////
; ////////////////////////
; ////////////////////////





#NoTrayIcon
#Include %A_AppData%
#Include DotaScriptsBuilder.ahk

SetSettings()
config("Courier_is_My")

Hotkey, %var_key_start%, start, on
return

start:
IfWinNotActive, Dota 2
	return
loop
{
sleep 30
send(var_cour_use, "0")
if GetKeyState(var_cour_use)
	break
IfWinNotActive, Dota 2
	break
}
return