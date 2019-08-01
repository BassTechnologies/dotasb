;##############
; Do not remove these lines.
; Не удаляйте пожалуйста эти строки
;##############

; ###   Dota Scripts Builder ( Dota SB )   ###

;##############
; Written by Bass_Devware
; https://github.com/MirchikAhtung
;##############
; This library is presented only on the BlastHack and GitHub
; If you want to give a link - let's link to the original github
; This is done so that users do not use outdated versions.

; Данная библиотека представлена лишь на портале BlastHack и на GitHub.
; Если вы хотите дать ссылку на библиотеку - отправляйте ссылку на оригинальный GitHub, чтобы пользователи не использовали старые версии.
;##############

;##############
; Modified 31.07.2019
; Changelog:
; config(scriptname) added.
;##############

; Pid of application dota 2
global dota_id

; Coords of slots
global cx1slot := []
global cy1slot := []
global cx2slot := []
global cy2slot := []

global sx1slot := []
global sy1slot := []
global sx2slot := []
global sy2slot := []

global bx1slot := []
global by1slot := []
global bx2slot := []
global by2slot := []

; Keys inventory and skills
global InventoryKeys := []
global SkillKeys := []

; ----------------------------------------------------------------------------------------------------------------
; #
; Вторичные функции / Secondary Functions
; #
; ----------------------------------------------------------------------------------------------------------------
;	- ExitProcess()				- Закрытие окна доты 2 (если функция SetSettings() не используется - определяем dota_pid самостоятельно)
;	- SetSettings()				- Настройки для корректной работы функций библиотеки.
; 											# CoordMode's
; 											# Создание директивы для файлов скрипта / %A_MyDocuments%\DotaScriptsBuilder
; 											# Определение PID'a процесса доты 2.
;	- config(scriptname)	- Чтение конфига
;											# scriptname - имя папки скрипта
; ----------------------------------------------------------------------------------------------------------------
; #
; Функции для взаимодействия с экраном / Function to interact with the screen
; #
; ----------------------------------------------------------------------------------------------------------------
; #
;	- PixelTrigger(savecrds, slotnumb, R, R2) 		- Триггер на меняющиеся пиксели.
;																				# SaveCrds - режим "1" - сохранить координаты, "0" - определять сохранённые координаты
;																				# SlotNumb - порядковый номер слота в инвентаре. "5" - 5-й слот.
;																						# Номер слота определяется следующим образом. 1 ряд = 1, 2, 3 слот. 2 ряд = 4, 5, 6 слот.
;																				# R и R2 - Отхождение от заданной первоночально координатой. "5" - 5 пикселей.
; #
;	- itemsearch(slot, image)									- Поиск предмета по картинке в указанных координатах слота инвентаря.
;																				# slot - номер слота. "4" - поиск в координатах 4-го слота.
;																				# image - изображение. Указывать можно как полный путь, так и  название изображение. При условии, что это изображение лежит в директиве для файлов скрипта.
; ----------------------------------------------------------------------------------------------------------------
; #
; Отправка нажатий в окно доты 2 / Sending keystrokes to the window of dota 2
; #
; ----------------------------------------------------------------------------------------------------------------
; #
;	- vksend(key, status)										- Отправка нажатия клавиши по vk коду
;																				# key - номер клавиши
;																				# status - при необходимости "d" - зажать клавишу, "u" - отпустить.
; #
;	- scsend(key, status)
;																				# key - номер клавиши
;																				# status - при необходимости "d" - зажать клавишу, "u" - отпустить.
; #
;	- send(key, status)
;																				# key - название клавиши
;																				# status - при необходимости "d" - зажать клавишу, "u" - отпустить.
; #
;	- modsend(key, modkey)
;																				# key - название клавиши
;																				# modkey - название модификатора, через который будет нажата клавиша. (Alt Down - W - Alt Up)
; ----------------------------------------------------------------------------------------------------------------
; #
; Функции для работы с координатами слотов / Functions for working with slot coordinates
; #
; ----------------------------------------------------------------------------------------------------------------
; #
;	- bhsetslotcoords(letter, numeral, slot, coordinate, type)											- Сохранение указанных координат на место предыдущих.
;																																		# letter - буква меняемой координаты. "x" или "y"
;																																		# numeral - номер меняемой координаты. (x1 координата или x2 например) "1" или "2"
;																																		# slot - номер слота
;																																		# coordinate - сама координата
;																																		# type - тип меняемого элемента. Инвентарь(inventory), скиллы(skill) или рюкзак(backpack)
; #
;	- byhandsetslotcoords(x11, x21, y11, y21, x12, x22, y12, y22, x13, x23, y13, y23, x14, x24, y14, y24, x15, x25, y15, y25, x16, x26, y16, y26, type)
;																																	- Изменение координат ВСЕХ слотов указанного типа.
;																																		# x11, x21, y11, y21 - 1, 2 координата "x", 1,2 координата "y".
;																																			# x - меняемая координата 1 - номер меняемой координаты, 1 - номер слота меняемой координаты.
;																																		# type - тип меняемого элемента. Инвентарь(inventory), скиллы(skill) или рюкзак(backpack)
; #
;	- setslotcoords(Q1, Q2, Q3, Q4, Q5, Q6, type)																- Изменение координат слотов указанного типа. Разчитано для использования непосредственно пользователем.
;																																		- Удобство заключается в озвучивании изменяемого слота - это даёт понять пользователю, какой слот в данный момент изменяет свои координаты.
;																																			# Q1, Q2, Q3 ... - номера слотов, координаты которых скрипт будет устанавливать. "1" - установка, "0" - пропуск.
;																																			# type - тип меняемого элемента. Инвентарь(inventory), скиллы(skill) или рюкзак(backpack)
; ----------------------------------------------------------------------------------------------------------------
; #
; Функция, отображающая содержание переменных с координатами и хоткеями, у элемента указанного типа.
; #
; ----------------------------------------------------------------------------------------------------------------
;	- eventlist(type)
;								# type - имеет следующее написание:
;									Элемент . Тип . Номер слота . Номер координаты . Координата
;									либо
;									Элемент . Тип . Число/all
;
;									Для определения клавиш мы НЕ пишем последние 2 условия.
;										# inventory . coords . 5 . 1 . x			; Получаем x1 у 5-го слота
;										# inventory . coords . all					; Получаем ВСЕ координаты нашего инвентаря.
;										# skill . keys . 1									; Получаем клавишу 1-го скилла.
;										# skill . keys . all								; Получаем ВСЕ указанные клавиши наших умений
;										# backpack . coords . 4 . 1 . y			; Получаем y1 у 4-го слота
;										# backpack . coords . all					; Получаем ВСЕ координаты нашего рюкзака.
; ----------------------------------------------------------------------------------------------------------------


