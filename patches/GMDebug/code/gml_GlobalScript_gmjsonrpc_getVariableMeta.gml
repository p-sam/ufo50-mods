function gmjsonrpc_getVariableMeta(params) {
    var target = ds_list_find_value(params, 0);
    var varName = ds_list_find_value(params, 1);

    if(target == global) {
        var value = variable_global_get(varName);
    }
    else if(target == noone) {
        var value = varName;	
    }
    else if(instance_exists(target)) {
        var value = variable_instance_get(target, varName);
    } else {
        return [-1, "Instance not found"];
    }

    var result = ds_list_create();

    if(typeof(value) == "number" or typeof(value) == "int32" or typeof(value) == "int64") {
        if(ds_exists(value, ds_type_map)) ds_list_add(result, "Map");
        if(ds_exists(value, ds_type_list)) ds_list_add(result, "List");
        if(ds_exists(value, ds_type_stack)) ds_list_add(result, "Stack");
        if(ds_exists(value, ds_type_grid)) ds_list_add(result, "Grid");
        if(ds_exists(value, ds_type_queue)) ds_list_add(result, "Queue");
        if(ds_exists(value, ds_type_priority)) ds_list_add(result, "Priority");
        if(buffer_exists(value)) ds_list_add(result, "Buffer");
        if(surface_exists(value)) ds_list_add(result, "Surface");
    }

    return [ds_type_list, result];
}
