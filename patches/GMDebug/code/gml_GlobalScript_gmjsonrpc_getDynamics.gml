function gmjsonrpc_getDynamics(params) {
    var target = ds_list_find_value(params, 0);

    // we have to use an array here to avoid generating more datastructures while scanning for datastructurse
    var indices = [];
    var scan_max = 100;
    for (var i=0; i<scan_max; i++) {
        var exists = false;
        switch (target) {
            case "Map": exists = ds_exists(i, ds_type_map) break;
            case "List": exists = ds_exists(i, ds_type_list) break;
            case "Stack": exists = ds_exists(i, ds_type_stack) break;
            case "Grid": exists = ds_exists(i, ds_type_grid) break;
            case "Queue": exists = ds_exists(i, ds_type_queue) break;
            case "Priority": exists = ds_exists(i, ds_type_priority) break;
            case "Buffer": exists = buffer_exists(i) break;
            case "Surface": exists = surface_exists(i) break;
            default: break;
        }

        if(exists) {
            indices[array_length_1d(indices)] = i
            scan_max += 1;
        }
    }

    var result = ds_list_create();

    var len = array_length_1d(indices)
    for (var i=0; i<len; i++) {
        var entry = ds_map_create();
        var index = indices[i];
        ds_map_add(entry, "id", index);
        
        switch (target) {
        default:
        case "Map":
            var keys = ds_list_create();
            for(var key=ds_map_find_first(i); not is_undefined(key); key=ds_map_find_next(i, key)) { 
                ds_list_add(keys, key);
            }
            ds_map_add_list(entry, "keys", keys);
            ds_map_add(entry, "size", ds_map_size(i));
            break;
        case "List":
            ds_map_add(entry, "size", ds_list_size(i));
            break;
        case "Stack":
            ds_map_add(entry, "size", ds_stack_size(i));
            break;
        case "Grid":
            ds_map_add(entry, "width", ds_grid_width(i));
            ds_map_add(entry, "height", ds_grid_height(i));
            break;
        case "Queue":
            ds_map_add(entry, "size", ds_queue_size(i));
            break;
        case "Priority":
            ds_map_add(entry, "size", ds_priority_size(i));
            break;
        case "Buffer":
            ds_map_add(entry, "size", buffer_get_size(i));
            ds_map_add(entry, "tell", buffer_tell(i));
            break;
        case "Surface":
            ds_map_add(entry, "width", surface_get_width(i));
            ds_map_add(entry, "height", surface_get_height(i));
            break;
        }

        ds_list_add(result, entry);
        ds_list_mark_as_map(result, ds_list_size(result)-1);
    }

    return [ds_type_list, result];
}
