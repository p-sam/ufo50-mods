discordAppId = "1312167375491174501"
// discordAppId = "715161153319206912"
steamAppId = "1147860"
// steamAppId = np_steam_app_id_empty

discordReady = false;
lastGameNum = -1;
records = array_create(0);

if (!np_initdiscord(discordAppId, true, steamAppId)) {
	show_debug_message("NekoPresence init fail.");
}
