#include <GuiMenu.au3>
#include <WinAPIGdi.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	Local $hWnd, $hMain, $hFile, $hBrush

	; Open Notepad
	Run("notepad.exe")
	WinWaitActive("[CLASS:Notepad]")
	$hWnd = WinGetHandle("[CLASS:Notepad]")
	$hMain = _GUICtrlMenu_GetMenu($hWnd)
	$hFile = _GUICtrlMenu_GetItemSubMenu($hMain, 0)

	; File menu background
	Writeln("File menu background: 0x" & Hex(_GUICtrlMenu_GetMenuBackground($hFile)))
	$hBrush = _WinAPI_GetSysColorBrush($COLOR_INFOBK)
	_GUICtrlMenu_SetMenuBackground($hFile, $hBrush)
	Writeln("File menu background: 0x" & Hex(_GUICtrlMenu_GetMenuBackground($hFile)))
EndFunc   ;==>Example

; Write a line of text to Notepad
Func Writeln($sText)
	ControlSend("[CLASS:Notepad]", "", "Edit1", $sText & @CRLF)
EndFunc   ;==>Writeln
