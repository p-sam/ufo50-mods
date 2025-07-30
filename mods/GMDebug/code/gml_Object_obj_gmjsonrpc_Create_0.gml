initialized = false;

if(instance_number(object_index) > 1) {
    instance_destroy();
    exit;
}

expectedJsonrpcVersion = "2.0"
maxClients = 32
wsPort = 64325
serverSocket = network_create_server_raw(6, wsPort, maxClients); // network_socket_ws => 6
if (serverSocket < 0) {
    show_error("Error creating debug server", false);
    instance_destroy();
    exit;
}

clientSockets = ds_map_create();
requestIdQueue = ds_queue_create();
requests = ds_map_create();

initialized = true;
