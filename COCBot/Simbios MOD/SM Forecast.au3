; #FUNCTION# ====================================================================================================================
; Name ..........: Forecast
; Description ...: This file Includes GUI Design
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: AwesomeGamer (2016), Moebius14 06/2016
; Modified ......: rulesss,kychera
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================
#include <IE.au3>

;~ -------------------------------------------------------------
; Forecast Tab
;~ -------------------------------------------------------------

Func chkForecastBoost()
	If GUICtrlRead($g_hChkForecastBoost) = $GUI_CHECKED Then
	    $g_bForecastBoost = True
		_GUICtrlEdit_SetReadOnly($g_hTxtForecastBoost, False)
		GUICtrlSetState($g_hTxtForecastBoost, $GUI_ENABLE)
		GUICtrlSetState($g_hTxtForecastBoost, $GUI_SHOW)
	Else
	    $g_bForecastBoost = False
		_GUICtrlEdit_SetReadOnly($g_iTxtForecastBoost, True)
		GUICtrlSetState($g_hTxtForecastBoost, $GUI_DISABLE)
		GUICtrlSetState($g_hTxtForecastBoost, $GUI_HIDE)
	EndIf
EndFunc

Func chkForecastPause()
	If GUICtrlRead($g_hChkForecastPause) = $GUI_CHECKED Then
	    $g_bForecastPause = True
		_GUICtrlEdit_SetReadOnly($g_hTxtForecastPause, False)
		GUICtrlSetState($g_hTxtForecastPause, $GUI_ENABLE)
		GUICtrlSetState($g_hTxtForecastPause, $GUI_SHOW)
	Else
	    $g_bForecastPause = False
		_GUICtrlEdit_SetReadOnly($g_hTxtForecastPause, True)
		GUICtrlSetState($g_hTxtForecastPause, $GUI_DISABLE)
		GUICtrlSetState($g_hTxtForecastPause, $GUI_HIDE)
	EndIf
EndFunc

Func chkForecastHopingSwitchMax()
	If GUICtrlRead($g_hChkForecastHopingSwitchMax) = $GUI_CHECKED Then
	    $g_bForecastHopingSwitchMax = True
		_GUICtrlEdit_SetReadOnly($g_hTxtForecastHopingSwitchMax, False)
		GUICtrlSetState($g_hTxtForecastHopingSwitchMax, $GUI_ENABLE)
		GUICtrlSetState($g_hCmbForecastHopingSwitchMax, $GUI_ENABLE)
	Else
	    $g_bForecastHopingSwitchMax = False
		_GUICtrlEdit_SetReadOnly($g_hTxtForecastHopingSwitchMax, True)
		GUICtrlSetState($g_hTxtForecastHopingSwitchMax, $GUI_DISABLE)
		GUICtrlSetState($g_hCmbForecastHopingSwitchMax, $GUI_DISABLE)
	EndIf
EndFunc

Func chkForecastHopingSwitchMin()
	If GUICtrlRead($g_hChkForecastHopingSwitchMin) = $GUI_CHECKED Then
	    $g_bForecastHopingSwitchMin = True
		_GUICtrlEdit_SetReadOnly($g_hTxtForecastHopingSwitchMin, False)
		GUICtrlSetState($g_hTxtForecastHopingSwitchMin, $GUI_ENABLE)
		GUICtrlSetState($g_hCmbForecastHopingSwitchMin, $GUI_ENABLE)
	Else
	    $g_bForecastHopingSwitchMin = False
		_GUICtrlEdit_SetReadOnly($g_hTxtForecastHopingSwitchMin, True)
		GUICtrlSetState($g_hTxtForecastHopingSwitchMin, $GUI_DISABLE)
		GUICtrlSetState($g_hCmbForecastHopingSwitchMin, $GUI_DISABLE)
	EndIf
EndFunc

;Added Multi Switch Language by rulesss and Kychera
Func cmbSwLang()
	Switch GUICtrlRead($g_hCmbSwLang)

		Case "EN"
			setForecast2()
		Case "RU"
			setForecast3()
		Case "FR"
			setForecast4()
		Case "DE"
			setForecast5()
		Case "ES"
			setForecast6()
		Case "FA"
			setForecast7()
		Case "PT"
			setForecast8()
		Case "IN"
			setForecast9()
	EndSwitch
