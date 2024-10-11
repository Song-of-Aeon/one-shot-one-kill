function c_tilequantize(object, xoffset=0, yoffset=0) {
	object.x = clamp(round(object.x/global.tilesize)*global.tilesize+xoffset, 0, room_width);
	object.y = clamp(round(object.y/global.tilesize)*global.tilesize+yoffset, 0, room_height);
}

function c_tilequantizeval(val, offset=0) {
	return round(val/global.tilesize)*global.tilesize+offset;
}