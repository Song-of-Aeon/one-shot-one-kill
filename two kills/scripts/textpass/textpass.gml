function textpass(teventarray=tevents) {
	var j;
	for (j=1; j<=i; j++) {
		if teventarray[j].textmod != c_null {
			//show_debug_message(color);
			method(id, teventarray[j].textmod)(teventarray[j].argstr);
		}
	}
	textpos.x += wiggle.x+shake.x;
	textpos.y += wiggle.y+shake.y;
}
function textass(teventarray=tevents) {
	var j;
	for (j=1; j<array_length(teventarray); j++) {
		if teventarray[j].textmod != c_null {
			//show_debug_message("here");
		}
	}
}


function charspecial(char_, x_, y_) constructor {
	char = char_;
	x = x_;
	y = y_;
}