SetSettings()
{
	CoordMode, Pixel, Screen
	CoordMode, Mouse, Screen
	IfNotExist, %A_MyDocuments%\DotaScriptsBuilder
		FileCreateDir, %A_MyDocuments%\DotaScriptsBuilder
	SetWorkingDir, %A_MyDocuments%\DotaScriptsBuilder
	WinGet, dota_id, PID, Dota 2
}

config(scriptname)
	{
		IfExist, %a_mydocuments%\DotaSL\%scriptname%\options.txt
			Loop, read, %a_mydocuments%\DotaSL\%scriptname%\options.txt
		if regexmatch(A_LoopReadLine, "(.*) := (.*)", ea)
		{
			IfInString, A_LoopReadLine, var_loadconfig := 0
				return
			e := "ea2"
			%ea1% := ea2
		}
	}

PixelTrigger(savecrds, slotnumb, R, R2)
{
	static firstcoords1
	static firstcoords2
	if savecrds ; Сохраняем координаты. ( 1 )
		loop, 2
		PixelGetColor, firstcoords%A_Index%, cx1slot[slotnumb]+R, cy1slot[slotnumb]+R
	if !savecrds ; Проверяем координаты. ( 0 )
	{
		loop, 2
			PixelGetColor, Secondcoords%a_index%, cx1slot[slotnumb]+R2, cy1slot[slotnumb]+R2
		if (firstcoords1 != Secondcoords1 or firstcoords2 != Secondcoords2)
			return, true
		else
			return, false
	}
	return, "2"
}

