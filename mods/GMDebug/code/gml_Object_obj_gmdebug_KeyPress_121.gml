show_debug_overlay(!is_debug_overlay_open());

if(!debugViewCreated) {
    debugViewCreated = true;
    dbg_view("GMDebug_UFO50", true, -1, -1, 400, 450);

    dbg_section("State");
    dbg_checkbox(ref_create(global, "debugOn"), "debugOn");
    dbg_watch(ref_create(global, "steamReady"), "steamReady");
    dbg_watch(ref_create(global, "steamOverlayActivated"), "steamOverlayActivated");
    dbg_watch(ref_create(global, "paused"), "paused");
    dbg_watch(ref_create(global, "currFile"), "currFile");
    dbg_watch(ref_create(global, "currGame"), "currGame");
    dbg_watch(ref_create(global, "attractMode"), "attractMode");
    dbg_watch(ref_create(global, "playbackMode"), "playbackMode");
    dbg_watch(ref_create(global, "numPlayers"), "numPlayers");

    dbg_button("Pause", function() {scrPause(1);});
    dbg_same_line();
    dbg_button("Unpause", function() {scrUnpause();});
    dbg_button("ExitToTitleScreen", function() {if(global.currGame > 0) { scrExitToTitleScreen(); }});
    dbg_same_line();
    dbg_button("ExitToLibrary", function() {scrExitToLibrary();});

    dbg_section("Cheats");
    dbg_text_input(ref_create(global, "cheatID"), "cheatID", "i");
    dbg_checkbox(ref_create(global, "cheatedNoSave"), "cheatedNoLoad");
    dbg_checkbox(ref_create(global, "cheatedNoLoad"), "cheatedNoLoad");
    dbg_checkbox(ref_create(global, "cheatedBypassTitle"), "cheatedBypassTitle");
    dbg_text_input(ref_create(global, "cheatedNumPlayers"), "cheatedNumPlayers", "i");
    dbg_button("ClearCheats", function() {scrClearCheats();});
}
