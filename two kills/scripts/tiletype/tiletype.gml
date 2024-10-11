function tiletype(sprite_, index_, tileset_=TILESET.SIZE, shape_=TILESHAPE.SQUARE, collision_=true, durability_=infinity, step_=c_null, draw_=draw_self, ontouch_=c_null, onstay_=c_null, onleave_=c_null) constructor {
	sprite = sprite_;
	index = index_;
	cover = shape_;
	collision = collision_;
	durability = durability_;
	step = step_;
	draw = draw_;
	ontouch = ontouch_;
	onstay = onstay_;
	onleave = onleave_;
	tileset = tileset_;
	tl[tileset_][index_] = self;
}

enum TILESHAPE {
	EMPTY,
	SQUARE,
	SEMICIRCLEU,
	SEMICIRCLED,
	L45,
	R45,
	UL45,
	UR45,
	LCS1,
	LCS2,
	RCS1,
	RCS2,
	ULCS1,
	ULCS2,
	URCS1,
	URCS2,
}

/*function tileset(name_, sprite_) constructor {
	name = name_;
	sprite = sprite_;
	//global.tilesets[$name] = self;
	array_push(global.tilesets, self);
}*/

//global.tilesets = [];
//#macro TILESET global.tilesets

enum TILESET {
	//MISC,
	//ISLE,
	ELSEWHERE,
	TOWER,
	//HELL,
	//GENSOKYO,
	//CRATES,
	SDM,
	SNOW,
	SIZE,
}

global.tssprites = [
	prt_elsewhere,
	prt_perception,
	prt_sdm,
	s_null,
	s_null,
]

global.tiletypes = array_create_deref(TILESET.SIZE, []);
#macro tl global.tiletypes