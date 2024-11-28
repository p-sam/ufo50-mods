function gmjsonrpc_getVariables(params) {
    var target = ds_list_find_value(params, 0);
    var builtins = ds_list_find_value(params, 1);

    var result = ds_map_create();
    var varNames = variable_instance_get_names(target)

    // metadata
    if(target == global) {
        ds_map_add(result, "objectName", "");
    }
    else if(instance_exists(target)) {
        ds_map_add(result, "objectName", object_get_name(target.object_index));
    } else {
        ds_map_destroy(result);
        return [-1, "Instance not found"];
    }

    // variables
    var variablesList = ds_map_create()
    if(target == global) {
        for (var i=array_length_1d(varNames)-1; i>=0; i--) {
            var varName = varNames[i];
            var value = variable_global_get(varName);
            var type = typeof(value);
        
            var variable = ds_map_create();
            ds_map_add(variable, "value", value);
            ds_map_add(variable, "type", type);
            ds_map_add(variable, "builtin", false);
        
            ds_map_add_map(variablesList, varName, variable);
        }
        if(builtins) {
            // add builtins
            for (var i=array_length_1d(global.gmdebugGlobalBuiltinsArray)-1; i>=0; i--) {
                var varName = global.gmdebugGlobalBuiltinsArray[i];
                var value = variable_global_get(varName);
                var type = typeof(value);
        
                var variable = ds_map_create();
                ds_map_add(variable, "value", value);
                ds_map_add(variable, "type", type);
                ds_map_add(variable, "builtin", true);
        
                ds_map_add_map(variablesList, varName, variable);
            }
        }
    } else {
        for (var i=array_length_1d(varNames)-1; i>=0; i--) {
            var varName = varNames[i];
            var value = variable_instance_get(target, varName);
            var type = typeof(value);
        
            var variable = ds_map_create();
            ds_map_add(variable, "value", value);
            ds_map_add(variable, "type", type);
            ds_map_add(variable, "builtin", false);
        
            ds_map_add_map(variablesList, varName, variable);
        }
        if(builtins) {
            // add builtins
            for (var i=array_length_1d(global.gmdebugBuiltinsArray)-1; i>=0; i--) {
                var varName = global.gmdebugBuiltinsArray[i];
                var value = variable_instance_get(target, varName);
                var type = typeof(value);
        
                var variable = ds_map_create();
                ds_map_add(variable, "value", value);
                ds_map_add(variable, "type", type);
                ds_map_add(variable, "builtin", true);
        
                ds_map_add_map(variablesList, varName, variable);
            }
        }
    }

    ds_map_add_map(result, "variablesList", variablesList);

    return [ds_type_map, result];
}