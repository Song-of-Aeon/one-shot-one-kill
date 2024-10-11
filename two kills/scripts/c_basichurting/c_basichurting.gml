function c_basichurting(friendly=true) {
	collidedbullets = ds_list_create();
	if friendly {
		owlist = collision_circle_list(x, y, hitboxradius, o_bullet, false, false, collidedbullets, false);
	} else {
		owlist = collision_rectangle_list(bbox_left, bbox_top, bbox_right, bbox_bottom, o_bullet, false, false, collidedbullets, false);
	}
	for (i=0; i<owlist; i++) {
		ow = collidedbullets[|i];
		if ow != noone && ow.friendly == friendly && !ow.intangible {
			//c_bleed(x,y,35,ow.dir);
			method(id, ow.onhit)();
			//c_bleed(x,y,10,ow.dir);
		}
	}
}