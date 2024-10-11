gc++;
if !surface_exists(global.surfaces.HUD) {
	global.surfaces.HUD = surface_create(WIDTH, HEIGHT);
}

if keyboard_check_pressed(vk_f1) {
	if instance_exists(o_mapper) {
		instance_destroy(o_mapper);
		//log("enemied");
		with o_enemy {
			step = archetype.step;
		}
	} else {
		instance_create(-1, -1, o_mapper);
		c_loadmap(global.currentmap);
		instance_destroy(DEFINE);
		with o_enemy {
			step = c_null;
		}
		with o_mapper {
			roomname = global.currentmap.roomname;
			roomsize = global.currentmap.roomsize;
			//guys = friend.guys;
			//enemies = friend.enemies;
			//triggers = friend.triggers;
			spawn = global.currentmap.spawn;
			bg = global.backgrounds[$global.currentmap.bg];
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