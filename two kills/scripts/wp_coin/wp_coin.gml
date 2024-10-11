weapongen({
	step: function(input, alt) {
		if input.hold && !cooldown {
			c_bang(x, y, point_mouse(), 4, 0, 20, hsn.normal, c_yellow, function() {
				c
				color = make_color_hsv(40, 255-count*24, 255);
				width -= .5;
			}).damage = 2;
			se_play(se_revolver, 1.8, .6);
			cooldown = .49 sec;
		}
		cooldown = floor(cooldown-1);
		if cooldown == 0 se_play(se_revclick, 1.2+random(.4));
		coins = min(coins+1/3/60, 4);
		coins = 4;
		if alt.hit && coins >= 1 {
			var chump = instance_create(df.x, df.y, o_coin);
			chump.spd.h = df.spd.h/3;
			chump.spd.v = df.spd.v/3-1.4;
			chump.speed = 2.5;
			chump.direction = point_mouse();
			se_play(se_toss, .7+random(.6));
			coins--;
		}
	},
	draw: function() {
		draw_set_color(c_white);
		if cooldown draw_circle_width(df.x, df.y, cooldown/(.49 sec)*320, 3, true);
		draw_set_color(c_yellow);
		if coins%1 > 0 draw_circle_width(df.x, df.y, 320-(coins%1)*320, 3, true);
	},
	ammo: 0,
	ammomax: 0,
	cooldown: 0,
	coins: 4,
	name: "coin",
	sprite: s_polarstar,
});
