function st_lily() {
    //log(jump);
	//log(weapons[eqwp]);
	weapons[0][0].step(attack, alt);
	
	if debug.hit {
		textbox_create(txt_kotohime);
		//c_spawnenemy(10 tiles, 10 tiles, en.impostor);
	}
	//log(wep);
	//log(eqwp);
	
	/*if wp2.hit && array_length(weapons) < 6 {
			eqwp = 1;
			log("equipped");
	}*/
	accel = .1;
	if walkspeed > 1.7 {
		dashtime--;
		accel = 1;
		if !dashtime {
			walkspeed = lapp(walkspeed, 1.7, .04);
		}
	}
	
	if shift.hit {
		walkspeed = 3.2;
		dashtime = 60;
	}
	if shift.drop || left.hit || right.hit {
		walkspeed = 1.7;
		dashtime = 0;
	}
	
	
	if left.hold dir = 180;
	if right.hold dir = 0;
	if down.hold dir = 270;
	if up.hold dir = 90;
	
	
    hput = right.hold-left.hold;
    vput = down.hold-up.hold;
	
	c_dospriteslily();
	
	if hput != 0 {
		spd.h = lerp(spd.h, hput*walkspeed, aerial ? airaccel : accel);
	} else {
		spd.h = lerp(spd.h, hput*walkspeed, aerial ? airfrict : frict);
	}
	spd.v += grav;
    /*var a = {bbox_left: bbox_left+2,
        bbox_top:bbox_top+grav,
        bbox_right: bbox_right-2,
        bbox_bottom:bbox_bottom+grav}
    var ymeeting = bread_collision(a,o_solid,COLTYPE.LESSTHANEQUALTO);
    if !ymeeting {
        spd.v += grav;
        leniance--;
        aerial = true;
    } else {
        leniance = lencount;
        if aerial {
            aerial = false;
        }
        spd.v = 0;
    }*/
    if leniance > 0 {
        if (jump.hit) {
            spd.v = -jumpspeed;
            leniance = 0;
        }
    }
    if spd.v < 0 {
        if (jump.drop) {
            spd.v /= 2;
        }
    }
    //c_newcollision();
	var xtouching = move_and_collide(spd.h, 0, o_solid);
	var ytouching = move_and_collide(0, spd.v, o_solid);
	log(ytouching);
	if array_length(ytouching) {
		leniance = lencount;
        aerial = false;
		spd.v = 0;
	} else {
		leniance--;
        aerial = true;
	}
    //x += spd.h;
    //y += spd.v;
	
	var dude = collision_point(x, y, o_entity, false, false);
	if dude && !aerial && down.hit {
		if dude.interactable {
			dude.interaction();
		}
	}
}