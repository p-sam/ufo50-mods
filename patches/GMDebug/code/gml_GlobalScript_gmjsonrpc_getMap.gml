function gmjsonrpc_getMap(params) {
    var target = ds_list_find_value(params, 0);
    var useJson = ds_list_find_value(params, 1);

    if(!ds_exists(target, ds_type_map)) {
        return [-1, "ds_map not found"];
    }

    var result = useJson ? json_encode(target) : ds_map_write(target);
    return [0, result];
}
