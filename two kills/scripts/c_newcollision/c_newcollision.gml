function c_newcollision(){
    //var xmeeting = collision_rectangle(bbox_left+hspd,bbox_top,floor(bbox_right+hspd),bbox_bottom,o_solid,false,false)
	var xmeetdir = 0;
    var a = {bbox_left: bbox_left+spd.h,
        bbox_top:bbox_top+2,
        bbox_right: bbox_right+spd.h,
        bbox_bottom:bbox_bottom-2}
    var xmeeting = bread_collision(a,o_solid,COLTYPE.LESSTHAN)
    if(xmeeting){
        switch(sign(spd.h)){
            case 1:
				xmeetdir = 1;
                x = xmeeting.bbox_left - (sprite_get_bbox_right(sprite_index)-sprite_get_xoffset(sprite_index) );
				x = round(x);
            break;
            case -1:
				xmeetdir = 2;
                //log(xmeeting.x)
                //log(a.bbox_right)
                //log(xmeeting.bbox_left)
                //log(a.bbox_right > xmeeting.bbox_left)
                x = xmeeting.bbox_right +  sprite_get_xoffset(sprite_index)  -sprite_get_bbox_left(sprite_index);
				x = round(x);
            break;
            case 0:
                //log("im in your walls (horizontally)")
            break;
        }
        
        spd.h = 0;
    }
    //var ymeeting = collision_rectangle(bbox_left,ceil(bbox_top+vspd),bbox_right,ceil(bbox_bottom+vspd),o_solid,false,false);
    //var ymeeting = place_meeting(x,y+vspd,o_solid);
	var b = {bbox_left: bbox_left,
        bbox_top:bbox_top+spd.v,
        bbox_right: bbox_right,
        bbox_bottom:bbox_bottom+spd.v}
    var ymeeting = bread_collision(b,o_solid,COLTYPE.LESSTHAN)
    if(ymeeting){
        switch(sign(spd.v)){
            case 1:
                y = ymeeting.bbox_top - sprite_get_bbox_bottom(sprite_index) + sprite_get_yoffset(sprite_index);
            break;
            case -1:
                y = ymeeting.bbox_bottom + sprite_get_bbox_top(sprite_index) + sprite_get_yoffset(sprite_index);
            break;
            case 0:
                //log("im in your walls (vertically)");
        }
		y = round(y);
        spd.v = 0;
    }
	return xmeetdir;
}

function c_widecollision(width) {
    //var xmeeting = collision_rectangle(bbox_left+hspd,bbox_top,floor(bbox_right+hspd),bbox_bottom,o_solid,false,false)
	var xmeetdir = 0;
    var a = {bbox_left: bbox_left+spd.h-width,
        bbox_top:bbox_top+2,
        bbox_right: bbox_right+spd.h+width,
        bbox_bottom:bbox_bottom-2}
    var xmeeting = bread_collision(a,o_solid,COLTYPE.LESSTHAN)
    if(xmeeting){
        switch(sign(spd.h)){
            case 1:
				xmeetdir = 1;
            break;
            case -1:
				xmeetdir = 2;
            break;
            case 0:
                //log("im in your walls (horizontally)")
            break;
        }
    }
	return xmeetdir;
}
