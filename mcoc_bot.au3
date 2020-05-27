#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script HotKeys:
#include "settings\EmuConfig.au3"

HotKeySet("{ESC}", "_Terminate")

Main()

Func Main()
	If InitEmu() Then
		MsgBox($MB_SYSTEMMODAL, "MCOC Bot", "Success")
	Else
		MsgBox($MB_SYSTEMMODAL, "MCOC Bot", "NOT Success")
	EndIf
EndFunc

Func _Terminate()
    Exit
EndFunc   ;==>_Terminate