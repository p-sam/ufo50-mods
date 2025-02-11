
uint _Patch_GMDInput_DLL_Define(UndertaleData utdata, UndertaleExtensionFile file, uint funcIdOffset = 0) {
    file.Kind = UndertaleExtensionKind.Dll;

    file.Functions.DefineExtensionFunction(utdata.Functions, utdata.Strings, ++funcIdOffset, 1, "gmdinput_init", UndertaleExtensionVarType.Double, "gmdinput_init", UndertaleExtensionVarType.String, UndertaleExtensionVarType.String);
    file.Functions.DefineExtensionFunction(utdata.Functions, utdata.Strings, ++funcIdOffset, 1, "gmdinput_shutdown", UndertaleExtensionVarType.Double, "gmdinput_shutdown");
    file.Functions.DefineExtensionFunction(utdata.Functions, utdata.Strings, ++funcIdOffset, 1, "gmdinput_poll", UndertaleExtensionVarType.Double, "gmdinput_poll", UndertaleExtensionVarType.Double);
    file.Functions.DefineExtensionFunction(utdata.Functions, utdata.Strings, ++funcIdOffset, 1, "gamepad_is_supported", UndertaleExtensionVarType.Double, "gmdinput_gamepad_is_supported");
    file.Functions.DefineExtensionFunction(utdata.Functions, utdata.Strings, ++funcIdOffset, 1, "gamepad_is_connected", UndertaleExtensionVarType.Double, "gmdinput_gamepad_is_connected", UndertaleExtensionVarType.Double);
    file.Functions.DefineExtensionFunction(utdata.Functions, utdata.Strings, ++funcIdOffset, 1, "gamepad_get_guid", UndertaleExtensionVarType.String, "gmdinput_gamepad_get_guid", UndertaleExtensionVarType.Double);
    file.Functions.DefineExtensionFunction(utdata.Functions, utdata.Strings, ++funcIdOffset, 1, "gamepad_get_device_count", UndertaleExtensionVarType.Double, "gmdinput_gamepad_get_device_count");
    file.Functions.DefineExtensionFunction(utdata.Functions, utdata.Strings, ++funcIdOffset, 1, "gamepad_get_description", UndertaleExtensionVarType.String, "gmdinput_gamepad_get_description", UndertaleExtensionVarType.Double);
    file.Functions.DefineExtensionFunction(utdata.Functions, utdata.Strings, ++funcIdOffset, 1, "gamepad_get_button_threshold", UndertaleExtensionVarType.Double, "gmdinput_gamepad_get_button_threshold", UndertaleExtensionVarType.Double);
    file.Functions.DefineExtensionFunction(utdata.Functions, utdata.Strings, ++funcIdOffset, 1, "gamepad_get_axis_deadzone", UndertaleExtensionVarType.Double, "gmdinput_gamepad_get_axis_deadzone", UndertaleExtensionVarType.Double);
    file.Functions.DefineExtensionFunction(utdata.Functions, utdata.Strings, ++funcIdOffset, 1, "gamepad_set_button_threshold", UndertaleExtensionVarType.Double, "gmdinput_gamepad_set_button_threshold", UndertaleExtensionVarType.Double, UndertaleExtensionVarType.Double);
    file.Functions.DefineExtensionFunction(utdata.Functions, utdata.Strings, ++funcIdOffset, 1, "gamepad_set_axis_deadzone", UndertaleExtensionVarType.Double, "gmdinput_gamepad_set_axis_deadzone", UndertaleExtensionVarType.Double, UndertaleExtensionVarType.Double);
    file.Functions.DefineExtensionFunction(utdata.Functions, utdata.Strings, ++funcIdOffset, 1, "gamepad_set_vibration", UndertaleExtensionVarType.Double, "gmdinput_gamepad_set_vibration", UndertaleExtensionVarType.Double, UndertaleExtensionVarType.Double, UndertaleExtensionVarType.Double);
    file.Functions.DefineExtensionFunction(utdata.Functions, utdata.Strings, ++funcIdOffset, 1, "gamepad_set_colour", UndertaleExtensionVarType.Double, "gmdinput_gamepad_set_colour", UndertaleExtensionVarType.Double, UndertaleExtensionVarType.Double);
    file.Functions.DefineExtensionFunction(utdata.Functions, utdata.Strings, ++funcIdOffset, 1, "gamepad_axis_count", UndertaleExtensionVarType.Double, "gmdinput_gamepad_axis_count", UndertaleExtensionVarType.Double);
    file.Functions.DefineExtensionFunction(utdata.Functions, utdata.Strings, ++funcIdOffset, 1, "gamepad_axis_value", UndertaleExtensionVarType.Double, "gmdinput_gamepad_axis_value", UndertaleExtensionVarType.Double, UndertaleExtensionVarType.Double);
    file.Functions.DefineExtensionFunction(utdata.Functions, utdata.Strings, ++funcIdOffset, 1, "gamepad_button_check", UndertaleExtensionVarType.Double, "gmdinput_gamepad_button_check", UndertaleExtensionVarType.Double, UndertaleExtensionVarType.Double);
    file.Functions.DefineExtensionFunction(utdata.Functions, utdata.Strings, ++funcIdOffset, 1, "gamepad_button_check_pressed", UndertaleExtensionVarType.Double, "gmdinput_gamepad_button_check_pressed", UndertaleExtensionVarType.Double, UndertaleExtensionVarType.Double);
    file.Functions.DefineExtensionFunction(utdata.Functions, utdata.Strings, ++funcIdOffset, 1, "gamepad_button_check_released", UndertaleExtensionVarType.Double, "gmdinput_gamepad_button_check_released", UndertaleExtensionVarType.Double, UndertaleExtensionVarType.Double);
    file.Functions.DefineExtensionFunction(utdata.Functions, utdata.Strings, ++funcIdOffset, 1, "gamepad_button_count", UndertaleExtensionVarType.Double, "gmdinput_gamepad_button_count", UndertaleExtensionVarType.Double);
    file.Functions.DefineExtensionFunction(utdata.Functions, utdata.Strings, ++funcIdOffset, 1, "gamepad_button_value", UndertaleExtensionVarType.Double, "gmdinput_gamepad_button_value", UndertaleExtensionVarType.Double, UndertaleExtensionVarType.Double);
    file.Functions.DefineExtensionFunction(utdata.Functions, utdata.Strings, ++funcIdOffset, 1, "gamepad_hat_count", UndertaleExtensionVarType.Double, "gmdinput_gamepad_hat_count", UndertaleExtensionVarType.Double);
    file.Functions.DefineExtensionFunction(utdata.Functions, utdata.Strings, ++funcIdOffset, 1, "gamepad_hat_value", UndertaleExtensionVarType.Double, "gmdinput_gamepad_hat_value", UndertaleExtensionVarType.Double, UndertaleExtensionVarType.Double);
    file.Functions.DefineExtensionFunction(utdata.Functions, utdata.Strings, ++funcIdOffset, 1, "gamepad_get_option", UndertaleExtensionVarType.Double, "gmdinput_gamepad_get_option", UndertaleExtensionVarType.Double, UndertaleExtensionVarType.String);
    file.Functions.DefineExtensionFunction(utdata.Functions, utdata.Strings, ++funcIdOffset, 1, "gamepad_set_option", UndertaleExtensionVarType.Double, "gmdinput_gamepad_set_option", UndertaleExtensionVarType.Double, UndertaleExtensionVarType.String, UndertaleExtensionVarType.Double);
    file.Functions.DefineExtensionFunction(utdata.Functions, utdata.Strings, ++funcIdOffset, 1, "gamepad_get_mapping", UndertaleExtensionVarType.String, "gmdinput_gamepad_get_mapping", UndertaleExtensionVarType.Double);
    file.Functions.DefineExtensionFunction(utdata.Functions, utdata.Strings, ++funcIdOffset, 1, "gamepad_test_mapping", UndertaleExtensionVarType.Double, "gmdinput_gamepad_test_mapping", UndertaleExtensionVarType.Double, UndertaleExtensionVarType.String);
    file.Functions.DefineExtensionFunction(utdata.Functions, utdata.Strings, ++funcIdOffset, 1, "gamepad_remove_mapping", UndertaleExtensionVarType.Double, "gmdinput_gamepad_remove_mapping", UndertaleExtensionVarType.Double);

    file.CleanupScript = Data.Strings.MakeString("");
    file.InitScript = Data.Strings.MakeString("");

    return funcIdOffset;
}
