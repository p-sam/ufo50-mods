#include-once

#include <Array.au3>
#include <File.au3>

Global Const $MODINFO_IDX_AUTHOR = 0
Global Const $MODINFO_IDX_DESC = 1
Global Const $MODINFO_IDX__COUNT = 2

Func _Fatal($sMsg)
	SplashOff()
	ProgressOff()
	MsgBox($MB_ICONERROR, @ScriptName, $sMsg)
	Exit 1
EndFunc

Func _UFO50_IsValidDir($sDir)
	Return FileExists($sDir&'\ufo50.exe') And (FileExists($sDir&'\data.win'))
EndFunc

Func _UFO50_FindSteamDir()
    $sDefaultSteamDir = RegRead('HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Valve\Steam', 'InstallPath')
	If @error Or $sDefaultSteamDir == '' Then $sDefaultSteamDir = 'C:\Program Files (x86)\Steam'

	$sLibraryFoldersVdfPath = $sDefaultSteamDir&'\steamapps\libraryfolders.vdf'
	If Not FileExists($sLibraryFoldersVdfPath) Then Return ''

	$sLibraryFoldersVdf = FileRead($sLibraryFoldersVdfPath)

	$aMatches = StringRegExp($sLibraryFoldersVdf, '(?m)^\s*"path"\s*"([A-Z]:[^"]+)"\s*$', $STR_REGEXPARRAYGLOBALMATCH)
	For $iA = 0 To UBound($aMatches)-1
		$sSteamDir = StringReplace($aMatches[$iA], '\\', '\')
		$sUFO50Dir = $sSteamDir&'\steamapps\common\UFO 50'
		If _UFO50_IsValidDir($sUFO50Dir) Then Return $sUFO50Dir
	Next

	Return ''
EndFunc

Func _UFO50_Version($sGameDir)
	$sVersion = FileGetVersion($sGameDir&'\ufo50.exe')
	If $sVersion == '0.0.0.0' Or $sVersion == '' Then _Fatal('Could not determine game version')
	Return $sVersion
EndFunc

Func _UFO50_GMLoader_ModInfo($sModDir)
	$aLines = FileReadToArray($sModDir&'\info.txt')

	If @extended <> $MODINFO_IDX__COUNT Then _Fatal('Invalid mod info: '&@CRLF&@CRLF&$sModDir)
	If StringLen($aLines[$MODINFO_IDX_AUTHOR]) <= 0 Then _Fatal('Invalid mod info (author): '&@CRLF&@CRLF&$sModDir)
	If StringLen($aLines[$MODINFO_IDX_DESC]) <= 0 Then _Fatal('Invalid mod info (desc): '&@CRLF&@CRLF&$sModDir)

	Return $aLines
EndFunc

Func _UFO50_GMLoader_Reset($sGMLoaderDir)
	DirRemove($sGMLoaderDir&'\mods', $DIR_REMOVE)
	DirCopy($sGMLoaderDir&'\mods_base', $sGMLoaderDir&'\mods')
EndFunc

Func _UFO50_GMLoader_AddMod($sGMLoaderDir, $sModDir)
	$aModFiles = _FileListToArrayRec($sModDir, '*', $FLTAR_FILES, $FLTAR_RECUR)
	For $iA = 1 To $aModFiles[0]
		$sModFile = $aModFiles[$iA]
		If StringInStr($sModFile, '\') And Not FileCopy($sModDir&'\'&$sModFile, $sGMLoaderDir&'\mods\'&$sModFile, $FC_CREATEPATH) Then
			_Fatal('File conflict and/or failed copy on mod :'&@CRLF&@CRLF&'Mod dir: '&$sModDir&@CRLF&'Mod file:'&$sModFile)
		EndIf
	Next
EndFunc

Func _UFO50_GMLoader_PatchGameData($sGMLoaderDir, $sGameDataSrcPath, $sGameDataDestPath)
	If Not FileCopy($sGameDataSrcPath, $sGMLoaderDir&'\data.win', $FC_OVERWRITE) Then _Fatal('Failed to copy game data to gmloader folder')

	FileDelete($sGMLoaderDir&'\GMLoader.log')

	; Bad hack to skip gmloader waiting for user input at the end of each run
	DllCall('kernel32', 'int', 'AllocConsole')
	$iPid = Run('"'&$sGMLoaderDir&'\GMLoader.exe"', $sGMLoaderDir, Default, BitOR($STDIN_CHILD, $STDERR_CHILD, $STDOUT_CHILD))
	While ProcessExists($iPid)
		$sStdout = StderrRead($iPid)
		ConsoleWrite($sStdout)
		$sStderr = StdoutRead($iPid)
		ConsoleWriteError($sStderr)
		StdinWrite($iPid, 'y')
		Sleep(20)
		If StringInStr($sStderr&$sStdout, 'Press any key to close...') Then ProcessClose($iPid)
	WEnd

	; And another bad hack to detect silent errors to avoid shipping broken mods :^)
	$sGMLoaderLog = FileRead($sGMLoaderDir&'\GMLoader.log')
	$iGMLoaderLogEndPos = StringInStr($sGMLoaderLog, 'Press any key to close...')
	If $iGMLoaderLogEndPos > 1 Then $sGMLoaderLog = StringLeft($sGMLoaderLog, $iGMLoaderLogEndPos)

	If StringInStr($sGMLoaderLog, 'ERR]') Then _Fatal('GMLoader failed, check the logs')

	If Not FileCopy($sGMLoaderDir&'\data.win', $sGameDataDestPath, $FC_OVERWRITE) Then _Fatal('Failed to copy back modded ufo50 game data')
EndFunc

Func _UFO50_GMLoader_PatchGameDir($sGMLoaderDir, $sGameDir)
	If StringInStr(FileGetAttrib($sGMLoaderDir&'\mods\dll'), 'D') Then
		If Not DirCopy($sGMLoaderDir&'\mods\dll', $sGameDir, $FC_OVERWRITE) Then _Fatal('Failed to copy dlls')
	EndIf

	If StringInStr(FileGetAttrib($sGMLoaderDir&'\mods\ext'), 'D') Then
		If Not DirCopy($sGMLoaderDir&'\mods\ext', $sGameDir&'\ext', $FC_OVERWRITE) Then _Fatal('Failed to copy localization files')
	EndIf
EndFunc
