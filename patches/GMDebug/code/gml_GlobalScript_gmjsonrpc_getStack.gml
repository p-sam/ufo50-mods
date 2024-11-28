function gmjsonrpc_getStack(params) {
    var target = ds_list_find_value(params, 0);

    if(!ds_exists(target, ds_type_stack)) {
        return [-1, "ds_stack not found"];
    }

    return [0, ds_stack_write(target)];
}
