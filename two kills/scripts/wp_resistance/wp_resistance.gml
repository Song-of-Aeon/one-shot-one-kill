weapongen({
	step: function(input, alt) {
		if input.hit {
			df.inv += strength;
			strength = lerp(strength, 2, .45);
		}
		//if !df.inv cooldown-- else cooldown = 90;
		if alt.hit strength = 40;
		if !cooldown strength = 40;
	},
	draw: function() {
		draw_rectangle(10, HEIGHT-20, 10+df.inv, HEIGHT-10, false);
		//draw_rectangle(10, HEIGHT-40, 10+cooldown, HEIGHT-30, false);
	},
	strength: 40,
	cooldown: 0,
	name: "resistance",
	sprite: s_null,
});