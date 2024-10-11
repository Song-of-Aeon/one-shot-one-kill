function draw_line_fade(x, y, length, horizontal=0, vertical=0) {
	var i;
	for (i=0; i<length; i++) {
		draw_set_alpha(2-i/(length/2));
		draw_point(x+i*horizontal, y+i*vertical);
	}
}