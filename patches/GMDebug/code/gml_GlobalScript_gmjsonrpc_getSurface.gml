function gmjsonrpc_getSurface(params) {
    var target = ds_list_find_value(params, 0);

    if(target == -1) {
        target = application_surface;
    }

    if(!surface_exists(target)) {
        return [-1, "Surface not found"];
    }

    var result = ds_map_create();

    var width = surface_get_width(target);
    var height = surface_get_height(target);
    ds_map_add(result, "width", width);
    ds_map_add(result, "height", height);

    var tmp_filename = "gmdebug_tmp_surface_"+string(target)+"_"+string(irandom(0x7fffffff))+".png";
    surface_save(target, tmp_filename);
    var buff = buffer_load(tmp_filename);

    ds_map_add(result, "data", buffer_base64_encode(buff, 0, buffer_get_size(buff)))
    buffer_delete(buff);
    file_delete(tmp_filename);

    return [ds_type_map, result];
}
