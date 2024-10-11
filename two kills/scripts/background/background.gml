global.backgrounds = {};

function background(name_, draw_) constructor {
	name = name_;
	draw = draw_;
	global.backgrounds[$name] = self;
}

nu background("plain", function() {
	//draw_sprite_tiled(s_when_the, 0, 0, 0);
	draw_clear(c_dkgray);
});
nu background("r", function() {
	draw_clear(c_maroon);
});
nu background("g", function() {
	draw_clear(c_green);
});
nu background("b", function() {
	draw_clear(c_navy);
});
nu background("impostor", function() {
	draw_clear(c_black);
	draw_set_alpha(.2);
	draw_sprite_tiled(s_when_the, 0, gc/7, gc/7);
	draw_set_alpha(1);
});

global.currentbackground = global.backgrounds.plain;