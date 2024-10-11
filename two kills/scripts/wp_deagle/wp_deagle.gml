weapongen({
	step: function(input) {
		if input.hit && ammo {
			
			var boul = c_shoot(df.x, df.y, 9, point_direction(df.x, df.y, mouse_x, mouse_y), bul.small, c_blue, function() {
				c
				color = make_color_hsv((count*21)%255, 255, 255);
				if count >= 14 instance_destroy();
				if collision_point(x, y, o_solid, true, false) instance_destroy();
			});
			boul.friendly = true;
			if ammo == 9 {
				rescale(boul, 4);
				boul.damage *= 3;
				c_screenshake(10, 10);
				se_play(se_shoot, .4, 2);
			} else {
				rescale(boul, 2);
				c_screenshake(3, 3);
				se_play(se_shoot, irandom(.6)+.7);
			}
			
			ammo--;
		}
	},
	draw: function() {
		//draw_text(10, 10, string(df.hp)+"/"+string(df.maxhp));
		//draw_text(10, 20, string(ammo)+"/"+string(ammomax));
		//draw_text(10, 30, string(df.magazines)+"/"+string(df.maxmagazines));
	},
	ammo: 9,
	ammomax: 9,
	name: "deagle",
	sprite: s_polarstar,
});