bhsetslotcoords(letter, numeral, slot, coordinate, type)
{
	if type = inventory
		c%letter%%numeral%slot[slot] := coordinate
	else if type = skill
		s%letter%%numeral%slot[slot] := coordinate
	else if type = backpack
		b%letter%%numeral%slot[slot] := coordinate
	else
		MsgBox, 48, bhsetslotcoords(), Unknow type
}

byhandsetslotcoords(x11, x21, y11, y21, x12, x22, y12, y22, x13, x23, y13, y23, x14, x24, y14, y24, x15, x25, y15, y25, x16, x26, y16, y26, type)
{
	if type = inventory
	{
		loop, 6
			cx1slot[A_Index] := x1%A_Index%
		loop, 6
			cx2slot[A_Index] := x2%A_Index%
		loop, 6
			cy1slot[A_Index] := y1%A_Index%
		loop, 6
			cy2slot[A_Index] := y2%A_Index%
	}
	else if type = skill
	{
		loop, 6
			sx1slot[A_Index] := x1%A_Index%
		loop, 6
			sx2slot[A_Index] := x2%A_Index%
		loop, 6
			sy1slot[A_Index] := y1%A_Index%
		loop, 6
			sy2slot[A_Index] := y2%A_Index%
	}
	else if type = backpack
	{
		loop, 6
			bx1slot[A_Index] := x1%A_Index%
		loop, 6
			bx2slot[A_Index] := x2%A_Index%
		loop, 6
			by1slot[A_Index] := y1%A_Index%
		loop, 6
			by2slot[A_Index] := y2%A_Index%
	}
	else
		MsgBox, 48, byhandsetslotcoords(), Unknow type
}

setslotcoords(Q1, Q2, Q3, Q4, Q5, Q6, type)
{
	if type = inventory
		loop, 6
	{
		if !Q%a_index%
			continue
		loop, %a_index%
			SoundBeep, 200, 350 ; Кол-во звуков - номер слота.
		
		; Первые координаты.
		KeyWait, Enter, D
		MouseGetPos, x, y
		cx1slot[A_Index] := x
		cy1slot[A_Index] := y
		KeyWait, Enter
		
		SoundBeep, 1000, 250 ; Вторые координаты.
		
		KeyWait, Enter, D
		MouseGetPos, x, y
		cx2slot[A_Index] := x
		cy2slot[A_Index] := y
		KeyWait, Enter
		
		SoundBeep, 1000, 250
		
	} ; Loop
	else if type = skill
		loop, 6
	{
		if !Q%a_index%
			continue
		loop, %a_index%
			SoundBeep, 400, 350
		
		KeyWait, Enter, D
		MouseGetPos, x, y
		sx1slot[A_Index] := x
		sy1slot[A_Index] := y
		KeyWait, Enter
		
		SoundBeep, 1500, 250
		
		KeyWait, Enter, D
		MouseGetPos, x, y
		sx2slot[A_Index] := x
		sy2slot[A_Index] := y
		KeyWait, Enter
		
		SoundBeep, 1500, 250
		
	} ; Loop
	else if type = backpack
		loop, 6
	{
		if !Q%a_index%
			continue
		loop, %a_index%
			SoundBeep, 400, 350
		
		KeyWait, Enter, D
		MouseGetPos, x, y
		bx1slot[A_Index] := x
		by1slot[A_Index] := y
		KeyWait, Enter
		
		SoundBeep, 1200, 250
		
		KeyWait, Enter, D
		MouseGetPos, x, y
		bx2slot[A_Index] := x
		by2slot[A_Index] := y
		KeyWait, Enter
		
		SoundBeep, 1200, 250
	}
	else
		MsgBox, 48, setslotcoords(x`, x`, x`, x`, x`, x`, type), Unknow type
}

