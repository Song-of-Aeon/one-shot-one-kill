function st_hurt() {
	if inv return false;
	if ow.object_index == o_hitscan {
		if array_length(ow.hitlist) >= ow.multihit return false;
		if array_length(ow.hitlist) == ow.multihit-1 {
			ow.size = point_distance(x, y, ow.x, ow.y);
		}
		array_push(ow.hitlist, id);
	}
	takingdamage = ow.damage-defense;
	c_damagenum(id, takingdamage);
	hp -= takingdamage;
	if object_index != df {
		c_healradius(x, y, takingdamage*15);
	}
	c_screenshake(takingdamage*2, 8);
	if ow.destructible {
		instance_destroy(ow);
	}
	return true;
}
/*
function st_hurt() {
	var returnable = false;
	if !inv {
		takingdamage = ow.damage;
		se_play(snd_hurt);
		hp -= takingdamage;
		c_inv(invtime);
		c_screenshake(osdhufji, inv/2);
		returnable = true;
	}
	if ow.destructible {
		instance_destroy(ow);
	}
	return returnable;
}
*/