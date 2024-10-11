weapongen({
	step: function(input) {
		if input.hit && !df.punchdelay {
			df.punchdelay = 40;
			var parryrange = 8;
			var dude = distabs(point_mouse(), 12);
			var parry = c_shoot(df.x+dude.x, df.y+dude.y, 0, point_mouse(), bul.small, c_blue, function() {
				var boul = collision_circle(x, y, 8, o_bullet, true, true);
				if boul && boul.object_index != o_hitscan {
					df.punchdelay = 30;
					scriptable_create(u, function() {
						draw_set_color(c_white);
						draw_set_alpha(.25);
						draw_rectangle(0, 0, room_width, room_height, false);
						draw_set_alpha(1);
						if count {
							c_hitpause(220);
							instance_destroy();
						}
						c
					});
					c_shoot(x, y, 11, point_mouse(), bul.circle, c_yellow, function() {
						if collision_circle(x, y, 4, o_solid, true, false) || collision_circle(x, y, 4, o_enemy, true, false) {
							c_shoot(x, y, 0, 0, bul.explosion, c_white);
							instance_destroy();
						}
					}, c_flatcolor).friendly = NaN;
					instance_destroy(boul);
				}
				kys
			});
			parry.damage = 3;
			parry.destructible = false;
			rescale(parry, 2);
		}
	},
	draw: function() {
		with df {
			var ang = point_mouse();
			var theflip = ineg(ang >= 90 && ang <= 270);
			if df.sliding != 0 {
				if !punchdelay {
					draw_sprite_ext(s_dcarm, 0, x+5*image_xscale, y+6, -image_xscale, image_yscale, -spd.h*11, c_white, 1);
				} else {
					if punchdelay > 30 {
						draw_sprite_ext(s_dcarm, 1, x+5*image_xscale, y+6, 1*((punchdelay-30)/5+1), theflip*((punchdelay-30)/5+1), ang, c_white, 1);
					} else {
						draw_sprite_ext(s_dcarm, 2, x+5*image_xscale, y+6, -1, theflip, ang, c_white, 1);
					}
				}
			} else {
				if !punchdelay {
					draw_sprite_ext(s_dcarm, 0, x+2*image_xscale, y-4, -image_xscale, image_yscale, -spd.h*11, c_white, 1);
				} else {
					if punchdelay > 30 {
						draw_sprite_ext(s_dcarm, 1, x+2*image_xscale, y-3, 1*((punchdelay-30)/5+1), theflip*((punchdelay-30)/5+1), ang, c_white, 1);
					} else {
						draw_sprite_ext(s_dcarm, 2, x+2*image_xscale, y-3, -1, theflip, ang, c_white, 1);
					}
				}
			}
		}
	},
	ammo: 0,
	ammomax: 0,
	name: "woodarm",
	sprite: s_dcarm,
});