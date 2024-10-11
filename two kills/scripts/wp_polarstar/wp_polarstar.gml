weapongen({
	step: function(input) {
		if input.hit and instance_number(o_bullet) < 2 {
			se_play(se_polarshoot);
			c_shoot(DEFINE.x, DEFINE.y, 6, DEFINE.dir, bul.square, c_white, function() {
				count = count+1;
				touching = place_meeting(x, y, o_solid);
				if touching or count > 22 {
					instance_destroy(self);
				}
			});
		}
	},
	draw: function() {
		if DEFINE.dir == 0 {
			//draw_sprite(s_polarstar, 0, DEFINE.x+5, DEFINE.y+2);
		} else {
			//draw_sprite_ext(s_polarstar, 0, DEFINE.x-5, DEFINE.y+2, -1, 1, 0, c_white, 1);
		}
	},
	ammo: 0,
	ammomax: 0,
	name: "Polar Star",
	sprite: s_polarstar,
});