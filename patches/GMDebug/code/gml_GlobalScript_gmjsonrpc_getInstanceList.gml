function gmjsonrpc_getInstanceList() {
    var result = ds_map_create();

    for (var i=0; i< instance_count; i++) {
        var instance = ds_map_create();
        var instanceId = instance_id[i];
        with (instanceId) {
            // get ancestry
            var objectList = ds_list_create();
            ds_list_add(objectList, object_get_name(object_index));
        
            for (var parent = object_get_parent(object_index); parent >= 0; parent = object_get_parent(parent)) {
                ds_list_add(objectList, object_get_name(parent));	
            }
        
            ds_map_add_list(instance, "object", objectList);
        
            if(layer != -1) {
                var layer_name = layer_get_name(layer);
                if(layer_name != "") {
                    ds_map_add(instance, "layer", layer_name);
                }
                else {
                    ds_map_add(instance, "layer", layer);
                }
            }
            ds_map_add(instance, "depth", depth);
        }
        ds_map_add_map(result, string(instanceId), instance);
    }

    return [ds_type_map, result];
}
