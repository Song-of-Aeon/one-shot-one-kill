function c_bang(x, y, direction, width, delay, duration, type, color=c_black, behavior=c_null, draw=NUMBER5) {
	var chump = instance_create(x, y, o_hitscan);
	//log(layer_get_id("instances"));
	chump.dir = direction;
	chump.direction = chump.dir;
	chump.width = width;
	chump.delay = delay;
	chump.duration = duration;
	chump.type = type;
	chump.spd = 1;
	chump.color = color;
	with chump {
		sprite_index = type.sprite;
		damage = type.damage;
		destructible = type.destructible;
		friendly = type.friendly;
		alpha = type.alpha;
		onhit = type.onhit;
		if type.colorable {
			colorcover = asset_get_index(string(sprite_get_name(sprite_index)) + "cc");
		} else {
			colorcover = s_null;
		}
	}
	
	chump.behaviors = method(undefined, behavior);
	chump.draws = method(undefined, draw);
	return chump;
}