c_basichurting(false);
hp = clamp(hp, 0, maxhp);
repeat(c_getticks()){
	gc++;
	c_input();
	camera_set_view_pos(view_camera[0],0,0);
	state();
}
//window_set_caption(st(c_tilequantizeval(x)/global.tilesize) + ", " + st(c_tilequantizeval(y)/global.tilesize));

if hp <= 0 {
	c_shoot(x, y, 0, 0, bul.explosion);
	state = c_null;
	drawstate = c_null;
}
depth = -9;

if y > room_height {
	//room_goto(icarus);
}