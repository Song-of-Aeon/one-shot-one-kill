function st_ky() {
    //log(jump);
	//log(weapons[eqwp]);
	weapons[0][0].step(attack, alt);
	
	if debug.hit {
		//textbox_create(txt_kotohime);
		//blink();
		c_loadmap(mp[$"asteroid"]);
		//c_spawnenemy(10 tiles, 10 tiles, en.impostor);
	}
	accel = .1;
	
	
	if left.hold dir = 180;
	if right.hold dir = 0;
	if down.hold dir = 270;
	if up.hold dir = 90;
	
	
    hput = right.hold-left.hold;
    vput = down.hold-up.hold;
	
	c_dospritesky();
	
	if hput != 0 {
		spd.h = lerp(spd.h, hput*walkspeed, aerial ? airaccel : accel);
	} else {
		spd.h = lerp(spd.h, hput*walkspeed, aerial ? airfrict : frict);
	}
	spd.v += grav;
    if leniance {
        if jump.hit {
			if spd.v > grav*2 {
				//spd.h += spd.v*image_xscale*-2;
				spd.h = -5.4*image_xscale;
				spd.v = -jumpspeed*.68;
			} else {
				spd.v = -jumpspeed;
			}
            //spd.v -= jumpspeed;
            leniance = 0;
        }
    }
    if spd.v < 0 {
        if jump.drop {
            spd.v /= 2;
        }
    }
    //c_newcollision();
	var oldtouching = deep_copy(touchers);
	
	//var xtouching = [];
	//var ytouching = move_and_collide(spd.h, spd.v, o_solid);
	var xtouching = move_and_collide(spd.h, 0, o_solid);
	var ytouching = move_and_collide(0, spd.v, o_solid);
	
	var nottouching = ds_list_create();
	collision_rectangle_list(bbox_left, bbox_top, bbox_right, bbox_bottom, o_notsolid, false, false, nottouching, false);
	nottouching = ds_list_to_array(nottouching);
	touchers = array_union(xtouching, ytouching, nottouching);
	iterate touchers to {
		touchers[i].onstay();
		if !instance_exists(touchers[i]) continue;
		if !array_contains(oldtouching, touchers[i]) touchers[i].ontouch();
	}
	iterate oldtouching to {
		if !instance_exists(oldtouching[i]) continue;
		if !array_contains(touchers, oldtouching[i]) oldtouching[i].onleave();
	}
	//log("and it");
	//log(xtouching);
	//log(ytouching);
	if array_length(ytouching) {
		leniance = lencount;
        aerial = false;
		spd.v = 0;
	} else {
		var stepdowndist = global.tilesize/3;
		if !aerial {
			if collision_line(x, y, x, y+sprite_get_height(sprite_index)-sprite_get_xoffset(sprite_index)+stepdowndist, o_solid, true, false) && !jump.hit {
				move_and_collide(0, stepdowndist, o_solid, u, u, u, 0, 0);
				log("wow!");
			} else aerial = true;
		}
		leniance--;
	}
	if array_length(xtouching) {
		//spd.h = 0;
	}
	var dude = collision_point(x, y, o_entity, false, false);
	if dude && !aerial && down.hit {
		if dude.interactable {
			dude.interaction();
		}
	}
	log(spd.h);
	log(x-xprevious);
}