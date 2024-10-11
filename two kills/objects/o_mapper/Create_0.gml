camera_set_view_target(view_camera[0], self);
camera_set_view_border(view_camera[0], 144, 256);

actionnum = 0;
historycap = 30;
undone = 0;
history = [];
historynames = [];
future = [];
futurenames = [];

instance_create(0, 0, o_mapmanager);

xdraw = 20;
ydraw = 20;
elementxdraw = 40;
elementydraw = 40;



menuoptions = [
/*new mapsetting("daft settings", [["work it", "make it", "do it", "makes us"], ["harder", "better", "faster", "stronger"]], function() {
	
}, function() {
	draw_text(40, 40, options[0][opos[0]]);
	draw_text(40, 60, options[1][opos[1]]);
}),*/
new mapsetting("tiles", [tl, ["lol"], ["background", "behind", "main", "front", "foreground"]], function() {
	statish("tilecount", 0);
	palette = new vec2(WIDTH*1.665, HEIGHT*.4);
	c_input();
	options[1] = tl[opos[0]];
	if !array_length(options[2]) exit;
	if mouse_within(palette.x, palette.y, WIDTH*2, HEIGHT*2) exit;
	if attack.hit {
		c_pushhistory("placed tiles");
	}
	if attack.hold {
		var thelist = ds_list_create();
		var dude = collision_point_list(c_tilequantizeval(mouse_x), c_tilequantizeval(mouse_y), o_notsolid, false, false, thelist, false);
		var i;
		for (i=0; i<dude; i++) {
			//log(i);
			////log(thelist[|i].depth, opos[2]);
			if thelist[|i].depth == opos[2] {
				////log("deleting");
				array_remove(o_mapper.guys, thelist[|i].thing);
				instance_destroy(thelist[|i]);
				////log("deleted");
			}
		}
		ds_list_destroy(thelist);
		var thing = deep_copy(options[1][opos[1]]);
		////log(thing);
		var chump = c_maketile(mouse_x, mouse_y, thing, opos[2]);
		chump.thing = thing;
		//chump.depth = opos[2];
		thing.x = mouse_x;
		thing.y = mouse_y;
		thing.y = mouse_y;
		thing.links = [];
		thing.depth = opos[2];
		array_push(o_mapper.guys, thing);
	}
	if inventory.hit {
		c_pushhistory("removed tiles");
	}
	if inventory.hold {
		var thelist = ds_list_create();
		var dude = collision_point_list(mouse_x, mouse_y, o_notsolid, false, false, thelist, false);
		var i;
		for (i=0; i<dude; i++) {
			////log(thelist[|i].depth, opos[2]);
			if thelist[|i].depth == opos[2] {
				////log("deleting");
				array_remove(o_mapper.guys, thelist[|i].thing);
				instance_destroy(thelist[|i]);
				////log("deleted");
			}
		}
		ds_list_destroy(thelist);
	}
}, function() {
	var z=0;
	//draw_set_alpha((pos==z++)+.4);
	draw_set_color(pos==z++ ? c_white : c_aolu);
	draw_text(xdraw, ydraw+z*interval, opos[0]);
	////log(xdraw, ydraw);
	draw_set_alpha(1);
	if !array_length(options[1]) exit;
	//draw_set_alpha();
	var thing = options[1][opos[1]];
	//log(tl[TILESET.TOWER]);
	//log(thing);
	//var friend2 = cycle(opos[1]-1, array_length(options[1]));
	//var friend3 = cycle(opos[1]+1, array_length(options[1]));
	//var thing2 = options[1][friend2];
	//var thing3 = options[1][friend3];
	draw_sprite_ext(thing.sprite, thing.index, xdraw+sprite_get_width(thing.sprite)/2*2, ydraw+sprite_get_height(thing.sprite)/2*2+z*interval, 2, 2, 0, c_white, (pos==z++)+.4);
	//draw_sprite_ext(thing2.sprite, thing2.index, xdraw-20, ydraw+40, 2, 2, 0, c_white, .4);
	//draw_sprite_ext(thing3.sprite, thing3.index, xdraw+20, ydraw+40, 2, 2, 0, c_white, .4);
	//draw_set_alpha((pos==z++)+.4);
	draw_set_alpha(1);
	draw_set_color(pos==z++ ? c_white : c_aolu);
	draw_text(xdraw, ydraw+z*interval, options[2][opos[2]]);
	draw_set_alpha(1);
	if !mouse_within(palette.x, palette.y, WIDTH*2, HEIGHT*2) draw_set_alpha(.4);
	var rowamount = 10;
	iterate options[1] to {
		draw_sprite(global.tssprites[opos[0]], i, palette.x+i%rowamount*16+8, palette.y+floor(i/rowamount)*16+8);
		if mouse_within(palette.x+i%rowamount*16, palette.y+floor(i/rowamount)*16, palette.x+i%rowamount*16+16, palette.y+floor(i/rowamount)*16+16) && attack.hit {
			opos[1] = i;
		}
	}
	draw_circle(window_mouse_get_x(), window_mouse_get_y(), 3, false);
}),
new mapsetting("entities", [["enemies"], ["lol"], ["enabled", "disabled"]], function() {
	c_input();
	options = [options[0], variable_struct_get_names(en)];
	if attack.hit {
		c_pushhistory("placed entity");
		var thelist = ds_list_create();
		var dude = collision_point_list(mouse_x, mouse_y, o_enemy, false, false, thelist, false);
		var i;
		for (i=0; i<dude; i++) {
			////log("deleting");
			array_remove(o_mapper.enemies, thelist[|i].thing);
			instance_destroy(thelist[|i]);
			////log("deleted");
		}
		ds_list_destroy(thelist);
		var thing = deep_copy(en[$options[1][opos[1]]]);
		//log(thing);
		var chump = c_spawnenemy(mouse_x, mouse_y, thing);
		chump.step = c_null;
		chump.thing = thing;
		chump.image_speed = 0;
		thing.x = mouse_x;
		thing.y = mouse_y;
		thing.links = [];
		//log(thing);
		array_push(o_mapper.enemies, thing);
		
	}
	if inventory.hit {
		c_pushhistory("removed entities");
	}
	if inventory.hold {
		var thelist = ds_list_create();
		var dude = collision_point_list(mouse_x, mouse_y, o_enemy, false, false, thelist, false);
		var i;
		for (i=0; i<dude; i++) {
			//log("deleting");
			array_remove(o_mapper.enemies, thelist[|i].thing);
			instance_destroy(thelist[|i]);
			//log("deleted");
		}
		ds_list_destroy(thelist);
	}
}, function() {
	var z=0;
	//draw_set_alpha((pos==z++)+.4);
	draw_set_color(pos==z++ ? c_white : c_aolu);
	draw_text(xdraw, ydraw+z*interval, options[0][opos[0]]);
	var thing = en[$options[1][opos[1]]];
	draw_set_alpha((pos==z++)+.4);
	draw_sprite(thing.sprite, 0, xdraw, ydraw+60);
}),
new mapsetting("triggers", [["tra", "touch event", "set spawn"], variable_struct_get_names(mp), array_create_order(100), array_create_order(100)], function() {
	c_input();
	if !opos[0] {
		options[1] = variable_struct_get_names(mp);
		options[2] = array_create_order(100);
		options[3] = array_create_order(100);
		if attack.hit {
			c_pushhistory("placed tra");
			mydude = c_maketrigger(mouse_x, mouse_y, mouse_x, mouse_y, c_triggerwarp);
			mydude.target = options[1][opos[1]];
			mydude.targetx = options[2][opos[2]] tiles -1;
			mydude.targety = options[3][opos[3]] tiles -1;
			c_tilequantize(mydude, -8, -8);
			array_push(o_mapper.triggers, mydude);
		}
		if attack.hold {
			mydude.x2 = c_tilequantizeval(mouse_x, -8);
			mydude.y2 = c_tilequantizeval(mouse_y, -8);
		}
	} else if opos[0] == 1 {
		options[1] = [""];
		options[2] = [""];
		options[3] = [""];
		statish("myscript", c_null);
		if select {
			myscript = script_get_index(get_string("tell me a story.", script_get_name(myscript)));
		}
		if attack.hit {
			c_pushhistory("placed trigger");
			mydude = c_maketrigger(mouse_x, mouse_y, mouse_x, mouse_y, myscript);
			c_tilequantize(mydude, -8, -8);
			array_push(o_mapper.triggers, mydude);
		}
		if attack.hold {
			mydude.x2 = c_tilequantizeval(mouse_x, -8);
			mydude.y2 = c_tilequantizeval(mouse_y, -8);
		}
	} else if opos[0] == 2 {
		options[1] = [""];
		options[2] = [""];
		options[3] = [""];
		if attack.hit {
			c_pushhistory("placed spawnsetter");
			mydude = c_maketrigger(mouse_x, mouse_y, mouse_x, mouse_y, myscript);
			c_tilequantize(mydude, -8, -8);
			array_push(o_mapper.triggers, mydude);
		}
		if attack.hold {
			mydude.x2 = c_tilequantizeval(mouse_x, -8);
			mydude.y2 = c_tilequantizeval(mouse_y, -8);
		}
	}
	if inventory.hit {
		c_pushhistory("removed tras");
	}
	if inventory.hold {
		var thelist = ds_list_create();
		var dude = collision_point_list(mouse_x, mouse_y, o_trigger, false, false, thelist, false);
		var i;
		for (i=0; i<dude; i++) {
			log("deleting");
			array_remove(o_mapper.triggers, thelist[|i]);
			instance_destroy(thelist[|i]);
			log("deleted");
		}
		ds_list_destroy(thelist);
	}
}, function() {
	var z=0;
	draw_set_color(pos==z++ ? c_white : c_aolu);
	draw_text(xdraw, ydraw+z*interval, options[z-1][opos[z-1]]);
	draw_set_color(pos==z++ ? c_white : c_aolu);
	draw_text(xdraw, ydraw+z*interval, options[z-1][opos[z-1]]);
	draw_set_color(pos==z++ ? c_white : c_aolu);
	draw_text(xdraw, ydraw+z*interval, options[z-1][opos[z-1]]);
	draw_set_color(pos==z++ ? c_white : c_aolu);
	draw_text(xdraw, ydraw+z*interval, options[z-1][opos[z-1]]);
}),
new mapsetting("background", [variable_struct_get_names(global.backgrounds)], function() {
	c_input();
	//log(variable_struct_get_names(global.backgrounds));
	o_mapper.bg = global.backgrounds[$options[0][opos[0]]];
}, function() {
	var z=0;
	draw_set_color(pos==z++ ? c_white : c_aolu);
	draw_text(xdraw, ydraw+z*interval, options[0][opos[0]]);
}),
new mapsetting("map settings", [["name", "size", "spawn"], ["lol"], ["lol"]], function() {
	c
	c_input();
	if !opos[0] {
		if select {
			//log("ha");
			o_mapper.roomname = get_string("you fear this place.", o_mapper.roomname);
		}
		pos = 0;
		options[1] = [];
		options[2] = [];
	} else if opos[0] == 1 {
		options[1] = array_create_order(200, 1, 32);
		options[2] = array_create_order(200, 1, 18);
		o_mapper.roomsize.x = options[1][opos[1]] tiles;
		o_mapper.roomsize.y = options[2][opos[2]] tiles;
	} else {
		if attack.hold {
			o_mapper.spawn.x = c_tilequantizeval(mouse_x);
			o_mapper.spawn.y = c_tilequantizeval(mouse_y);
			options[1] = [];
			options[2] = [];
		}
		//options[1] = array_create_order(200, 1, 32);
		//options[2] = array_create_order(200, 1, 18);
		//o_mapper.spawn.x = options[1][opos[1]] tiles;
		//o_mapper.spawn.y = options[2][opos[2]] tiles;
	}
}, function() {
	var z=0;
	//draw_set_alpha((pos==z++)+.4);
	draw_set_color(pos==z++ ? c_white : c_aolu);
	draw_text(xdraw, ydraw+z*interval, options[0][opos[0]]);
	if !opos[0] {
		//draw_set_alpha((pos==z++)+.4);
		//draw_set_color(pos==z++ ? c_white : c_aolu);
		//draw_text(xdraw, ydraw+z*interval, o_mapper.roomname + (count%60 < 30 ? "|" : ""));
	} else if opos[0] == 1 {
		//draw_set_alpha((pos==z++)+.4);
		draw_set_color(pos==z++ ? c_white : c_aolu);
		draw_text(xdraw, ydraw+z*interval, options[1][opos[1]]);
		//draw_set_alpha((pos==z++)+.4);
		draw_set_color(pos==z++ ? c_white : c_aolu);
		draw_text(xdraw, ydraw+z*interval, options[2][opos[2]]);
	} else {
		//draw_set_alpha(.4);
		draw_set_color(c_aolu);
		draw_text(xdraw, ydraw+2*interval, o_mapper.spawn.x/global.tilesize);
		draw_text(xdraw, ydraw+3*interval, o_mapper.spawn.y/global.tilesize);
	}
	draw_set_alpha(1);
}),
new mapsetting("save", [["really save?"]], function() {
	c_input();
	if select {
		log("balling");
		with o_mapper {c_saveroom(roomname)};
		c_reloadmaps();
	}
}, function() {
	var z=0;
	draw_set_color(pos==z++ ? c_white : c_aolu);
	//draw_set_alpha((pos==z++)+.4);
	draw_text(xdraw, ydraw+z*interval, options[0][opos[0]]);
	draw_set_alpha(1);
}),
new mapsetting("load", [["edit mode", "play game"], variable_struct_get_names(mp)], function() {
	c_input();
	options[1] = variable_struct_get_names(mp);
	if select {
		var friend = mp[$options[1][opos[1]]];
		c_loadmap(friend);
		if opos[0] {
			instance_destroy(o_mapper);
			//log("enemied");
			with o_enemy {
				step = archetype.step;
			}
		} else {
			//log("unenemied");
			instance_destroy(DEFINE);
			with o_enemy {
				step = c_null;
			}
			with o_mapper {
				roomname = friend.roomname;
				roomsize = friend.roomsize;
				//guys = friend.guys;
				//enemies = friend.enemies;
				//triggers = friend.triggers;
				spawn = friend.spawn;
				bg = global.backgrounds[$friend.bg];
				created = false;
				actionnum = 0;
				historycap = 30;
				undone = 0;
				history = [];
				historynames = [];
				future = [];
				futurenames = [];
			}
		}
	}
}, function() {
	var z=0;
	//draw_set_alpha((pos==z++)+.4);
	draw_set_color(pos==z++ ? c_white : c_aolu);
	draw_text(xdraw, ydraw+z*interval, options[0][opos[0]]);
	//draw_set_alpha((pos==z++)+.4);
	draw_set_color(pos==z++ ? c_white : c_aolu);
	draw_text(xdraw, ydraw+z*interval, options[1][opos[1]]);
	draw_set_alpha(1);
	draw_spr(200, 200, mp[$options[1][opos[1]]].thumbnail);
}),
];