EndFunc

Func setForecast()
	_IENavigate($oIE, "about:blank")
	_IEBodyWriteHTML($oIE, "<div style='width:440px;height:345px;padding:0;overflow:hidden;position: absolute;top:5x;left:-25px;z-index:0;'><center><img src='" & @ScriptDir & "\COCBot\Forecast\loading.gif'></center></div>")
EndFunc

Func setForecast2()
	RunWait("..\COCBot\Forecast\wkhtmltoimage.exe --width 3100 http://clashofclansforecaster.com/?lang=english  ..\COCBot\Forecast\forecast.jpg", "", @SW_HIDE)
	_IEBodyWriteHTML($oIE, "<img style='margin: -10px 0px -10px -100px;' src='" & @ScriptDir & "\COCBot\Forecast\forecast.jpg' width='1700'>")
EndFunc

Func setForecast3()
	RunWait("..\COCBot\Forecast\wkhtmltoimage.exe --width 3100 http://clashofclansforecaster.com/?lang=russian  ..\COCBot\Forecast\forecast.jpg", "", @SW_HIDE)
	_IEBodyWriteHTML($oIE, "<img style='margin: -10px 0px -10px -100px;' src='" & @ScriptDir & "\COCBot\Forecast\forecast.jpg' width='1700'>")
EndFunc

Func setForecast4()
	RunWait("..\COCBot\Forecast\wkhtmltoimage.exe --width 3100 http://clashofclansforecaster.com/?lang=french  ..\COCBot\Forecast\forecast.jpg", "", @SW_HIDE)
	_IEBodyWriteHTML($oIE, "<img style='margin: -10px 0px -10px -100px;' src='" & @ScriptDir & "\COCBot\Forecast\forecast.jpg' width='1700'>")
EndFunc

Func setForecast5()
	RunWait("..\COCBot\Forecast\wkhtmltoimage.exe --width 3100 http://clashofclansforecaster.com/?lang=german  ..\COCBot\Forecast\forecast.jpg", "", @SW_HIDE)
	_IEBodyWriteHTML($oIE, "<img style='margin: -10px 0px -10px -100px;' src='" & @ScriptDir & "\COCBot\Forecast\forecast.jpg' width='1700'>")
EndFunc

Func setForecast6()
	RunWait("..\COCBot\Forecast\wkhtmltoimage.exe --width 3100 http://clashofclansforecaster.com/?lang=spanish  ..\COCBot\Forecast\forecast.jpg", "", @SW_HIDE)
	_IEBodyWriteHTML($oIE, "<img style='margin: -10px 0px -10px -100px;' src='" & @ScriptDir & "\COCBot\Forecast\forecast.jpg' width='1700'>")
EndFunc

Func setForecast7()
	RunWait("..\COCBot\Forecast\wkhtmltoimage.exe --width 3100 http://clashofclansforecaster.com/?lang=persian  ..\COCBot\Forecast\forecast.jpg", "", @SW_HIDE)
	_IEBodyWriteHTML($oIE, "<img style='margin: -10px 0px -10px -100px;' src='" & @ScriptDir & "\COCBot\Forecast\forecast.jpg' width='1700'>")
EndFunc

Func setForecast8()
	RunWait("..\COCBot\Forecast\wkhtmltoimage.exe --width 3100 http://clashofclansforecaster.com/?lang=portuguese  ..\COCBot\Forecast\forecast.jpg", "", @SW_HIDE)
	_IEBodyWriteHTML($oIE, "<img style='margin: -10px 0px -10px -100px;' src='" & @ScriptDir & "\COCBot\Forecast\forecast.jpg' width='1700'>")
EndFunc

Func setForecast9()
	RunWait("..\COCBot\Forecast\wkhtmltoimage.exe --width 3100 http://clashofclansforecaster.com/?lang=indonesian ..\COCBot\Forecast\forecast.jpg", "", @SW_HIDE)
	_IEBodyWriteHTML($oIE, "<img style='margin: -10px 0px -10px -100px;' src='" & @ScriptDir & "\COCBot\Forecast\forecast.jpg' width='1700'>")
