function c_reloadmaps() {
	//log(mp);
	
	//currentmap = mp[0];
	///c_mapchange(mp[sky_corridor], 10 tiles, 10 tiles);
	o_mapmanager.currentmap = noone;

	//working_directory
	var file_name = file_find_first("*.aeon", 0);
	while file_name != "" /*&& !string_contains(file_name, "_hist_")*/ { //took this shit from the DOCS i didnt feel like typing
		//log(file_name);
		if !string_contains(file_name, "autosave") {
			c_loadroom(file_name);
		}
	    file_name = file_find_next();
	}
	file_find_close();
}