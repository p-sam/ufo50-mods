UFO 50 Mods
===========

[![GitHub](https://img.shields.io/github/license/p-sam/ufo50-mods)](https://github.com/p-sam/ufo50-mods/blob/master/LICENSE) [![UFO 50 Community Discord](https://img.shields.io/badge/Discord-UFO%2050%20Community-7289da?logo=discord&logoColor=white)](https://50games.fans/) [![MOD 50 Community Discord](https://img.shields.io/badge/Discord-MOD%2050-7289da?logo=discord&logoColor=white)](https://discord.com/invite/C4UyQfMBTQ)

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
| RichPresence | Discord Rich Presence ||✅|
| Quickstart | Skips cracktro and "play forever" screen ||✅|
| |
| 6P-Common | Extends the max number of players and inputs to 6 |||
| GMJSONRPC | (debug) JSONRPC websocket server |||

**Note**: Only scripts marked as `Public` will show by default in the Patcher window, hold SHIFT before it appears to see all (if you know what you're doing)

# Contributing

Contributions are welcome! If you find a bug, a new version that's not supported etc., please report it on the [issues page](https://github.com/p-sam/ufo50-mods/issues). 

Please note that I probably will not merge pull requests for additionnal patches. That is because I don't intend to maintain more patches than the ones I use. However,
do not hesitate to fork this repo and use it as a template for developing your patches/mods if it serves your needs.

Issues and pull requests specific to the patcher folder can go directly here: https://github.com/p-sam/ufo50-patcher
