function st_v1draw() {
	
	
	//MAKE HIM TURN WHILE IN AIR
	
	
	c_drawinput();
	weapons[eqwp][altpos].draw();
	st_drawui();
	ang = point_mouse();
	image_xscale = -ineg(ang >= 90 && ang <= 270);
	var j, dude;
	iterate weapons to {
		j=0
	
		
		ang = mod_negative(point_mouse()-180+(i-(array_length(weapons)-1)/2)*40, 360);
		ang = lerp_angle(ang, 90-90*image_xscale, .6);
		dude = distabs_ext(ang, 6, 1, 1.5);
		draw_sprite_ext(
			s_v1wings, 0,
			df.x+dude.x, df.y+dude.y, 1,
			ineg(ang >= 90 && ang <= 270), ang, c_white, 1
		);
		if (i == eqwp && !image_xscale) || ((i+1)%array_length(weapons) == eqwp && image_xscale) /*&& j == altpos*/ {
			draw_sprite_ext(
				s_v1wings, 1,
				df.x+dude.x, df.y+dude.y, 1,
				ineg(ang >= 90 && ang <= 270), ang, c_grey, 1
			);
			
		} else {
			
			/*dude = distabs_ext(ang+10, 11+sinmult(gc, 60, 2), 1, 1.5);
			draw_sprite_ext(
				weapons[i][0].sprite, 0,
				df.x-2*image_xscale+dude.x, df.y-3+dude.y, 1,
				ineg(ang >= 90 && ang <= 270), ang, c_grey, .4
			);*/
			gpu_set_blendmode(bm_add);
			draw_sprite_ext(
				s_v1wings, 1,
				df.x+dude.x, df.y+dude.y, 1,
				ineg(ang >= 90 && ang <= 270), ang, c_white, 1
			);
			gpu_set_blendmode(bm_normal);
		}
		
	
	}
	ang = point_mouse();
	dude = distabs_ext(ang, 9, 1, 1);
	draw_sprite_ext(
		weapons[eqwp][altpos].sprite, 0,
		df.x-2*image_xscale+dude.x, df.y-3+dude.y, 1,
		ineg(ang >= 90 && ang <= 270), ang, c_white, 1
	);
	weapons[eqwp][altpos].x = df.x-2*image_xscale+dude.x;
	weapons[eqwp][altpos].y = df.y-3+dude.y;
	var ang = point_mouse();
	var theflip = ineg(ang >= 90 && ang <= 270);
	draw_sprite_ext(s_v1gunarm, 2, x-2*image_xscale, y-4, theflip, image_yscale, point_mouse()+90, c_white, 1);
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, 1);
	draw_sprite_ext(s_v1lights, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, 1);
	faceangle = lerp_angle(faceangle, ang, .15);
	draw_sprite_ext(s_v1face, 0, x, y-8, 1, ineg(ang >= 90 && ang <= 270), faceangle, c_white, 1);
	draw_sprite_ext(s_v1face, 1, x, y-8, 1, ineg(ang >= 90 && ang <= 270), faceangle, c_white, 1);
	arm[eqarm].draw();
}               