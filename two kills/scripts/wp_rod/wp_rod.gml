weapongen({
	step: function(input, alt) {
		c_input();
		if input.hold {
			if up.hit {
				
			} else if down.hit {
				
			} else if left.hit || right.hit {
				
			}
		}
	},
	draw: function(input, alt) {
		exit;
		if input.hold {
			draw_set_halign(fa_center);
			draw_string(df.x, df.y-20, "PRESS A DIRECTION");
			draw_reset();
		}
	},
	ammo: 0,
	ammomax: 0,
	unlocks: {
		side: false,
		up: false,
		down: false,
	},
	name: "rod",
	sprite: s_polarstar,
});