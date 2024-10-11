/*function map(name_, room_, step_=c_null, draw_=c_null) constructor {
	name = name_;
	maproom = room_;
	step = step_;
	draw = draw_;
	global.maps[room_] = self;
}

global.maps = [];
//nu map("Sky Corridor", sky_corridor);
nu map("Gusty Space", gusty_space);
nu map("coinroom", coinroom);*/

global.maps = {};

/*global.maps.empty = {
	roomsize: 512,
	roomname: 288,
	guys: [],
	enemies: [],
	triggers: [],
	spawn: new vec2(10 tiles, 10 tiles),
	thumbnail: s_mistake,
}*/

#macro mp global.maps