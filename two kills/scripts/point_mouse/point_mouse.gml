function point_mouse(xdif=0, ydif=0, myxdif=0, myydif=0, target=df) {
	//log("underscores", mouse_x, mouse_y);
	//log("functions", window_mouse_get_x(), window_mouse_get_y());
	if mouse_x == window_mouse_get_x() && mouse_y == window_mouse_get_y() {
		//log("shitt");
		return point_direction(target.x+xdif, target.y+ydif, mouse_x+view_get_xport(view_camera[0])+myxdif, mouse_y+view_get_yport(view_camera[0])+myydif);
	} else {
		return point_direction(target.x+xdif, target.y+ydif, mouse_x+myxdif, mouse_y+myydif);
	}
	
}