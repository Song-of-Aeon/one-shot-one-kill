function st_needledraw() {
	//draw_self();
	draw_sprite_ext(spriteindex, imageindex, x, y, image_xscale, image_yscale, 0, c_white, 1-(!!inv)*.5);
	weapons[eqwp][altpos].draw();
	draw_set_color(c_white);
	draw_set_font(ft_comicsans);
	
	exit;
	
	draw_text(48, 10, "1. jumpspeed: " + string(jumpspeed));
	draw_text(48, 20, "2. gravity: " + string(grav));
	draw_text(48, 30, "3. acceleration: " + string(accel));
	draw_text(48, 40, "4. friction: " + string(frict));
	draw_text(48, 50, "5. air acceleration: " + string(airaccel));
	draw_text(48, 60, "6. air friction: " + string(airfrict));
	draw_text(48, 70, "7. maxspeed: " + string(walkspeed));
	draw_text(48, 80, "8. leniance: " + string(lencount));
	if up.hit {
		if keyboard_check(ord("1")) {
			jumpspeed += .1;
		}
		if keyboard_check(ord("2")) {
			grav += .01;
		}
		if keyboard_check(ord("3")) {
			accel += .02;
		}
		if keyboard_check(ord("4")) {
			frict += .02;
		}
		if keyboard_check(ord("5")) {
			airaccel += .02;
		}
		if keyboard_check(ord("6")) {
			airfrict += .02;
		}
		if keyboard_check(ord("7")) {
			walkspeed += .1;
		}
		if keyboard_check(ord("8")) {
			lencount++;
		}
	}
	if down.hit {
		if keyboard_check(ord("1")) {
			jumpspeed -= .1;
		}
		if keyboard_check(ord("2")) {
			grav -= .01;
		}
		if keyboard_check(ord("3")) {
			accel -= .02;
		}
		if keyboard_check(ord("4")) {
			frict -= .02;
		}
		if keyboard_check(ord("5")) {
			airaccel -= .02;
		}
		if keyboard_check(ord("6")) {
			airfrict -= .02;
		}
		if keyboard_check(ord("7")) {
			walkspeed -= .1;
		}
		if keyboard_check(ord("8")) {
			lencount--;
		}
	}
	draw_set_font(ft_marineconstellation);
}