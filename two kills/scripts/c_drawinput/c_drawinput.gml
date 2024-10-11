function c_drawinput() {
	if df.x > 500 {
		xdraw = lerp(xdraw, 70, .06);
	} else {
		xdraw = lerp(xdraw, 570, .06);
	}
	draw_sprite(s_inputdisplay, up.hold, xdraw, ydraw-16);
	draw_sprite(s_inputdisplay, 2+down.hold, xdraw, ydraw+16);
	draw_sprite(s_inputdisplay, 12+jump.hold, xdraw-32, ydraw-16);
	draw_sprite(s_inputdisplay, 6+left.hold, xdraw-32, ydraw+16);
	draw_sprite(s_inputdisplay, 12+attack.hold, xdraw+32, ydraw-16);
	draw_sprite(s_inputdisplay, 10+right.hold, xdraw+32, ydraw+16);
	
	draw_circle(mouse_x, mouse_y, 4, true);
}