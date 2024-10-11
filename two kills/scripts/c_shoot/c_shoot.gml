function c_shoot(x, y, speed, direction, type, color=c_white, behavior=c_null, draw_=u/*, additive=false*/) {
	//var chump = instance_create_layer(x, y, layer_get_id(!additive ? "bullets" : "bullets_add"), o_bullet);
	var chump = instance_create(x, y, o_bullet);
	//var chump = instance_create_layer(x, y, layer_get_id("bullets_add"), o_bullet);
	//log(layer_get_id("instances"));
	//log(part_type_direction());
	chump.spd = speed;
	chump.dir = direction;
	chump.type = type;
	chump.color = color;
	
	with chump {
		//log(type);
		sprite_index = type.sprite;
		friendly = type.friendly;
		zfriendly = friendly;
		//image_blend = type.colour;
		damage = type.damage;
		destructible = type.destructible;
		alpha = type.alpha;
		rotate = type.rotate;
		colorable = type.colorable;
		onhit = method(global.me, type.onhit);
		if type.colorable {
			colorcover = asset_get_index(string(sprite_get_name(sprite_index)) + "cc");
		} else {
			colorcover = s_null;
		}
		image_angle = direction-90;
	}
	if draw_ == u {
		chump.draws = munction(type.draw);
	} else {
		chump.draws = munction(draw_);
	}
	var disting = distabs(chump.dir+180,10);
	chump.xprevious -= disting.x;
	chump.yprevious -= disting.y;
	//event_typele
	/*if !global.shootsound {
		log("among");
		se_play(snd_shoot);
		global.shootsound = 8;
	} else {
		log("us");
		global.shootsound -= .1;
	}*/
	if behavior == c_null {
		chump.simple = true;
	} else {
		chump.behaviors = method(undefined, behavior);
	}
	chump.directioning = true;
	
	return chump;
}

function c_shootcircle(x, y, speed, origindirection, density, bullettype, color=c_black, behavior=NUMBER5, draw=u, distance=0) {
	var i;
	var bulletcount = 0;
	var bullets = [];
	
	for (i=0; i<360; i+=360/density) {
		var distguy = distabs(origindirection+i, distance);
		var chump = c_shoot(x+distguy.x, y+distguy.y, speed, origindirection+i, bullettype, color, behavior, draw);
		chump.directioning = true;
		bullets[bulletcount] = chump;
		bulletcount++;
	}
	return bullets;
}
function c_shootfan(x, y, speed, startdirection, enddirection, amount, offsetamount, bullettype, color=c_black, behavior=NUMBER5, draw=u) {
	var i;
	var bulletcount = 0;
	var bullets = [];
	//offsetamount = speed;
	//var maxbulletcount = abs(startdirection-enddirection);
	var iterations = 0;
	for (i=0; i<amount; i++) {
		var theDir = lerp(startdirection,enddirection,i/amount);
		var fartin = (i/amount)*offsetamount;
		
		var chump = c_shoot(x-dcos(theDir)*fartin, y+dsin(theDir)*fartin, speed, theDir, bullettype, color, behavior, draw, additive);
		chump.directioning = true;
		
		bullets[bulletcount] = chump;
		bulletcount++;
		iterations++;
	}
	return bullets;
}