EndFunc

Func _RoundDown($nVar, $iCount)
    Return Round((Int($nVar * (10 ^ $iCount))) / (10 ^ $iCount), $iCount)
EndFunc

Func redrawForecast()
	If GUICtrlRead($g_hGUI_MOD_TAB, 1) = $g_hGUI_MOD_TAB_ITEM7 Then
		_IENavigate($oIE, "about:blank")
		_IEBodyWriteHTML($oIE, "<img style='margin: -10px 0px -10px -100px;' src='" & @ScriptDir & "\COCBot\Forecast\forecast.jpg' width='1700'>")
	EndIf
EndFunc

Func readCurrentForecast()
	Local $return = getCurrentForecast()
	If $return > 0 Then Return $return

	Local $line = ""
	Local $filename = @ScriptDir & "\COCBot\Forecast\forecast.mht"

	_INetGetMHT("http://clashofclansforecaster.com", $filename)

	Local $file = FileOpen($filename, 0)
	If $file = -1 Then
		SetLog("     Error reading forecast !", $COLOR_RED)
		Return False
	EndIf

	ReDim $dtStamps[0]
	ReDim $lootMinutes[0]
	While 1
		$line = FileReadLine($file)
		If @error <> 0 Then ExitLoop
		If StringCompare(StringLeft($line, StringLen("<script language=""javascript"">var militaryTime")), "<script language=""javascript"">var militaryTime") = 0 Then
			Local $pos1
			Local $pos2
			$pos1 = StringInStr($line, "minuteNow")
			If $pos1 > 0 Then
				$pos1 = StringInStr($line, ":", 0, 1, $pos1 + 1)
				If $pos1 > 0 Then
					$pos2 = StringInStr($line, ",", 9, 1, $pos1 + 1)
					Local $minuteNowString = StringMid($line, $pos1 + 1, $pos2 - $pos1 - 1)
					$timeOffset = Int($minuteNowString) - nowTicksUTC()
				EndIf
			EndIf

			$pos1 = StringInStr($line, "dtStamps")
			If $pos1 > 0 Then
				$pos1 = StringInStr($line, "[", 0, 1, $pos1 + 1)
				If $pos1 > 0 Then
					$pos2 = StringInStr($line, "]", 9, 1, $pos1 + 1)
					Local $dtStampsString = StringMid($line, $pos1 + 1, $pos2 - $pos1 - 1)
					$dtStamps = StringSplit($dtStampsString, ",", 2)
				EndIf
			EndIf

			$pos1 = StringInStr($line, "lootMinutes", 0, 1, $pos1 + 1)
			If $pos1 > 0 Then
				$pos1 = StringInStr($line, "[", 0, 1, $pos1 + 1)
				If $pos1 > 0 Then
					$pos2 = StringInStr($line, "]", 9, 1, $pos1 + 1)
					Local $minuteString = StringMid($line, $pos1 + 1, $pos2 - $pos1 - 1)
					$lootMinutes = StringSplit($minuteString, ",", 2)
				EndIf
			EndIf

			$pos1 = StringInStr($line, "lootIndexScaleMarkers", 0, 1, $pos1 + 1)
			If $pos1 > 0 Then
				$pos1 = StringInStr($line, "[", 0, 1, $pos1 + 1)
				If $pos1 > 0 Then
					$pos2 = StringInStr($line, "]", 9, 1, $pos1 + 1)
					Local $lootIndexScaleMarkersString = StringMid($line, $pos1 + 1, $pos2 - $pos1 - 1)
					$lootIndexScaleMarkers = StringSplit($lootIndexScaleMarkersString, ",", 2)
				EndIf
			EndIf
			ExitLoop
		EndIf
	WEnd
	FileClose($file)

	$return = getCurrentForecast()
	If $return = 0 Then
		SetLog("Error reading forecast.")
	EndIf
	Return $return
EndFunc

