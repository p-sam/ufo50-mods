function gmjsonrpc_getQueue(params) {
    var target = ds_list_find_value(params, 0);

    if(!ds_exists(target, ds_type_queue)) {
        return [-1, "ds_queue not found"];
    }

    return [0, ds_queue_write(target)];
}
