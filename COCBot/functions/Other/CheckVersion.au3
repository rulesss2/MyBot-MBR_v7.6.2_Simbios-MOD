; #FUNCTION# ====================================================================================================================
; Name ..........: CheckVersion
; Description ...: Check if we have last version of program
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: Sardo (2015-06)
; Modified ......: CodeSlinger69 (2017)
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2018
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================
#include-once
; SM MOD TODO NEED TO MARGE THIS FILE CAREFULLY
Global $g_sLastModversion = "" ;latest version from GIT
Global $g_sLastModmessage = "" ;message for last version
Global $g_sOldModversmessage = "" ;warning message for old bot

Func CheckVersion()
	If $g_bCheckVersion Then
		CheckVersionHTML()
		If $g_sLastModversion = "" Then
			SetLog("WE CANNOT OBTAIN SM MOD VERSION AT THIS TIME", $COLOR_ACTION)
			CheckModVersion()
		ElseIf VersionNumFromVersionTXT($g_sModversion) < VersionNumFromVersionTXT($g_sLastModversion) Then
			SetLog("WARNING, YOUR Simbios MOD VERSION (" & $g_sModversion & ") IS OUT OF DATE.", $COLOR_ERROR)
			SetLog("CHIEF, PLEASE DOWNLOAD THE LATEST (" & $g_sLastModversion & ")", $COLOR_ERROR)
			SetLog("FROM https://MyBot.run               ", $COLOR_ERROR)
			SetLog(" ")
			_PrintLogVersion($g_sOldModversmessage)
			CheckModVersion()
		ElseIf VersionNumFromVersionTXT($g_sModversion) > VersionNumFromVersionTXT($g_sLastModversion) Then
			SetLog("YOU ARE USING A FUTURE VERSION OF Simbios MOD CHIEF!", $COLOR_SUCCESS)
			SetLog("YOUR Simbios MOD VERSION: " & $g_sModversion, $COLOR_SUCCESS)
			SetLog("OFFICIAL Simbios MOD VERSION: " & $g_sLastModversion, $COLOR_SUCCESS)
			SetLog(" ")
		Else
			SetLog("WELCOME CHIEF, YOU HAVE THE LATEST MOD VERSION", $COLOR_SUCCESS)
			SetLog(" ")
			_PrintLogVersion($g_sLastModmessage)
		EndIf
	EndIf
EndFunc   ;==>CheckVersion

;~ Func CheckVersionTXT()
;~ 	;download page from site contains last bot version
;~ 	$hLastVersion = InetGet("https://mybot.run/lastversion.txt", @ScriptDir & "\LastVersion.txt")
;~ 	InetClose($hLastVersion)

;~ 	;search version into downloaded page
;~ 	Local $f, $line, $Casesense = 0
;~ 	$g_sLastVersion = ""
;~ 	If FileExists(@ScriptDir & "\LastVersion.txt") Then
;~ 		$f = FileOpen(@ScriptDir & "\LastVersion.txt", 0)
;~ 		; Read in lines of text until the EOF is reached
;~ 		While 1
;~ 			$line = FileReadLine($f)
;~ 			If @error = -1 Then ExitLoop
;~ 			If StringInStr($line, "version=", $Casesense) Then
;~ 				$g_sLastVersion = StringMid($line, 9, -1)
;~ 			EndIf
;~ 			If StringInStr($line, "message=", $Casesense) Then
;~ 				$g_sLastMessage = StringMid($line, 9, -1)
;~ 			EndIf
;~ 		WEnd
;~ 		FileClose($f)
;~ 		FileDelete(@ScriptDir & "\LastVersion.txt")
;~ 	EndIf
;~ EndFunc   ;==>CheckVersionTXT


Func CheckVersionHTML()
	Local $versionfile = @ScriptDir & "\LastVersion.txt"
	If FileExists(@ScriptDir & "\TestVersion.txt") Then
		FileCopy(@ScriptDir & "\TestVersion.txt", $versionfile, 1)
	Else
		;download page from site contains last bot version
        Local $hDownload = InetGet("https://raw.githubusercontent.com/rulesss2/MyBot-MBR_v7.6.3_Simbios-MOD/master/LastVersion.txt", $versionfile, 0, 1)
		; Wait for the download to complete by monitoring when the 2nd index value of InetGetInfo returns True.
		Local $i = 0
		Do
			Sleep($DELAYCHECKVERSIONHTML1)
			$i += 1
		Until InetGetInfo($hDownload, $INET_DOWNLOADCOMPLETE) Or $i > 25

		InetClose($hDownload)
	EndIf

	;search version into downloaded page
	Local $line, $line2, $Casesense = 0, $chkvers = False, $chkmsg = False, $chkmsg2 = False, $i = 0
	$g_sLastModversion = ""
	If FileExists($versionfile) Then
		$g_sLastModversion = IniRead($versionfile, "mod", "version", "")
		;look for localized messages for the new and old versions
		Local $versionfilelocalized = @ScriptDir & "\LastVersion_" & $g_sLanguage & ".txt" ;
		If FileExists(@ScriptDir & "\TestVersion_" & $g_sLanguage & ".txt") Then
			FileCopy(@ScriptDir & "\TestVersion_" & $g_sLanguage & ".txt", $versionfilelocalized, 1)
		Else
			;download page from site contains last bot version localized messages
            $hDownload = InetGet("https://raw.githubusercontent.com/rulesss2/MyBot-MBR_v7.6.3_Simbios-MOD/master/LastVersion_" & $g_sLanguage & ".txt", $versionfilelocalized, 0, 1)
			; Wait for the download to complete by monitoring when the 2nd index value of InetGetInfo returns True.
			Local $i = 0
			Do
				Sleep($DELAYCHECKVERSIONHTML1)
				$i += 1
			Until InetGetInfo($hDownload, $INET_DOWNLOADCOMPLETE) Or $i > 25

			InetClose($hDownload)
		EndIf
		If FileExists($versionfilelocalized) Then
			$g_sLastModmessage = IniRead($versionfilelocalized, "mod", "messagenew", "")
			$g_sOldModversmessage = IniRead($versionfilelocalized, "mod", "messageold", "")
			FileDelete($versionfilelocalized)
		Else
			$g_sLastModmessage = IniRead($versionfilelocalized, "mod", "messagenew", "")
			$g_sOldModversmessage = IniRead($versionfilelocalized, "mod", "messageold", "")
		EndIf
		FileDelete($versionfile)
	EndIf