Func _INetGetMHT( $url, $file )
	Local $msg = ObjCreate("CDO.Message")
	If @error Then Return False
	Local $ado = ObjCreate("ADODB.Stream")
	If @error Then Return False
	Local $conf = ObjCreate("CDO.Configuration")
	If @error Then Return False

	With $ado
		.Type = 2
		.Charset = "US-ASCII"
		.Open
	EndWith

	Local $flds = $conf.Fields
	$flds.Item("http://schemas.microsoft.com/cdo/configuration/urlgetlatestversion") = True
	$flds.Update()
	$msg.Configuration = $conf
	$msg.CreateMHTMLBody($url, 31)
	$msg.DataSource.SaveToObject($ado, "_Stream")
	FileDelete($file)
	$ado.SaveToFile($file, 1)
	$msg = ""
	$ado = ""
	Return True
EndFunc

Func getCurrentForecast()
	Local $return = 0
	Local $nowTicks = nowTicksUTC() + $timeOffset
	If UBound($dtStamps) > 0 And UBound($lootMinutes) > 0 And UBound($dtStamps) = UBound($lootMinutes) Then
	If $nowTicks >= Int($dtStamps[0]) And $nowTicks <= Int($dtStamps[UBound($dtStamps) - 1]) Then
			Local $i
			For $i = 0 To UBound($dtStamps) - 1
				If $nowTicks >= Int($dtStamps[$i]) Then
					$return = Int($lootMinutes[$i])
				Else
					ExitLoop
				EndIf
			Next
		Else
			Return 0
		EndIf
	Else
		Return 0
	EndIf

	Return CalculateIndex($return)
EndFunc

Func CalculateIndex($minutes)
	Local $index = 0
	Local $iRound1 = 0
	Local $index25 = 2.5
	Local $index4 = 4
	Local $index6 = 6
	Local $index8 = 8

	If $minutes < $lootIndexScaleMarkers[0] Then
		$index = $minutes / $lootIndexScaleMarkers[0]
	ElseIf $minutes < $lootIndexScaleMarkers[1] Then
		$index = (($minutes - $lootIndexScaleMarkers[0]) / ($lootIndexScaleMarkers[1] - $lootIndexScaleMarkers[0])) + 1
	ElseIf $minutes < $lootIndexScaleMarkers[2] Then
		$index = (($minutes - $lootIndexScaleMarkers[1]) / ($lootIndexScaleMarkers[2] - $lootIndexScaleMarkers[1])) + 2
	ElseIf $minutes < $lootIndexScaleMarkers[3] Then
		$index = (($minutes - $lootIndexScaleMarkers[2]) / ($lootIndexScaleMarkers[3] - $lootIndexScaleMarkers[2])) + 3
	ElseIf $minutes < $lootIndexScaleMarkers[4] Then
		$index = (($minutes - $lootIndexScaleMarkers[3]) / ($lootIndexScaleMarkers[4] - $lootIndexScaleMarkers[3])) + 4
	ElseIf $minutes < $lootIndexScaleMarkers[5] Then
		$index = (($minutes - $lootIndexScaleMarkers[4]) / ($lootIndexScaleMarkers[5] - $lootIndexScaleMarkers[4])) + 5
	ElseIf $minutes < $lootIndexScaleMarkers[6] Then
		$index = (($minutes - $lootIndexScaleMarkers[5]) / ($lootIndexScaleMarkers[6] - $lootIndexScaleMarkers[5])) + 6
	ElseIf $minutes < $lootIndexScaleMarkers[7] Then
		$index = (($minutes - $lootIndexScaleMarkers[6]) / ($lootIndexScaleMarkers[7] - $lootIndexScaleMarkers[6])) + 7
	ElseIf $minutes < $lootIndexScaleMarkers[8] Then
		$index = (($minutes - $lootIndexScaleMarkers[7]) / ($lootIndexScaleMarkers[8] - $lootIndexScaleMarkers[7])) + 8
	ElseIf $minutes < $lootIndexScaleMarkers[9] Then
		$index = (($minutes - $lootIndexScaleMarkers[8]) / ($lootIndexScaleMarkers[9] - $lootIndexScaleMarkers[8])) + 9
	Else
		$index = (($minutes - $lootIndexScaleMarkers[9]) / (44739594 - $lootIndexScaleMarkers[9])) + 10
	EndIf

    $iRound1 = Round($index, 1)

	SetLog("Viewing weather information ...", $COLOR_PURPLE)
	If $iRound1 <= $index25 Then
	SetLog("Index of Loot : " & $iRound1 & " ---> Awful!", $COLOR_RED)
	Elseif $iRound1 > $index25 And $iRound1 <= $index4 Then
	SetLog("Index of Loot : " & $iRound1 & " ---> Bad", $COLOR_DEEPPINK)
	Elseif $iRound1 > $index4 And $iRound1 <= $index6 Then
	SetLog("Index of Loot  : " & $iRound1 & " ---> Fine", $COLOR_ORANGE)
	ElseIf $iRound1 > $index6 And $iRound1 <= $index8 Then
	SetLog("Index of Loot : " & $iRound1 & " ---> Good!", $COLOR_GREEN)
	ElseIf $iRound1 > $index8 Then
	SetLog("Index of Loot  : " & $iRound1 & " ---> Perfect !!", $COLOR_DARKGREEN)
	Endif
	Return _RoundDown($index, 1)
