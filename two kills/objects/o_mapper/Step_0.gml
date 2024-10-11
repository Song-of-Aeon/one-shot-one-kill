c_input();

if !array_length(history) && surface_exists(application_surface) {
	//c_pushhistory("initialized");
	//created = true;
}

if reload.hit {
	typing = !typing;
}
global.currentbackground = bg;
c
if ncm(60 sec) && array_length(guys) {
	c_saveroom(roomname+"autosave");
	//c_loadroom(roomname+"autosave");
}
mousepos.x = mouse_x;
mousepos.y = mouse_y;

//if shift.hit log(guys);

if ctrl.hold && zed.hit {
	undo();
}
if ctrl.hold && yed.hit {
	redo();
}

if shift.hold {
	//log(x, y);
	camera_set_view_target(view_camera[0], id);
	camera_set_view_border(view_camera[0], 512, 288);
	x = clamp(x+right.hold*4-left.hold*4, WIDTH/2, roomsize.x);
	y = clamp(y+down.hold*4-up.hold*4, HEIGHT/2, roomsize.y);
	//x += right.hold*2;
	
	//x += 2;
} else {
	if typing {
		selectedtype = mod_negative(selectedtype+right.hit-left.hit, array_length(menuoptions));
	} else {
		try {
			menuoptions[selectedtype].pos = cycle(menuoptions[selectedtype].pos+down.hit-up.hit, array_length(menuoptions[selectedtype].options));
			menuoptions[selectedtype].opos[menuoptions[selectedtype].pos] = cycle(menuoptions[selectedtype].opos[menuoptions[selectedtype].pos]+right.hit-left.hit, array_length(menuoptions[selectedtype].options[menuoptions[selectedtype].pos]));
			menuoptions[selectedtype].step();
		} catch(e) {
			log(e);
			log("oopsie!");
		}
	}
}


exit;











//selectedtype = mod_negative(selectedtype+down.hit-up.hit, array_length(types));

//selecteddata = mod_negative(selecteddata+right.hit-left.hit, array_length(datas[selectedtype]));
/*selectionzone = mod_negative(selectionzone+down.hit-up.hit, array_length(datas[0][selector[0]]));
selector[selectionzone] = mod_negative(selector[selectionzone]+right.hit-left.hit, array_length(datas[selector[0]]));

switch selector[0] {
	case o_solid:
		//datas[]
}
*/

if jump.hold {
	roomsize.x = selector[2][0] tiles;
	roomsize.y = selector[2][1] tiles;
	x = clamp(x+(mouse_x-mousepos.x), 160, roomsize.x-160);
	y = clamp(y+(mouse_y-mousepos.y), 120, roomsize.y-120);
	mousepos.x = mouse_x;
	mousepos.y = mouse_y;
	//x += 2;
}

if !typing {
	switch selectedtype {
		case 0:
			if attack.hold {
				var dude = collision_point(c_tilequantizeval(mouse_x), c_tilequantizeval(mouse_y), o_solid, false, false);
				if dude != noone {
					instance_destroy(dude);
				}
				var chump = c_maketile(mouse_x, mouse_y, tl[$datas[selectedtype][selecteddata][selector[selectedtype][selecteddata]]]);
				log(chump.type);
				array_push(guys, chump);
	
			}
			if inventory.hold {
				var dude = collision_point(c_tilequantizeval(mouse_x), c_tilequantizeval(mouse_y), o_solid, false, false);
				if dude != noone {
					instance_destroy(dude);
				}
			}
			break;
		case 1:
			if attack.hit {
				//mydude = instance_create(mouse_x, mouse_y, o_trigger);
				mydude = c_maketrigger(mouse_x, mouse_y, mouse_x, mouse_y);
				mydude.target = mp[datas[selectedtype][0][selector[selectedtype][0]]].maproom;
				mydude.targetx = datas[selectedtype][1][selector[selectedtype][1]] tiles;
				mydude.targety = datas[selectedtype][2][selector[selectedtype][2]] tiles;
				c_tilequantize(mydude, -8, -8);
				array_push(guys, mydude);
			}
			if attack.hold {
				mydude.x2 = c_tilequantizeval(mouse_x, -8);
				mydude.y2 = c_tilequantizeval(mouse_y, -8);
			}
			if inventory.hold {
				var dude = collision_point(c_tilequantizeval(mouse_x, -8), c_tilequantizeval(mouse_y, -8), o_trigger, false, false);
				if dude != noone {
					instance_destroy(dude);
				}
			}
			break;
		case 3:
			if attack.hit {
				room_goto(mp[datas[selectedtype][0][selector[selectedtype][0]]].maproom);
				selector[2][0] = room_width/(1 tiles);
				selector[2][1] = room_height/(1 tiles);
				x = 160;
				y = 120;
				typing = !typing;
				instance_destroy(DEFINE);
			}
			break;
		case 4:
			//room_goto(mp[sky_corridor].maproom);
			//room_goto(mp[coinroom].maproom);
			room_goto(coinroom);
			o_mapmanager.currentmap = coinroom;
			instance_destroy();
			break;
	}

	if debug.hit {
		c_saveroom(get_string("", ""));
		log("did it");
	}
}

if undo {
	instance_destroy(array_pop(guys));
}



if typing {
	selectedtype = mod_negative(selectedtype+right.hit-left.hit, array_length(types));
} else {
	selecteddata = mod_negative(selecteddata+down.hit-up.hit, array_length(datas[selectedtype]));
	selector[selectedtype][selecteddata] = mod_negative(
		selector[selectedtype][selecteddata]+(right.hit-left.hit)*(1+shift.hold*4),
		array_length(datas[selectedtype][selecteddata])
	);
}