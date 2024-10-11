if place_meeting(x, y, o_solid) instance_destroy();
var dude = noone;
collidedbullets = ds_list_create();
owlist = collision_circle_list(x, y, 3, o_hitscan, false, false, collidedbullets, false);
for (i=0; i<owlist; i++) {
	ow = collidedbullets[|i];
	if !array_length(ow.hitlist) {
		dude = ow;
		break;
	}
}
if dude {
	if array_length(dude.hitlist) exit else array_push(dude.hitlist, id);
	/*with dude {
		var dude2 = distabs(dir, size);
		while collision_line(x, y, x+dude2.x, y+dude2.y, o_, true, false) {
			size--;
			image_yscale = size/sprite_get_height(sprite_index);
			if !size instance_destroy();
			dude2 = distabs(dir, size);
		}
		image_yscale = size/sprite_get_height(sprite_index);
	}*/
	
	
	
	var myguy;
	var dudes = collision_circle(x, y, 999, o_coin, false, true);
	myguy = {x: irandom(room_width), y: irandom(room_height)};
	if instance_exists(o_enemy) myguy = instance_nearest(x, y, o_enemy);
	if dudes != noone {
		log(dudes.x, dudes.y);
		myguy = dudes;
		array_push(ow.hitlist, id);
	}
	var laz = c_bang(x, y, point_direction(x, y, myguy.x, myguy.y), 4, 0, 20, hsn.normal, c_yellow, function() {
		width -= .5;
	});
	//laz.size = point_distance(x, y, myguy.x, myguy.y);
	laz.damage = dude.damage*1.5;
	log(laz.damage, dude.damage);
	laz.friendly = true;
	laz.width = dude.width*1.5;
	laz.multihit = dude.multihit;
	dude.size = point_distance(dude.x, dude.y, x, y);
	instance_destroy();
}
spd.v += .07;
x += spd.h;
y += spd.v;