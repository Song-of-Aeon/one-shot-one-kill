nu enemy("stray", s_mordy, 4, function() {
	var closeness = point_distance(x, y, df.x, df.y);
	if closeness < 40 && x < df.x && walktime < 90 {
		if place_meeting(x-12, y, o_solid) && spd.v == 0 {
			spd.v = -2.3;
			y--;
		}
		spd.h = max(spd.h-.05, -1);
		charge = 0;
		walktime++;
	} else if closeness < 40 && walktime < 90 {
		if place_meeting(x+12, y, o_solid) && spd.v == 0 {
			spd.v = -2.3;
			y--;
		}
		spd.h = min(spd.h+.05, 1);
		charge = 0;
		walktime++;
	} else if spd.v == 0 {
		spd.h = lerp(spd.h, 0, .16);
		charge++;
		if charge > 30 {
			walktime = 0;
			aerial = true;
			if x < df.x savedspeed = 4 else savedspeed = -4;
			charge = -120;
			var boul = c_shoot(x, y, 4.5, point_me(), bul.circle, c_red, function() {if place_meeting(x, y, o_solid) kys});
			boul.friendly = false;
		}
	} else charge = 0;
	
	var a = {bbox_left: bbox_left+2,
        bbox_top:bbox_top+grav,
        bbox_right: bbox_right-2,
        bbox_bottom:bbox_bottom+grav}
	
	var ymeeting = bread_collision(a,o_solid,COLTYPE.LESSTHANEQUALTO);
    if !ymeeting {
        spd.v += grav;
        aerial = true;
    } else {
        if aerial {
            aerial = false;
        }
        spd.v = 0;
    }
    c_newcollision();
	
	x += spd.h;
	y += spd.v;
}, u, function() {
	grav = .14;
	aerial = false;
	charge = 0;
	walktime = 0;
});