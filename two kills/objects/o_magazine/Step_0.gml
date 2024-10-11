if !delay && collision_circle(x, y, 16, DEFINE, false, false) {
	c_reload();
	df.magazines++;
	instance_destroy();
}
delay--;

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
    spd.h = 0;
    spd.v = 0;
}
c_newcollision();
x += spd.h;
y += spd.v;