EndFunc


Func nowTicksUTC()
	Local $now = _Date_Time_GetSystemTime()
	Local $nowUTC = _Date_Time_SystemTimeToDateTimeStr($now)

	$nowUTC = StringMid($nowUTC, 7, 4) & "/" & StringMid($nowUTC, 1, 2) & "/" & StringMid($nowUTC, 4, 2) & StringMid($nowUTC, 11)
	Return _DateDiff('s', "1970/01/01 00:00:00", $nowUTC)
EndFunc


Func checkForecastPause($forecast)
	Local $return = False
	If $g_bForecastPause = True Then
		If $g_iCurrentForecast <= Number($g_iTxtForecastPause, 3) Then
			SetLog("Halting attacks: forecast:" & StringFormat("%.1f", $forecast) & " <= setting:" & $g_iTxtForecastPause, $COLOR_RED)
			$return = True
		Else
			SetLog("Not Halting attacks: forecast:" & StringFormat("%.1f", $forecast) & " > setting:" & $g_iTxtForecastPause, $COLOR_BLUE)
		EndIf
	EndIf
	Return $return
EndFunc

Func ForecastSwitch()
If $g_bForecastHopingSwitchMax	= True Or $g_bForecastHopingSwitchMin = True And $g_bRunState Then
	$g_iCurrentForecast = readCurrentForecast()
	Local $SwitchtoProfile = ""
	Local $aArray = _FileListToArray($g_sProfilePath, "*", $FLTA_FOLDERS)
	_ArrayDelete($aArray,0)
	While True
		If $g_bForecastHopingSwitchMax = True Then
		If $g_iCurrentForecast < Number($g_iTxtForecastHopingSwitchMax, 3) And $g_sProfileCurrentName <> $g_iCmbForecastHopingSwitchMax Then
		$SwitchtoProfile = $g_iCmbForecastHopingSwitchMax
		Local $aNewProfile = $aArray[Number($g_iCmbForecastHopingSwitchMax)]
			SetLog("Weather index < " & $g_iTxtForecastHopingSwitchMax & " !!", $COLOR_ORANGE)
			SetLog("Switching profile to : " & $aNewProfile, $COLOR_BLUE)
		ExitLoop
		EndIf
		EndIf
		If $g_bForecastHopingSwitchMin = True Then
		If $g_iCurrentForecast > Number($g_iTxtForecastHopingSwitchMin, 3) And $g_sProfileCurrentName <> $g_iCmbForecastHopingSwitchMin Then
		$SwitchtoProfile = $g_iCmbForecastHopingSwitchMin
		Local $aNewProfile = $aArray[Number($g_iCmbForecastHopingSwitchMin)]
			SetLog("Weather index > " & $g_iTxtForecastHopingSwitchMin & " !!", $COLOR_ORANGE)
			SetLog("Switching profile to : " & $aNewProfile, $COLOR_BLUE)
		ExitLoop
		EndIf
		EndIf
	ExitLoop
	WEnd
	If $SwitchtoProfile <> "" Then
		If $g_sProfileCurrentName <> $SwitchtoProfile Then
		_GUICtrlComboBox_SetCurSel($g_hCmbProfile, $SwitchtoProfile)
		cmbProfile()
		EndIf
	EndIf
EndIf
EndFunc