vksend(key, status)
{
	if !status
		ControlSend, ,{vk%key%}, ahk_pid %dota_id% ;
	else if status = d
		ControlSend, ,{vk%key% down}, ahk_pid %dota_id% ;
	else if status = u
		ControlSend, ,{vk%key% up}, ahk_pid %dota_id% ;
	return, errorlevel
}

scsend(key, status)
{
	if !status
		ControlSend, ,{sc%key%}, ahk_pid %dota_id% ;
	else if status = d
		ControlSend, ,{sc%key% down}, ahk_pid %dota_id% ;
	else if status = u
		ControlSend, ,{sc%key% up}, ahk_pid %dota_id% ;
	return, errorlevel
}

modsend(key, modkey)
{
	ControlSend, ,{%modkey% down}%key%{%modkey% up}, ahk_pid %dota_id% ;
	return, errorlevel
}

send(key, status)
{
	if !status
		ControlSend, ,{%key%}, ahk_pid %dota_id% ;
	else if status = d
		ControlSend, ,{%key% down}, ahk_pid %dota_id% ;
	else if status = u
		ControlSend, ,{%key% up}, ahk_pid %dota_id% ;
	return, errorlevel
}

itemsearch(slot, image)
{
	IfNotExist, %image%
		return, "NONE IMAGE"
	if slot != all
		ImageSearch, Image1, Image2, cx1slot[slot], cy1slot[slot], cx2slot[slot], cy2slot[slot], %image%
	else
		ImageSearch, Image1, Image2, cx1slot.1, cy1slot.1, cx2slot.6, cy2slot.6, %image% ; Find in all slot's
	return, errorlevel
}

