function blink(event=c_null) {
	var chump = scriptable_create(function() {
		count += iterations > 2 ? -1 : 1;
		if count == 5 event();
		if count > 5 iterations++;
		if count == -1 kys;
	}, function() {
		surface_set_target(global.surfaces.HUD);
			draw_set_color(c_black);
			draw_rectangle(0, 0, WIDTH, target1*count/5, false);
			draw_rectangle(0, HEIGHT, WIDTH, HEIGHT-target2*count/6, false);
		surface_reset_target();
	});
	//chump.target1 = HEIGHT;
	//chump.target2 = HEIGHT;
	chump.target1 = HEIGHT*.4+irandom(HEIGHT*.2);
	chump.target2 = HEIGHT-chump.target1;
	chump.event = event;
	return chump;
}