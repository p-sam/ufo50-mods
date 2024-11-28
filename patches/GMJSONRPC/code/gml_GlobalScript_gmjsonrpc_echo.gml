function gmjsonrpc_echo(params) {
    var echo = ds_list_create();
    ds_list_copy(echo, params);
    return [ds_type_list, echo];
}