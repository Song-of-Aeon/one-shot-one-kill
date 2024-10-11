function c_input() {
	var i;
	var inputs = variable_struct_get_names(global.inputs);
	for (i=0; i<array_length(inputs); i++) {
		global.inputs[$inputs[i]].update();
		set_value(self, inputs[i], global.inputs[$inputs[i]]);
	}
	
	//these guys are compounds that are per-instance of c_input
	select = jump.hit;
	back = attack.hit;
	undo = ctrl.hold & zed.hit;
	wep = [wp1, wp2, wp3];
}

function c_inputload() {
	nu kinput("left", [vk_left, "A"]);
	nu kinput("down", [vk_down, "S"]);
	nu kinput("up", [vk_up, "W"]);
	nu kinput("right", [vk_right, "D"]);
	
	nu kinput("jump", [vk_space, vk_up, "C", vk_enter]);
	var annoying = false;
	if annoying {
		var letters = [];
		var i;
		for (i=ord("A"); i<=ord("z"); i++) {
			array_push(letters, i);
		}
		nu kinput("attack", letters);
	} else {
		nu kinput("attack", [mb_left, "X"]);
	}
	nu kinput("reload", ["R"]);
	nu kinput("shift", [vk_shift]);
	nu kinput("inventory", ["Q"]);
	nu kinput("debug", ["G"]);
	//let c stick control mouse
	
	nu kinput("alt", [mb_right]);
	nu kinput("altwep", ["E"]);
	nu kinput("slam", [vk_control, "S"]);
	nu kinput("dash", [vk_shift]);
	nu kinput("punch", ["W"]);
	
	nu kinput("wp1", ["1", "Q"]);
	nu kinput("wp2", ["2"]);
	nu kinput("wp3", ["3"]);
	
	nu kinput("ctrl", [vk_control]);
	nu kinput("zed", ["Z"]);
	nu kinput("yed", ["Y"]);
	nu kinput("skip", [vk_control, gp_select]);
	nu kinput("null", []);
}

function kinput(name_, keys_) constructor {
	name = name_;
	key = keys_;
	hit = 0;
	hold = 0;
	drop = 0;
	update = function() {
		var i;
		hit = false;
		hold = false;
		drop = false;
		for (i=0; i<array_length(key); i++) {
			hit |= input_active(key[i], INPUT.PRESSED);
			hold |= input_active(key[i], INPUT.HELD);
			drop |= input_active(key[i], INPUT.RELEASED);
		}
	}
	global.inputs[$name] = self;
}

global.inputs = {};
c_inputload();



/*update = function() {
	if typeof(key) == "string" {
		hit = (hit+keyboard_check_pressed(ord(key)))*keyboard_check_pressed(ord(key));
		hold = (hold+keyboard_check(ord(key)))*keyboard_check(ord(key));
		drop = (drop+!(keyboard_check(ord(key))))*(!keyboard_check(ord(key)));
	} else {
		hit = (hit+keyboard_check_pressed(key))*keyboard_check_pressed(key); //if you can somehow hit two in a row. for buffering, maybe?
		hold = (hold+keyboard_check(key))*keyboard_check(key);
		drop = (drop+!(keyboard_check(key)))*(!keyboard_check(key)); //released is a joke
	}
}*/
	
	//problem: things will go twice as fast if multiple c_inputs at running at once
	//solution: the things increasing over one are an extreme edge case to begin with and you probably arent worrying about them when you have multiple controllables, if that is ever a good idea