EndFunc   ;==>CheckVersionHTML


Func VersionNumFromVersionTXT($versionTXT)
	; remove all after a space from $versionTXT, example "v.4.0.1 MOD" ==> "v.4.0.1"
	Local $versionTXT_clean
	If StringInStr($versionTXT, " ") Then
		$versionTXT_clean = StringLeft($versionTXT, StringInStr($versionTXT, " ") - 1)
	Else
		$versionTXT_clean = $versionTXT
	EndIf

	Local $resultnumber = 0
	If StringLeft($versionTXT_clean, 1) = "v" Then
		Local $versionTXT_Vector = StringSplit(StringMid($versionTXT_clean, 2, -1), ".")
		Local $multiplier = 1000000
		If UBound($versionTXT_Vector) > 0 Then
			For $i = 1 To UBound($versionTXT_Vector) - 1
				$resultnumber = $resultnumber + Number($versionTXT_Vector[$i]) * $multiplier
				$multiplier = $multiplier / 1000
			Next
		Else
			$resultnumber = Number($versionTXT_Vector) * $multiplier
		EndIf
	EndIf
	Return $resultnumber
EndFunc   ;==>VersionNumFromVersionTXT

Func _PrintLogVersion($message)
	Local $messagevet = StringSplit($message, "\n", 1)
	If Not (IsArray($messagevet)) Then
		SetLog($message)
	Else
		For $i = 1 To $messagevet[0]
			If StringLen($messagevet[$i]) <= 53 Then
				SetLog($messagevet[$i], $COLOR_BLACK, "Lucida Console", 8.5)
			Else
				While StringLen($messagevet[$i]) > 53
					Local $sp = StringInStr(StringLeft($messagevet[$i], 53), " ", 0, -1) ; find last occurrence of space
					If $sp = 0 Then ;no found spaces
						Local $sp = StringInStr($messagevet[$i], " ", 0) ; find first occurrence of space
						If $sp = 0 Then
							SetLog($messagevet[$i], $COLOR_BLACK, "Lucida Console", 8.5)
						Else
							SetLog(StringLeft($messagevet[$i], $sp), $COLOR_BLACK, "Lucida Console", 8.5)
							$messagevet[$i] = StringMid($messagevet[$i], $sp + 1, -1)
						EndIf
					Else
						SetLog(StringLeft($messagevet[$i], $sp), $COLOR_BLACK, "Lucida Console", 8.5)
						$messagevet[$i] = StringMid($messagevet[$i], $sp + 1, -1)
					EndIf
				WEnd
				If StringLen($messagevet[$i]) > 0 Then SetLog($messagevet[$i], $COLOR_BLACK, "Lucida Console", 8.5)
			EndIf
		Next
	EndIf
EndFunc   ;==>_PrintLogVersion

Func GetVersionNormalized($VersionString, $Chars = 5)
	If StringLeft($VersionString, 1) = "v" Then $VersionString = StringMid($VersionString, 2)
	Local $a = StringSplit($VersionString, ".", 2)
	Local $i
	For $i = 0 To UBound($a) - 1
		If StringLen($a[$i]) < $Chars Then $a[$i] = _StringRepeat("0", $Chars - StringLen($a[$i])) & $a[$i]
	Next
	Return _ArrayToString($a, ".")
EndFunc   ;==>GetVersionNormalized

Func CheckModVersion()
	If $g_sLastModversion = "" Then
		MsgBox($MB_ICONWARNING, "", "WE CANNOT OBTAIN MOD VERSION AT THIS TIME" & @CRLF & _
				"BAD CONNECTION", 10) ;10s timeout
	ElseIf VersionNumFromVersionTXT($g_sModversion) < VersionNumFromVersionTXT($g_sLastModversion) Then
		PushMsg("Update")
		If MsgBox(BitOR($MB_ICONWARNING, $MB_YESNO), "BOT Update Detected", "Chief, there is a new version of the bot available (" & $g_sLastModversion & ")" & @CRLF & @CRLF & _
				"Do you want to download the latest version ?", 30) = $IDYES Then ;30s timeout
			ShellExecute($g_sModSupportUrl)
			Return False
		EndIf
	Else
		MsgBox($MB_ICONINFORMATION, "Notify", "You Are Using The Latest Version Of by Simbios MOD" & @CRLF & _
				"Thanks..", 15) ;15s timeout
	EndIf
EndFunc   ;==>CheckModVersion
