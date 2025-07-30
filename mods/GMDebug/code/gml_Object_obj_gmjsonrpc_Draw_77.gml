if(!initialized) {
    return;
}

while(!ds_queue_empty(requestIdQueue)) {
    var reqId = ds_queue_dequeue(requestIdQueue);
    if(!ds_map_exists(requests, reqId)) {
        show_debug_message("gmdebug: request gone");
        return;
    }

    var req = ds_map_find_value(requests, reqId);
    ds_map_delete(requests, reqId);
    var clientSocket = ds_map_find_value(req, "_clientSocket");

    var response = ds_map_create();
    var result = [0, pointer_null];

    ds_map_add(response, "jsonrpc", expectedJsonrpcVersion);
    ds_map_add(response, "id", reqId);

    var params;
    if(ds_map_exists(req, "params") && ds_map_is_list(req, "params")) {
        params = ds_map_find_value(req, "params");
    } else {
        params = ds_list_create();
    }

    var methodName = ds_map_find_value(req, "method");
    show_debug_message("gmdebug: request with id: "+reqId+" method: "+string(methodName));

    var globalMethodName = "gmjsonrpc_"+string(methodName);
    if(!is_string(methodName) || !variable_global_exists(globalMethodName)) {
        result = [-99, "bad method"];
    } else {
        var methodHandler = variable_global_get(globalMethodName);
        result = script_execute(methodHandler, params, id);
    }

    if(!is_array(result) || array_length(result) != 2) {
        result = [-98, "bad result format"];
    }

    switch(result[0]) {
        case 0:
            ds_map_add(response, "result", result[1]);
            break;
        case ds_type_list:
            ds_map_add_list(response, "result", result[1]);
            break;
        case ds_type_map:
            ds_map_add_map(response, "result", result[1]);
            break;
        default:
            var error = ds_map_create();
            ds_map_add(error, "code",  int64(result[0]));
            ds_map_add(error, "message", string(result[1]));
            ds_map_add_map(response, "error", error);
    }

    jsonBuffer = buffer_create(256, buffer_grow, 1);
    buffer_write(jsonBuffer, buffer_text, json_encode(response));
    network_send_raw(clientSocket, jsonBuffer, buffer_tell(jsonBuffer), 2); // network_send_text = 2

    buffer_delete(jsonBuffer);
    ds_map_destroy(response);
    ds_map_destroy(req);
    ds_list_destroy(params);
}
