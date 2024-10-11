weapongen({
	step: function(input) {
		if input.hit && array_length(tag_get_instances("snakebul")) < 4 {
			var boul = c_shoot(df.x, df.y, 2, point_mouse(), bul.square, c_white, function() {
				c
				tspd = cosmult(count, 10, 5);
				spd += .1;
				image_angle += 5;
				if ncm(40) {
					instance_destroy();
				}
			});
			tag("snakebul", boul);
		}
	},
	draw: function() {
		
	},
	ammo: 0,
	ammomax: 0,
	name: "snake",
});