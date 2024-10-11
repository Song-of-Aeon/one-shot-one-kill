function scriptable_create(step=NUMBER5, draw=NUMBER5, layer_="instances") {
	var chump = instance_create(0, 0, o_, layer_);
	chump.step = munction(step);
	chump.draw = munction(draw);
	return chump;
}

function scriptable_of(object, step=NUMBER5, draw=NUMBER5) {
	var chump = instance_create(object.x, object.y, o_, object.layer)
	chump.sprite_index = object.sprite_index;
	chump.x = object.x;
	chump.y = object.y;
	chump.image_index = object.image_index;
	chump.image_speed = object.image_speed;
	chump.direction = object.direction;
	chump.speed = object.speed;
	chump.image_xscale = object.image_xscale;
	chump.image_yscale = object.image_yscale;
	chump.image_angle = object.image_angle;
	try {
		chump.spd.h = object.spd.h;
		chump.spd.v = object.spd.v;
	}
	return chump;
}

#macro c_makeimpostor scriptable_of