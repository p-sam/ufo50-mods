function gmjsonrpc_getGrid(params) {
    var target = ds_list_find_value(params, 0);

    if(!ds_exists(target, ds_type_grid)) {
        return [-1, "ds_grid not found"];
    }

    return [0, ds_grid_write(target)];
}
