; #FUNCTION# ====================================================================================================================
; Name ..........: BoostBarracks.au3
; Description ...:
; Syntax ........: BoostBarracks(), BoostSpellFactory(), BoostWorkShop()
; Parameters ....:
; Return values .: None
; Author ........: MR.ViPER (9/9/2016)
; Modified ......: MR.ViPER (17/10/2016), Fliegerfaust (21/12/2017)
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2018
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================
Func BoostBarracks()
	$g_iCmbBoostBarracks = _GUICtrlComboBox_GetCurSel($g_hCmbBoostBarracks) ; OFFICIAL BUG FIX ADDED BY SM MOD
	Return BoostTrainBuilding("Barracks", $g_iCmbBoostBarracks, $g_hCmbBoostBarracks)
EndFunc   ;==>BoostBarracks

;------------------ADDED By SM MOD - START------------------
Func BoostWorkshop()
	$g_iCmbBoostWorkshop = _GUICtrlComboBox_GetCurSel($g_hCmbBoostWorkshop) ; ADDED BY SM MOD
	Return BoostTrainBuilding("Workshop", $g_iCmbBoostWorkshop, $g_hCmbBoostWorkshop)
EndFunc   ;==>BoostWorkshop
;------------------ADDED By SM MOD - END------------------

Func BoostSpellFactory()
	$g_iCmbBoostSpellFactory = _GUICtrlComboBox_GetCurSel($g_hCmbBoostSpellFactory) ; OFFICIAL BUG FIX ADDED BY SM MOD
	Return BoostTrainBuilding("Spell Factory", $g_iCmbBoostSpellFactory, $g_hCmbBoostSpellFactory)
EndFunc   ;==>BoostSpellFactory

Func BoostTrainBuilding($sName, $iCmbBoost, $iCmbBoostCtrl)
	Local $boosted = False

	If Not $g_bTrainEnabled Or $iCmbBoost <= 0 Then Return $boosted

	Local $aHours = StringSplit(_NowTime(4), ":", $STR_NOCOUNT)
	If Not $g_abBoostBarracksHours[$aHours[0]] Then
		SetLog("Boosting " & $sName & " isn't planned, skipping", $COLOR_INFO)
		Return $boosted
	EndIf

	If GUICtrlRead($g_hChkForecastBoost) = $GUI_CHECKED Then
		If $g_iCurrentForecast > Number($g_iTxtForecastBoost, 3) Then
			Local $hour = StringSplit(_NowTime(4), ":", $STR_NOCOUNT)
			If $g_abBoostBarracksHours[$hour[0]] = False Then
				SetLog("No planned boosting for this hour.", $COLOR_RED)
				Return ; exit func if no planned Boost Barracks checkmarks
			EndIf
		Else
			Return
		EndIf
	EndIf
	Local $sIsAre = "are"
	SetLog("Boosting " & $sName, $COLOR_INFO)

	If OpenArmyOverview(True, "BoostTrainBuilding()") Then
		If $sName = "Barracks" Then
			OpenTroopsTab(False, "BoostTrainBuilding()")
		ElseIf $sName = "Spell Factory" Then
			OpenSpellsTab(False, "BoostTrainBuilding()")
			$sIsAre = "is"
		ElseIf $sName = "Workshop" Then ; ADDED By SM MOD
			OpenSiegeMachinesTab(False, "BoostTrainBuilding()") ; ADDED By SM MOD
			$sIsAre = "is" ; ADDED By SM MOD
		Else
			SetDebugLog("BoostTrainBuilding(): $sName called with a wrong Value.", $COLOR_ERROR)
			ClickP($aAway, 1, 0, "#0161")
			_Sleep($DELAYBOOSTBARRACKS2)
			Return $boosted
		EndIf
		Local $aBoostBtn = findButton("BoostBarrack")
		If IsArray($aBoostBtn) Then
			ClickP($aBoostBtn)
			_Sleep($DELAYBOOSTBARRACKS1)
			Local $aGemWindowBtn = findButton("GEM")
			If IsArray($aGemWindowBtn) Then
				ClickP($aGemWindowBtn)
				_Sleep($DELAYBOOSTBARRACKS2)
				If IsArray(findButton("EnterShop")) Then
					SetLog("Not enough gems to boost " & $sName, $COLOR_ERROR)
				Else
					If $iCmbBoost >= 1 And $iCmbBoost <= 24 Then
						$iCmbBoost -= 1
						_GUICtrlComboBox_SetCurSel($iCmbBoostCtrl, $iCmbBoost)
						SetLog("Remaining " & $sName & " Boosts: " & $iCmbBoost, $COLOR_SUCCESS)
					ElseIf $iCmbBoost = 25 Then
						SetLog("Remain " & $sName & " Boosts: Unlimited", $COLOR_SUCCESS)
					EndIf
					$boosted = True
					; Force to get the Remain Time
					If $sName = "Barracks" Then
						$g_aiTimeTrain[0] = 0 ; reset Troop remaining time
					Else
						$g_aiTimeTrain[1] = 0 ; reset Spells remaining time
					EndIf
				EndIf
			EndIf
		Else
			If IsArray(findButton("BarrackBoosted")) Then
				SetLog($sName & " " & $sIsAre & " already boosted", $COLOR_SUCCESS)
			Else
				SetLog($sName & "boost button not found", $COLOR_ERROR)
			EndIf
		EndIf
	EndIf

	ClickP($aAway, 1, 0, "#0161")
	_Sleep($DELAYBOOSTBARRACKS2)
	Return $boosted
EndFunc   ;==>BoostTrainBuilding
