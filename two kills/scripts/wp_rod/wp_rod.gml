weapongen({
	step: function(input, alt) {
		active = false;
		c_input();
		if input.hold {
			active = true;
			if up.hit && unlocks.up {
				
			} else if down.hit && unlocks.down {
				
			} else if (left.hit || right.hit) && unlocks.side {
				df.bashcount = 0;
				df.state = munction(function() {
					c_inputnull();
					right.hit = true;
					spd.h = walkspeed*3;
					bashcount++;
					if bashcount >= 20 state = st_ky;
					st_ky();
					if array_length(xtouching) {
						state = st_ky;
						spd.h = -spd.h*.3;
						spd.v = -3;
					}
				});
			}
		}
	},
	draw: function(input, alt) {
		if active {
			draw_set_halign(fa_center);
			draw_string(df.x, df.y-20, "PRESS A DIRECTION");
			draw_reset();
		}
	},
	ammo: 0,
	ammomax: 0,
	unlocks: {
		side: true,
		up: true,
		down: true,
	},
	name: "rod",
	sprite: s_polarstar,
	active: false,
});