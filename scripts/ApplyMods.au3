#include '_inc.au3'

Global Const $GMLOADER_DIR = _PathFull('..\gmloader', @ScriptDir)
Global Const $GMLOADER_EXE = $GMLOADER_DIR&'\GMLoader.exe'
Global Const $MODS_DIR = _PathFull('..\mods', @ScriptDir)
Global Const $UFO50_DIR_SAVE_PATH = $GMLOADER_DIR&'\Custom_Game_Path.txt'
Global Const $MODLIST_SAVE_PATH = $GMLOADER_DIR&'\_modlist.txt'

$bFlagsLaunch = EnvGet('UFO50_APPLYMODS_LAUNCH') == '1'

For $iA = 1 To $CmdLine[0]
	If StringLower($CmdLine[$iA]) == 'launch' Then $bFlagsLaunch = True
Next

If Not FileExists($GMLOADER_EXE) Then _Fatal('GMLoader is missing. Install the ufo50 specific version to:'&@CRLF&$GMLOADER_DIR)

$sSavedUFO50Dir = FileRead($UFO50_DIR_SAVE_PATH)

$sUFO50Dir = $sSavedUFO50Dir
If $sUFO50Dir == '' Then $sUFO50Dir = _UFO50_FindSteamDir()
If $sUFO50Dir == '' Then
	$sUFO50Dir = FileSelectFolder('Choose UFO50 dir', '')
	If $sUFO50Dir == '' Then Exit

	If Not _UFO50_IsValidDir($sUFO50Dir) Then _Fatal('Invalid UFO 50 dir')

	If $sSavedUFO50Dir <> $sUFO50Dir Then
		$hUfo50DirSaveFile = FileOpen($UFO50_DIR_SAVE_PATH, $FO_OVERWRITE)
		FileWrite($hUfo50DirSaveFile, $sUFO50Dir)
		FileClose($hUfo50DirSaveFile)
	EndIf
EndIf

$sUFO50Version = _UFO50_Version($sUFO50Dir)

$sUFO50OriginalDataPath = $sUFO50Dir&'\data.original.'&$sUFO50Version&'.win'
If Not FileExists($sUFO50OriginalDataPath) Then
	If Not FileCopy($sUFO50Dir&'\data.win', $sUFO50OriginalDataPath, $FC_OVERWRITE) Then _Fatal('Failed to backup ufo50 game data')
EndIf

$sRawModNames = StringStripCR(FileRead($MODLIST_SAVE_PATH))
If $sRawModNames == '*' Or $sRawModNames == '' Then
	$aModNames = _FileListToArray($MODS_DIR, '*', $FLTA_FOLDERS)
	_ArrayDelete($aModNames, 0)
Else
	$aModNames = StringSplit($sRawModNames, ',')
EndIf

If UBound($aModNames) == 0 Then _Fatal('No mod selected')

ProgressOn(@ScriptName, 'Preparing mod folder', 'Init')
_UFO50_GMLoader_Reset($GMLOADER_DIR)

For $iA = 0 To UBound($aModNames)-1
	$sModName = $aModNames[$iA]
	$sModDir = $MODS_DIR&'\'&$sModName
	ProgressSet(($iA+1)/UBound($aModNames)*100, $sModName)

	_UFO50_GMLoader_ModInfo($sModDir) ; Quick structure check of the info file
	_UFO50_GMLoader_AddMod($GMLOADER_DIR, $sModDir)
Next
ProgressOff()

_UFO50_GMLoader_PatchGameData($GMLOADER_DIR, $sUFO50OriginalDataPath, $sUFO50Dir&'\data.win')
_UFO50_GMLoader_PatchGameDir($GMLOADER_DIR, $sUFO50Dir)

If $bFlagsLaunch Then
	Run('"'&$sUFO50Dir&'\ufo50.exe"', $sUFO50Dir)
EndIf
