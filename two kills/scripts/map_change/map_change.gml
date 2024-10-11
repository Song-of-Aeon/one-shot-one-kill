function c_mapchange(map_, x, y, transitiontype=0, event=c_null) {
	//return false
	room_goto(map_.maproom);
	o_mapmanager.currentmap = map_;
	df.x = x;
	df.y = y;
	df.magazines = df.maxmagazines;
	//global.curre
	event();
}

#macro tiles *global.tilesize
global.tilesize = 16;
global.currentspawn = new vec2(10 tiles, 10 tiles);