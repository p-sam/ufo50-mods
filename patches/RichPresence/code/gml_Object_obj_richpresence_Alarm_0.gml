alarm[0] = room_speed * 5;

if(global.currGame != lastGameNum) {
    lastGameNum = global.currGame;

    if(discordReady) {
        np_setpresence_timestamps(date_current_datetime(), 0, false);
    }
}

var state = "In menu";
var details = "";
var largeImageKey = "";
var largeImageText = "";
var smallImageKey = "";
var smallImageText = "";

if(global.currGame != 0) {
    state = global.mGameTitle[global.currGame];
    details = "playing";
    largeImageKey = "game"+string(global.currGame);
    largeImageText = state;
    smallImageKey = "logo";
    smallImageText = game_display_name;

    if(array_length_1d(records) > global.currGame) {
        details = records[global.currGame];
    }
}

if(discordReady) {
    np_setpresence_more(smallImageText, largeImageText, false);
    np_setpresence(state, details, largeImageKey, smallImageKey);
}
