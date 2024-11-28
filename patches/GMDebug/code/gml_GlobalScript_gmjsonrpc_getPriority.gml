function gmjsonrpc_getPriority(params) {
    var target = ds_list_find_value(params, 0);

    if(!ds_exists(target, ds_type_priority)) {
        return [-1, "ds_priority not found"];
    }

    return [0, ds_priority_write(target)];
}