//menuoptions[3].opos[1] = 
count = 0;

roomsize = new vec2(512, 288);
roomname = "untitled";
bg = global.backgrounds.plain;


selectionzone = 0;
selectedtype = 0;
selecteddata = 0;

x = 160;
y = 120;

//datas = [[variable_struct_get_names(tl)], [array_get_indeces(mp)]];

//datas = [[o_solid, o_trigger]];

typing = true;
//log("NO GUYS");
guys = [];
enemies = [];
triggers = [];
spawn = new vec2(-1 tiles, -1 tiles);

mousepos = new vec2();

var friend = mp[$"sdm"];
//c_loadmap(friend);
//instance_destroy(o_mapper);
//log("enemied");
//with o_enemy {
	//step = archetype.step;
//}
//instance_create(10 tiles, 10 tiles, DEFINE);

created = false;




//c_loadmap(mp[$"lethal"]);
//kys;

exit;
datas[0] = [variable_struct_get_names(tl), [-2, -1, 0, 1, 2]];
datas[1] = [variable_struct_get_names(en)];
datas[1] = [array_get_indeces(mp), [], []];
datas[2] = [[], []];
datas[3] = [array_get_indeces(mp),];
datas[4] = [[""]];
var i;
for (i=0; i<100; i++) {
	array_push(datas[1][1], i);
	array_push(datas[1][2], i);
	array_push(datas[2][0], i);
	array_push(datas[2][1], i);
}

selector = [
	array_create(99),
	array_create(99),
	array_create(99),
	array_create(99),
	array_create(99),
]

selector[2][0] = 320/(1 tiles);
selector[2][1] = 240/(1 tiles);

//guys = [];

mousepos = new vec2();
roomsize = new vec2();
roomsize.x = selector[2][0] tiles;
roomsize.y = selector[2][1] tiles;
types = ["facetile", "enemies", "box trigger", "room size", "edit", "play"];






