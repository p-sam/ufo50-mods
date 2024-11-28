function gmjsonrpc_getBuffer(params) {
    var target = ds_list_find_value(params, 0);

    if(buffer_exists(target)) {
        return [-1, "Buffer not found"];
    }

    var result = buffer_base64_encode(target, 0, buffer_get_size(target));
    return [0, result];
}
