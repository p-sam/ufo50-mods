UFO 50 Mods
===========

[![GitHub](https://img.shields.io/github/license/p-sam/ufo50-mods)](https://github.com/p-sam/ufo50-mods/blob/master/LICENSE)

Miscellaneous patches for [UFO 50](https://50games.fun/)

# How to use

You need a compatible [UndertaleModTool](https://github.com/UnderminersTeam/UndertaleModTool) version, either a build from the [underanalyzer](https://github.com/UnderminersTeam/UndertaleModTool/tree/underanalyzer) branch or from this [fork](https://github.com/p-sam/UndertaleModTool)

Clone this repo, or download the repo archive zip and extract it 

### - Method 1 (Automatic patch from Steam)

Open UndertaleModTool and run the `AutoDetectAndPatch.csx` script in the `patcher` folder (Menu: `Scripts > Run other script...`)

This will detect and patch the data found in the Steam folder for that game

### - Method 2 (Manual)

Locate and open the game `data.win` file with UndertaleModTool, then run the `Patcher.csx` script in the `patcher` folder (Menu: `Scripts > Run other script...`)

# Patches

| Name | Description | Depends on | Public |
| --- | --- | --- | --- |
| 6P-BigBellRace | BigBellRace 2-6 players multiplayer | 6P-Common |✅|
| GMDebug | (debug) [Browser-based debugging interface](https://debug.gmcloud.org/) | GMJSONRPC |✅|
| Quickstart | Skips cracktro and "play forever" screen ||✅|
| |
| 6P-Common | Extends the max number of players and inputs to 6 |||
| GMJSONRPC | (debug) JSONRPC websocket server |||

**Note**: Only scripts marked as `Public` will show by default in the Patcher window, hold SHIFT before it appears to see all (if you know what you're doing)