function c_basiccollision() {
	if place_meeting(x + hspd, y, o_solid) {
	    var i = 0;
	    while !place_meeting(x + sign(hspd), y, o_solid) {
	        x += sign(hspd);
	        i++;
	        if i > sprite_width {
	            break;
	        }
	    }
	    hspd = 0;
	}

	if place_meeting(x, y + vspd, o_solid) {
	    while !place_meeting(x, y + sign(vspd), o_solid) {
	        y += sign(vspd);
	    }
	    vspd = 0;
	}
	
}