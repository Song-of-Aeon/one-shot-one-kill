function draw_spr(x, y, thing, index=0, xscale=1, yscale=1, angle=0, color=c_white, alpha=draw_get_alpha()) {
	draw_sprite_ext(thing, index, x, y, xscale, yscale, angle, color, alpha);
}