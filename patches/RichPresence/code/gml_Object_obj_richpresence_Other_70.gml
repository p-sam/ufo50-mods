var ev_type = ds_map_find_value(async_load, "event_type");

if (ev_type == "DiscordReady") {
    discordReady = true;
    alarm[0] = 1;
}
