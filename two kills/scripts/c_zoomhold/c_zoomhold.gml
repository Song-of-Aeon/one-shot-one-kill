function c_zoomhold(x, y, amount, hold, duration) {
	camera_set_view_size(view_camera[0], 320/amount, 240/amount);
	cameratarg.x = x-160;
	cameratarg.y = y-120;
	
	
	//camera_set_view_target(view_camera[0], x, y);
	//camera_set_view_target(view_camera[0], target);
	df.cameradelay = hold;
}