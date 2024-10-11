function is_oob(variation=sprite_width/2, horizontal=true, vertical=true) {
	if horizontal && vertical {
		return !(x=clamp(x, 0-variation, global.gw+variation) && y=clamp(y, 0-variation, global.gh+variation));
	} else if horizontal {
		return !(x=clamp(x, 0-variation, global.gw+variation))
	} else if vertical {
		return !(y=clamp(y, 0-variation, global.gh+variation))
	} else {
		log("????????????");
		return true;
	}
}