eventlist(type) ; Можно делать выгрузку в файл-конфиг.
{
	; ////////////////////////////////////////////////////////////////////////////////////////////////////////////
	; Координата слота. Номер слота . Номер координаты . Координата ( 1/6 . 1/2 . x/y = 1 slot, x1 coord e.t.c.)
	; Написание выглядит след.образом: inventory.coords.2(НОМЕРСЛОТА).1(НОМЕРКООРДИНАТЫ).x(КООРДИНАТА) = Координаты x1 2-го слота.
	if RegExMatch(type, "inventory.coords\.(\d)\.(\d)\.(.)", ic), var := "c" . ic3 . ic2 . "slot"
		return, %var%[ic1]
	; All coords with format: {Slot} [x1]n [y2]n [x2]n [y2]n
	else if RegExMatch(type, "inventory.coords\.all\.?(\d)?\.?(.)?")
		return, "{1}" . " [x1] " . cx1slot[1] . " [x2] " . cx2slot[1] . " [y1] " . cy1slot[1] . " [y2] " . cy2slot[1] . "`n" . "{2}" . " [x1] " . cx1slot[2] . " [x2] " . cx2slot[2] . " [y1] " . cy1slot[2] . " [y2] " . cy2slot[2] . "`n" .  "{3}" . " [x1] " . cx1slot[3] . " [x2] " . cx2slot[3] . " [y1] " . cy1slot[3] . " [y2] " . cy2slot[3] . "`n" .  "{4}" . " [x1] " . cx1slot[4] . " [x2] " . cx2slot[4] . " [y1] " . cy1slot[4] . " [y2] " . cy2slot[4] . "`n" .  "{5}" . " [x1] " . cx1slot[5] . " [x2] " . cx2slot[5] . " [y1] " . cy1slot[5] . " [y2] " . cy2slot[5] . "`n" .  "{6}" . " [x1] " . cx1slot[6] . " [x2] " . cx2slot[6] . " [y1] " . cy1slot[6] . " [y2] " . cy2slot[6]
	; Return key by slot numb
	else if RegExMatch(type, "inventory.key\.(\d)", ik)
		return, InventoryKeys[ik1]
	; Return all keys
	else if RegExMatch(type, "inventory.key\.all")
		return, "{1}" . InventoryKeys[1] . "`n" . "{2}" . InventoryKeys[2] . "`n" . "{3}" . InventoryKeys[3] . "`n" . "{4}" . InventoryKeys[4] . "`n" . "{5}" . InventoryKeys[5] . "`n" . "{6}" . InventoryKeys[6]
	; ////////////////////////////////////////////////////////////////////////////////////////////////////////////
	else if RegExMatch(type, "skill.coords\.(\d)\.(\d)\.(.)", sc), var := "s" . sc3 . sc2 . "slot"
		return, %var%[sc1]
	; /
	else if RegExMatch(type, "skill.coords\.all\.?(\d)?\.?(.)?")
		return, "{1}" . " [x1] " . sx1slot[1] . " [y1] " . sx2slot[1] . " [x2] " . sy1slot[1] . " [y2] " . sy2slot[1] . "`n" . "{2}" . " [x1] " . sx1slot[2] . " [y1] " . sx2slot[2] . " [x2] " . sy1slot[2] . " [y2] " . sy2slot[2] . "`n" .  "{3}" . " [x1] " . sx1slot[3] . " [y1] " . sx2slot[3] . " [x2] " . sy1slot[3] . " [y2] " . sy2slot[3] . "`n" .  "{4}" . " [x1] " . sx1slot[4] . " [y1] " . sx2slot[4] . " [x2] " . sy1slot[4] . " [y2] " . sy2slot[4] . "`n" .  "{5}" . " [x1] " . sx1slot[5] . " [y1] " . sx2slot[5] . " [y1] " . sy1slot[5] . " [y2] " . sy2slot[5] . "`n" .  "{6}" . " [x1] " . sx1slot[6] . " [y1] " . sx2slot[6] . " [x2] " . sy1slot[6] . " [y2] " . sy2slot[6]
	; /
	else if RegExMatch(type, "skill.key\.(\d)", sk)
		return, SkillKeys[sk1]
	; /
	else if RegExMatch(type, "skill.key\.all")
		return, "{1}" . SkillKeys[1] . "`n" . "{2}" . SkillKeys[2] . "`n" . "{3}" . SkillKeys[3] . "`n" . "{4}" . SkillKeys[4] . "`n" . "{5}" . SkillKeys[5] . "`n" . "{6}" . SkillKeys[6]
	; ////////////////////////////////////////////////////////////////////////////////////////////////////////////
	else if RegExMatch(type, "backpack.coords\.(\d)\.(\d)\.(.)", bc), var := "b" . bc3 . bc2 . "slot"
		return, %var%[bc1]
	; /
	else if RegExMatch(type, "backpack.coords\.all\.?(\d)?\.?(.)?")
		return, "{1}" . " [x1] " . bx1slot[1] . " [y1] " . bx2slot[1] . " [x2] " . by1slot[1] . " [y2] " . by2slot[1] . "`n" . "{2}" . " [x1] " . bx1slot[2] . " [y1] " . bx2slot[2] . " [x2] " . by1slot[2] . " [y2] " . by2slot[2] . "`n" .  "{3}" . " [x1] " . bx1slot[3] . " [y1] " . bx2slot[3] . " [x2] " . by1slot[3] . " [y2] " . by2slot[3]
	; /
	else
		return, "Unknow type"
	; ////////////////////////////////////////////////////////////////////////////////////////////////////////////
}

abuseitems(side, speed, itemslot, backslot, R, R2)
{
	if side
		MouseClickDrag, left, cx1slot[itemslot]+R, cy1slot[itemslot]+R, bx1slot[backslot]+R2, by1slot[backslot]+R2, %speed%
	else
		MouseClickDrag, left, bx1slot[backslot]+R2, by1slot[backslot]+R2, cx1slot[itemslot]+R, cy1slot[itemslot]+R, %speed%
}

ExitProcess()
{
	if dota_id != 0
		Process, Close, %dota_id%
	Process, Exist, %dota_id%
	return, errorlevel
}
