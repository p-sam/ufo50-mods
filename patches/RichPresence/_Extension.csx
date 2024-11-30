void _Patch_NekoPresence_DefineFunction(UndertaleData utdata, UndertaleExtensionFile file, uint funcIdOffset = 0) {
    file.Functions.DefineExtensionFunction(utdata.Functions, utdata.Strings, ++funcIdOffset, 1, "__np_initdll", UndertaleExtensionVarType.Double, "np_initdll");
    file.Functions.DefineExtensionFunction(utdata.Functions, utdata.Strings, ++funcIdOffset, 1, "__np_shutdown", UndertaleExtensionVarType.Double, "np_shutdown");
    file.Functions.DefineExtensionFunction(utdata.Functions, utdata.Strings, ++funcIdOffset, 1, "np_initdiscord", UndertaleExtensionVarType.Double, "np_initdiscord", UndertaleExtensionVarType.String, UndertaleExtensionVarType.Double, UndertaleExtensionVarType.String);
    file.Functions.DefineExtensionFunction(utdata.Functions, utdata.Strings, ++funcIdOffset, 1, "np_setpresence", UndertaleExtensionVarType.Double, "np_setpresence", UndertaleExtensionVarType.String, UndertaleExtensionVarType.String, UndertaleExtensionVarType.String, UndertaleExtensionVarType.String);
    file.Functions.DefineExtensionFunction(utdata.Functions, utdata.Strings, ++funcIdOffset, 1, "np_update", UndertaleExtensionVarType.Double, "np_update");
    file.Functions.DefineExtensionFunction(utdata.Functions, utdata.Strings, ++funcIdOffset, 1, "__np_registercallbacks_do_not_call", UndertaleExtensionVarType.Double, "RegisterCallbacks", UndertaleExtensionVarType.String, UndertaleExtensionVarType.String, UndertaleExtensionVarType.String, UndertaleExtensionVarType.String);
    file.Functions.DefineExtensionFunction(utdata.Functions, utdata.Strings, ++funcIdOffset, 1, "np_setpresence_more", UndertaleExtensionVarType.Double, "np_setpresence_more", UndertaleExtensionVarType.String, UndertaleExtensionVarType.String, UndertaleExtensionVarType.Double);
    file.Functions.DefineExtensionFunction(utdata.Functions, utdata.Strings, ++funcIdOffset, 1, "np_clearpresence", UndertaleExtensionVarType.Double, "np_clearpresence");
    file.Functions.DefineExtensionFunction(utdata.Functions, utdata.Strings, ++funcIdOffset, 1, "np_registergame", UndertaleExtensionVarType.Double, "np_registergame", UndertaleExtensionVarType.String, UndertaleExtensionVarType.String);
    file.Functions.DefineExtensionFunction(utdata.Functions, utdata.Strings, ++funcIdOffset, 1, "np_registergame_steam", UndertaleExtensionVarType.Double, "np_registergame_steam", UndertaleExtensionVarType.String, UndertaleExtensionVarType.String);
    file.Functions.DefineExtensionFunction(utdata.Functions, utdata.Strings, ++funcIdOffset, 1, "np_setpresence_secrets", UndertaleExtensionVarType.Double, "np_setpresence_secrets", UndertaleExtensionVarType.String, UndertaleExtensionVarType.String, UndertaleExtensionVarType.String);
    file.Functions.DefineExtensionFunction(utdata.Functions, utdata.Strings, ++funcIdOffset, 1, "np_setpresence_partyparams", UndertaleExtensionVarType.Double, "np_setpresence_partyparams", UndertaleExtensionVarType.Double, UndertaleExtensionVarType.Double, UndertaleExtensionVarType.String, UndertaleExtensionVarType.Double);
    file.Functions.DefineExtensionFunction(utdata.Functions, utdata.Strings, ++funcIdOffset, 1, "np_respond", UndertaleExtensionVarType.Double, "np_respond", UndertaleExtensionVarType.String, UndertaleExtensionVarType.Double);
    file.Functions.DefineExtensionFunction(utdata.Functions, utdata.Strings, ++funcIdOffset, 1, "np_setpresence_timestamps", UndertaleExtensionVarType.Double, "np_setpresence_timestamps", UndertaleExtensionVarType.Double, UndertaleExtensionVarType.Double, UndertaleExtensionVarType.Double);
    file.Functions.DefineExtensionFunction(utdata.Functions, utdata.Strings, ++funcIdOffset, 1, "np_setpresence_buttons", UndertaleExtensionVarType.Double, "np_setpresence_buttons", UndertaleExtensionVarType.Double, UndertaleExtensionVarType.String, UndertaleExtensionVarType.String);

    file.CleanupScript = Data.Strings.MakeString("__np_shutdown");
    file.InitScript = Data.Strings.MakeString("__np_initdll");
}
