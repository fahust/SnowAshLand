//if (ds_exists(async_load, 'type')){
if (ds_exists(async_load,ds_type_map)){
if (ds_map_find_value(async_load,'type') == network_type_data)
{
if (ds_map_exists(async_load,"buffer")){
var tempbuf = ds_map_find_value(async_load,"buffer");
var tempstr = buffer_read(tempbuf,buffer_text);

buffer_delete(tempbuf);
    while (string_pos(global.splitter,tempstr))
    {
    var otherstr = string_copy(tempstr,0,string_pos(global.splitter,tempstr)-1);
    otherstr = json_decode(otherstr);
    tempstr = string_delete(tempstr,1,string_pos(global.splitter,tempstr)+string_length(global.splitter)-1);
    
    if ds_exists(global.listener,ds_type_map) {
    if ds_exists(otherstr,ds_type_map) {
    //if is_undefined(otherstr[? "identify"]) {}else{
    if (ds_map_exists(global.listener,otherstr[? "identify"]))
    {
    var currentdata = otherstr[? otherstr[? "identify"]];
    script_execute(global.listener[? otherstr[? "identify"]],otherstr[? "identify"],currentdata);
        if (ds_exists(currentdata,ds_type_map))
        {
        ds_map_destroy(currentdata);
        }
    }
    //}
    }}else{global.listener = ds_map_create();
    }
    if ds_exists(otherstr,ds_type_map) {
    ds_map_destroy(otherstr);
    }}
}}

}





