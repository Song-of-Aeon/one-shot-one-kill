function c_loadroom(filename, set=true) {
	var thefile = file_text_open_read(filename);
	//log(thefile);

	var theroom = json_parse(file_text_read_string(thefile));
	file_text_close(thefile);
	if get_value(mp, theroom.roomname) != undefined {
		sprite_delete(mp[$theroom.roomname].thumbnail);
	}
	var surf = surface_create(global.thumbnailsize.x, global.thumbnailsize.y);
	//log(theroom.thumbnail);
	var buff = buffer_base64_decode(theroom.thumbnail);
	buffer_set_surface(buff, surf, 0);
	theroom.thumbnail = sprite_create_from_surface(surf, 0, 0, global.thumbnailsize.x, global.thumbnailsize.y, false, false, 0, 0);
	if set mp[$theroom.roomname] = theroom;
	return theroom;
}