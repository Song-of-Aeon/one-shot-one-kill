function c_dontstopslide() {
	var dude = collision_point(x, y-4, o_solid, false, false);
	
	if dude != noone {
		return false;
		log(x, y, dude.x, dude.y);
	} else return true;
}