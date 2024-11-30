#include <GDIPlus.au3>

Func _Fatal($sMsg)
	MsgBox(16, @ScriptName, $sMsg)
	Exit 1
EndFunc

ProgressOn(@ScriptName, "Downloading images")
$iNumGames = 50
$iImageSize = 96
$iResizeFactor = 6
_GDIPlus_Startup()
For $iA = 1 To $iNumGames
	$sInputFilename = StringFormat("%02i", $iA)&".png"
	$sOutputFilename = "game"&$iA&".png"
	ProgressSet($iA/$iNumGames*100, $sOutputFilename)
	If 0 == InetGet("https://tiermaker.com/images/media/template_images/2024/771081/ufo-50-icons-771081/"&$sInputFilename, @ScriptDir&"\"&$sOutputFilename&".tmp.png") Then
		_Fatal("failed to download: "&$sOutputFilename)
	EndIf
	$hImage = _GDIPlus_ImageLoadFromFile(@ScriptDir&"\"&$sOutputFilename&".tmp.png")
	If $hImage == 0 Then _Fatal("failed to open image: "&$sOutputFilename)
	$iWidth = _GDIPlus_ImageGetWidth($hImage)
	$iHeight = _GDIPlus_ImageGetHeight($hImage)
	if $iWidth <> $iImageSize Or $iHeight <> $iImageSize Then _Fatal("image has wrong dimensions: "&$iWidth&"x"&$iHeight&" - "&$sOutputFilename)
	$hImageResized = _GDIPlus_ImageResize($hImage, $iWidth * $iResizeFactor, $iHeight * $iResizeFactor, $GDIP_INTERPOLATIONMODE_NEARESTNEIGHBOR)
	_GDIPlus_ImageDispose($hImage)
	FileDelete(@ScriptDir&"\"&$sOutputFilename&".tmp.png")
	If $hImageResized == 0 Then _Fatal("failed to resize: "&$sOutputFilename)
	If Not _GDIPlus_ImageSaveToFile($hImageResized, @ScriptDir&"\"&$sOutputFilename) Then _Fatal("failed to save: "&$sOutputFilename)
	_GDIPlus_ImageDispose($hImageResized)
Next
ProgressOff()
