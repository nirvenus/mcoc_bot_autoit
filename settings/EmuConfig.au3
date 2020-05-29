#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
#include <FileConstants.au3>
#include <MsgBoxConstants.au3>

Func InitEmu()
	Local Const $ini_file = @scriptdir & "\settings\settings.ini"
	Local Const $emuSect = "Emulator"
	local $emuName_l = IniRead($ini_file, $emuSect, "emuName", "")
	Local $emuPath_l = IniRead($ini_file, $emuSect, "emuPath", "")
	Local $emuExists = FileExists($emuPath_l)
	;MsgBox($MB_SYSTEMMODAL, "MCOC Bot EMU EXISTS", $emuExists)
	local $reSetting = Not $emuExists Or ($emuName_l <> "" Or $emuPath_l <> "")
	If ($reSetting) Then
		$emuPath_l = ""
		While $emuPath_l == ""
			MsgBox($MB_SYSTEMMODAL, "MCOC Bot", "Select an Emulator")		
			$emuPath_l = FileOpenDialog ("Select an Emulator", @WindowsDir & "\", "Executable (*.exe)")
			If @error Then
				MsgBox($MB_SYSTEMMODAL, "MCOC Bot", "No Emulator was selected")
			Else
				Local $aDays = StringSplit($emuPath_l, "\")
				$emuName_l = StringSplit($aDays[$aDays[0]], ".")[1]
				If ($emuName_l=="Nox" Or $emuName_l=="Bluestacks") Then
					IniWrite($ini_file, $emuSect, "emuPath", $emuPath_l)
					IniWrite($ini_file, $emuSect, "emuName", $emuName_l)
				Else
					$emuPath_l = ""
					MsgBox($MB_SYSTEMMODAL, "MCOC Bot", "Choose 'Nox.exe' or 'Bluestacks.exe'")
				EndIf
			EndIf
		WEnd
	EndIf
	Global $emuName = $emuName_l
	Global $emuPath = $emuPath_l
	Global $emuParams = IniRead($ini_file, $emuSect, "emuParams" & $emuName, "")
	Return ($emuName <> "" And $emuName <> "")
EndFunc