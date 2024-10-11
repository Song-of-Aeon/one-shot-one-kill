weapongen({
	step: function(input, alt) {
		dude = distabs(point_mouse(), 12-recoil);
		if input.hold && !cooldown {
			c_bang(x, y, point_mouse(), 4, 0, 20, hsn.normal, c_yellow, function() {
				c
				color = make_color_hsv(40, 255-count*24, 255);
				width -= .5;
			}).damage = 5;
			se_play(se_revolver);
			cooldown = 1.31 sec;
			charge = 0;
			recoil = 6;
		}
		cooldown = floor(cooldown-1);
		chargecooldown = floor(chargecooldown-1);
		if cooldown == 0 se_play(se_revclick, 1.2+random(.4));
		if alt.hold && !cooldown && !chargecooldown && charge < 1 sec {
			charge++;
		}
		if alt.drop {
			if charge >= 1 sec {
				var guy = c_bang(x, y, point_direction(df.x, df.y, mouse_x, mouse_y), 6, 0, 35, hsn.normal, c_blue, function() {
					c
					color = make_color_hsv(140, 255-count*24, 255);
					width -= .5;
					
				});
				guy.damage = 5;
				guy.multihit = 4;
				se_play(se_revolver, .5);
				chargecooldown = 5.25 sec;
				recoil = 16;
			}
			charge = 0;
		}
		recoil = lerp(recoil, 0, .05);
	},
	draw: function() {
		draw_set_color(c_white);
		if cooldown draw_circle_width(df.x, df.y, cooldown/(1.31 sec)*320, 3, true);
		draw_set_color(c_black);
		if chargecooldown draw_circle_width(df.x, df.y, chargecooldown/(5.25 sec)*320, 3, true);
		draw_set_color(make_color_hsv(140, 128+sinmult(gc, 20, 128), 255));
		if charge draw_circle_width(df.x, df.y, charge/2, 3, true);
	},
	ammo: 0,
	ammomax: 0,
	cooldown: 0,
	recoil: 0,
	charge: 0,
	chargecooldown: 0,
	name: "revolver",
	dude: new vec2(),
	sprite: s_polarstar,
});

global.hitscans = {};
nu hitscan("normal", s_line, 99, false, true, 1);
