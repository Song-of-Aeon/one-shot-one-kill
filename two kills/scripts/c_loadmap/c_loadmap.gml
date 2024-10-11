function c_loadmap(map_) {
	//log(map_);
	with all {
		if !persistent kys;
	}
	var dissolve = false;
	if !instance_exists(o_mapper) {
		instance_create(-10, -10, o_mapper);
		dissolve = true;
	}
	with o_mapper {
		guys = [];
		enemies = [];
		triggers = [];
		iterate map_.guys to { //bro just store their damn names
			
			/*if typeof(map_.guys[i].sprite) == "string" {
				map_.guys[i].sprite = asset_get_index(map_.guys[i].sprite);
			}
			if typeof(map_.guys[i].step) == "string" {
				map_.guys[i].step = script_get_index(map_.guys[i].step);
			}
			if typeof(map_.guys[i].draw) == "string" {
				map_.guys[i].draw = script_get_index(map_.guys[i].draw);
			}
			if typeof(map_.guys[i].ontouch) == "string" {
				map_.guys[i].ontouch = script_get_index(map_.guys[i].ontouch);
			}
			if typeof(map_.guys[i].onstay) == "string" {
				map_.guys[i].onstay = script_get_index(map_.guys[i].onstay);
			}
			if typeof(map_.guys[i].onleave) == "string" {
				map_.guys[i].onleave = script_get_index(map_.guys[i].onleave);
			}*/
			var newman = deep_copy(map_.guys[i]);
			var chump = c_maketile(map_.guys[i].x, map_.guys[i].y, tl[map_.guys[i].tileset][map_.guys[i].index], newman.depth);
			
			chump.links = newman.links;
			//chump.depth = newman.depth;
			chump.thing = newman;
			array_push(guys, newman);
		}
		//log(guys);
		//log(map_.enemies);
	
		iterate map_.enemies to {
			log("enemize");
			var friend = en[$map_.enemies[i].name];
			map_.enemies[i].sprite = friend.sprite;
			map_.enemies[i].create = friend.create;
			map_.enemies[i].step = friend.step;
			map_.enemies[i].draw = friend.draw;
			/*if typeof(map_.enemies[i].sprite) == "string" {
				map_.enemies[i].sprite = asset_get_index(map_.enemies[i].sprite);
			}
			if typeof(map_.enemies[i].create) == "string" {
				log(map_.enemies[i].create, script_get_index(map_.enemies[i].create));
				map_.enemies[i].create = script_get_index(map_.enemies[i].create);
			}
			if typeof(map_.enemies[i].step) == "string" {
				log(map_.enemies[i].step, script_get_index(map_.enemies[i].step));
				map_.enemies[i].step = script_get_index(map_.enemies[i].step);
			}
			if typeof(map_.enemies[i].draw) == "string" {
				log(map_.enemies[i].draw, script_get_index(map_.enemies[i].draw));
				map_.enemies[i].draw = script_get_index(map_.enemies[i].draw);
			}*/
			var chump = c_spawnenemy(map_.enemies[i].x, map_.enemies[i].y, map_.enemies[i]);
			var newman = deep_copy(map_.enemies[i]);
			chump.links = newman.links;
			chump.depth = newman.depth;
			chump.variation = newman.variation;
			chump.thing = newman;
			array_push(enemies, newman);
			
		}
		//enemies = map_.enemies;
		//instance_create(10 tiles, 10 tiles, DEFINE);
		if !instance_exists(DEFINE) {
			instance_create(map_.spawn.x, map_.spawn.y, DEFINE);
		}
		iterate map_.triggers to {
			//c_spawnenemy(map_.enemies[i].x, map_.enemies[i].y, map_.enemies[i]).links = map_.enemies[i].links;
			log(map_.triggers[i]);
			chump = c_maketrigger(
				map_.triggers[i].x,
				map_.triggers[i].y,
				map_.triggers[i].x2,
				map_.triggers[i].y2,
				script_get_index(map_.triggers[i].enter),
				script_get_index(map_.triggers[i].stay),
				script_get_index(map_.triggers[i].leave),
				script_get_index(map_.triggers[i].step)
			);
			chump.target = map_.triggers[i].target;
			chump.targetx = map_.triggers[i].targetx;
			chump.targety = map_.triggers[i].targety;
			array_push(triggers, chump);
		}
		global.currentmap = map_;
		global.currentbackground = global.backgrounds[$map_.bg];
		global.currentspawn = map_.spawn;
	}
	if dissolve instance_destroy(o_mapper);
}