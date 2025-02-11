discordAppId = "1312167375491174501";
steamAppId = "1147860";
discordReady = false;
lastGameNum = -1;
records = array_create(0);

if (!np_initdiscord(discordAppId, true, steamAppId))
    show_debug_message("NekoPresence init fail.");
