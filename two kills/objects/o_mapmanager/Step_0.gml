//log(global.chump.x);

/*c_settimescale(clamp(
	global.timescale+
	keyboard_check_pressed(vk_lshift)*.1-
	keyboard_check_pressed(vk_rshift)*.1,
1, 1));*/

if(keyboard_check_pressed(vk_f5)){
	c_reloadmaps();
}