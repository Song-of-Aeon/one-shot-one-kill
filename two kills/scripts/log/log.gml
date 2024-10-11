///@function log(data[...]);
function log() {
	//return "";
	var r = string(argument[0]), i;
	for (i = 1; i < argument_count; i++) {
		r += ", " + string(argument[i]);
	}
	var stack = debug_get_callstack(10);
	//show_debug_message(stack);
	show_debug_message(string(current_time) + " : " + string(stack[1]) + " : " + r);
	//var p = new consoleEntry(r,c_black);
}
/*
var a = {};
for(var i = 0; i < 24; i++){
	a[$i] = i;
}

for(var i = 0; i < 24; i++){
	log(a[$i]);	
}*/
//log(a[$4])