if (!global.frozen and global.freeze == 0){

	image_speed = 1;
	
	state();
	
	var _lerp_from, _lerp_to;
	_lerp_from = floor(global.cam_x+0.5)
	_lerp_to = floor(x+0.5)-view_wport/2;
	global.cam_x = lerp(_lerp_from,_lerp_to,0.1)
	global.cam_x = floor(global.cam_x+0.5);
	_lerp_from = floor(global.cam_y+0.5)
	_lerp_to = floor(y+0.5)-view_hport/2;
	global.cam_y = lerp(_lerp_from,_lerp_to,0.1)
	global.cam_y = floor(global.cam_y+0.5);


	//global.cam_x = clamp(global.cam_x,cam_x_pos-164,cam_x_pos+164); //164
	//global.cam_y = clamp(global.cam_y,cam_y_pos-96,cam_y_pos+96);
	global.cam_x = clamp(global.cam_x,0,room_width-view_wport);
	global.cam_y = clamp(global.cam_y,0,room_height-view_hport);
	
	camera_set_view_pos(view_camera[0], floor(global.cam_x+0.5),floor(global.cam_y+0.5));

	if (last_sprite != sprite_index){
		image_index = 0;
		last_sprite = sprite_index;	
	}
}
else image_speed = 0;