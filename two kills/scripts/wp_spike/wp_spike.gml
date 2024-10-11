weapongen({
	step: function(input, alt) {
		if input.hold && !cooldown {
			log(point_mouse(u, u, u, u, self));
			if chargeshot < 2 {
				var bang = c_bang(x, y, point_mouse(u, u, u, u, self), 4, 0, 20, hsn.spike, chargeshot ? c_teal : c_yellow, function() {
					c
					color = make_color_hsv(hue, 255-count*24, 255);
					width -= .5;
					if count == 1 log(dir);
				});
				bang.damage = 5;
				bang.hue = 110;
				if !chargeshot {
					bang.size = 120;
					bang.hue = 40;
				}
			} else {
				var guy = c_bang(x, y, point_mouse(u, u, u, u, self), 6, 0, 35, hsn.normal, c_cyan, function() {
					c
					color = make_color_hsv(140, 255-count*24, 255);
					width -= .5;
					
				});
				guy.damage = 5;
				guy.multihit = 4;
			}
			//se_play(se_revolver, 1-chargeshot*.25);
			recoil = 6+chargeshot*5;
			cooldown = 1.31 sec;
			chargeshot = 0;
		}
		cooldown = floor(cooldown-1);
		if cooldown == 0 //se_play(se_revclick, 1.2+random(.4));
		coins = min(coins+1/3/60, 2-chargeshot);
		if alt.hit && coins {
			coins--;
			chargeshot++;
			cooldown = 0;
		}
		recoil = lerp(recoil, 0, .05);
	},
	draw: function() {
		draw_set_color(c_white);
		if cooldown draw_circle_width(df.x, df.y, cooldown/(1.31 sec)*320, 3, true);
		if coins%1 > 0 draw_circle_width(df.x, df.y, 320-(coins%1)*320, 3, true);
		draw_set_color(c_black);
		var i;
		var dude;
		for (i=0; i<chargeshot; i++) {
			with DEFINE {
				dude = distabs(point_mouse(), 19+i*5);
				draw_sprite_ext(s_javelincharge, 0, x+dude.x, y-3+dude.y, 1+sinmult(gc+i*70, 20, .3), 1+sinmult(gc+i*70, 20, .3), point_mouse(), c_white, 1);
			}
		}
	},
	coins: 2,
	chargeshot: 0,
	ammo: 0,
	ammomax: 0,
	cooldown: 0,
	recoil: 0,
	charge: 0,
	chargecooldown: 0,
	name: "javelin",
	sprite: s_javelin,
	x: 0,
	y: 0,
});
nu hitscan("spike", s_pike, 99, false, true, 1);
