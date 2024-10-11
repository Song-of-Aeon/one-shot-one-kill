function script_get_index(name){
    return global.scriptnames[$name]
}
global.scriptnames = {}
for(var i = 0; ;i++){ //track all builtins
    if(script_get_name(i) == "<unknown>")
        break; 
    if(string_starts_with(script_get_name(i),"@@"))
        continue;
    else
        global.scriptnames[$script_get_name(i)] = i;
}
for(var i = 100000; ; i++){ //track all user defineds
    if(script_get_name(i) == "<undefined>")
        break;
    if(string_starts_with(script_get_name(i),"@@"))
        continue;
    else
        global.scriptnames[$script_get_name(i)] = i;
}