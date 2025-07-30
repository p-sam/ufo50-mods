if(initialized) {
    initialized = false

    ds_queue_destroy(requestIdQueue)
    ds_map_destroy(requests)
    ds_map_destroy(clientSockets)

    if(serverSocket >= 0) {
        network_destroy(serverSocket)
        serverSocket = -1
    }
}
