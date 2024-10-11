repeat(c_getticks()){
	//acount = min(acount+.04, alpha);
	acount = alpha;
	//image_alpha = acount;
	image_alpha = alpha;
	fxxscale = image_xscale*((alpha-acount)*4+1);
	fxyscale = image_yscale*((alpha-acount)*4+1);
	if !simple behaviors();
	//if image_alpha != acount acount -= (image_alpha-acount);
	dir += tspd;
	spd += acc;
	//var xold = x;
	//var yold = y;
	direction = dir;
	speed = spd*global.timescale;
	x += hspd;
	y += vspd;
	//var time = get_timer();
	//image_angle = point_direction(xprevious, yprevious, x, y)-90;
	//log(image_angle);
	if !(x==clamp(x, -escapedistance, room_width+escapedistance) && y==clamp(y, -escapedistance, room_height+escapedistance)) {
		instance_destroy();
	}
	//image_angle = point_direction(xold, yold, x, y)-90;
	//image_angle = point_direction(xprevious, yprevious, x, y)-90;
	//log(get_timer()-time);

	//image_alpha = clamp(image_alpha+((abs(hspd)+abs(vspd))/2+speed+.05)/10, 0, alpha);
}
depth = -9;