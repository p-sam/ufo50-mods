function gmjsonrpc_getList(params) {
    var target = ds_list_find_value(params, 0);
    var useJson = ds_list_find_value(params, 1);

    if(!ds_exists(target, ds_type_list)) {
        return [-1, "ds_list not found"];
    }

    var result;
    if(useJson == true) {
        var tempParent = ds_map_create()
        ds_map_add_list(tempParent, "default", target);

        result = json_encode(tempParent);
        ds_map_replace(tempParent, "default", undefined);
        ds_map_destroy(tempParent)
    } else {
        result = ds_list_write(target);
    }

    return [0, result];
}
