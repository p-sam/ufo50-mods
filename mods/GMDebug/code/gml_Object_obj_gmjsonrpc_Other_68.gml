if(!initialized) {
    return;
}

var async_event_type = ds_map_find_value(async_load, "type");
var async_id = ds_map_find_value(async_load, "id");

if(async_id == serverSocket) {
    var async_socket = ds_map_find_value(async_load, "socket");
    if(async_event_type == network_type_connect || async_event_type == network_type_non_blocking_connect) {
        ds_map_add(clientSockets, string(async_socket), async_socket);
        show_debug_message("gmdebug: connected: "+string(async_socket));
    } else if(async_event_type == network_type_disconnect) {
        if(ds_map_exists(clientSockets, string(async_socket))) {
            ds_map_delete(clientSockets, string(async_socket));
        }
        show_debug_message("gmdebug: disconnected: "+string(async_socket));
    }
    return;	
}

if(async_event_type != network_type_data) {
    return;
}

var clientSocket = async_id;
if(!ds_map_exists(clientSockets, string(clientSocket))) {
    return;
}
if(ds_map_find_value(async_load, "message_type") != 2) {  // network_send_text = 2
    return;
}

var req = json_decode(buffer_read(ds_map_find_value(async_load, "buffer"), buffer_text));

if(!ds_exists(req, ds_type_map)) {
    show_debug_message("gmdebug: bad json");
    return;
}

var jsonrpcVersion = ds_map_find_value(req, "jsonrpc");
if(!is_string(jsonrpcVersion) || jsonrpcVersion != expectedJsonrpcVersion) {
    show_debug_message("gmdebug: bad jsonrpc ver");
    ds_map_destroy(req);
    return;
}

var reqId = ds_map_find_value(req, "id");
if(!is_string(reqId)) {
    show_debug_message("gmdebug: bad req id");
    ds_map_destroy(req);
    return;	
}

if(ds_map_exists(requests, reqId)) {
    show_debug_message("gmdebug: already queued req for this id");
    ds_map_destroy(req);
    return;	
}

ds_map_add(req, "_clientSocket", clientSocket);
ds_map_add(requests, reqId, req);
ds_queue_enqueue(requestIdQueue, reqId);
