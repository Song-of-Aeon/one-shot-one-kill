global.enemies = {};
function enemy(name_, sprite_, hp_,  step_=c_null, draw_=draw_self, create_=c_null) constructor {
	sprite = sprite_;
	hp = hp_;
	step = step_;
	draw = draw_;
	create = create_;
	name = name_;
	global.enemies[$name_] = self;
}

function c_spawnenemy(x, y, archetype) {
	log(archetype);
	var chump  = instance_create(x, y, o_enemy);
	chump.hp = archetype.hp;
	chump.name = archetype.name;
	chump.maxhp = archetype.hp;
	chump.sprite_index = archetype.sprite;
	chump.step = method(chump, archetype.step);
	chump.draw = method(chump, archetype.draw);
	chump.archetype = archetype;
	c_tilequantize(chump);
	return chump;
}



nu enemy("impostor", s_if_you, 100);
nu enemy("spawnpoint", s_v1, 9999, c_spawnpointstep);

function c_spawnpointstep() {
	log("ha ha");
	if !instance_exists(DEFINE) {
		instance_create(x, y, DEFINE);
	} else {
		DEFINE.x = x;
		DEFINE.y = y;
	}
	kys;
}

//everybody wants to be
//my enemy