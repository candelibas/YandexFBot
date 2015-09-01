#cs ----------------------------------------------------------------------------

 YandexFBot Version: 0.1
 Author:         Can Delibas <candelibas00@gmail.com>

 Script Function:
	Fenerbahçe'ye katkı sağlamak amacıyla yapılmış bir bot

#ce ----------------------------------------------------------------------------

TraySetIcon("asset/yandex.ico")

#include <WindowsConstants.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>
#include <ImageSearch.au3>
#include <File.au3>


HotKeySet("{F2}", "_main")
HotKeySet("{ESC}", "_exit")

$bot = False

Global $screen_x = 0
Global $screen_y = 0
Global $count = 0

_pause()

While 1
   Sleep(10)
WEnd

Func _main()

   ; Activate the Yandex FBot
   $bot = Not $bot

   If $bot = True Then
	  While 1

		 Local $aInput
		 $file = "wordlist.txt"

		 ; Let's be an array!
		 _FileReadToArray($file, $aInput)
		 ;For $i = 1 to UBound($aInput) -1
			; $wordArray[$i] = $aInput[$i]
		 ;Next
	  ; Wordlist
	  ;Dim $wordArray[100] = ["fenerbahçe","van persie","nani","fenerbahçe tarihi","alex de souza","gökhan gönül","fernandau","volkan demiler","stoch kimdir","fenerbahçe basketbol"]

	  ; Do the search
	  Sleep(1000)
	  Send($aInput[Random(0,UBound($aInput)-1,1)] & "{ENTER}")
	  Sleep(3000)

	  ; Update total search
	  $count = $count + 1

	  ; Find our logo
	  $find_back = _ImageSearch('asset/yandexfb.bmp',1,$screen_x,$screen_y,0)

	  ; Let's check and click if we find our logo
	  If $find_back = 1 Then
		MouseMove( $screen_x,  $screen_y)
		 MouseClick("LEFT", $screen_x,$screen_y)
	  Else
		 ToolTip("Logo bulunamadı",0,0,"")
	  EndIf

	  WEnd
   Else
	  _pause()
   EndIf


EndFunc

Func _pause()
   While 1
	  Sleep(10)
   WEnd
EndFunc

Func _exit()
   ; Show us the total searches!
   MsgBox($MB_OK,"Teşekkürler Fenerbahçe Taraftarı", "Arama Sayısı: " & $count & " kez arama yapıldı. İşte gerçek bir taraftar! ")
   Exit
EndFunc


