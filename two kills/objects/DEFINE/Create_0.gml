c_input();
count = 0;

spd = {
	h: 0,
	v: 0,
	d: 0,
}
espd = {
	h: 0,
	v: 0,
	d: 0,
}
defense = 0;
//log(global.weapons)

cameratarg = new vec2();
cameradelay = 0;
wingpos = [
	new vec2(),
	new vec2(),
	new vec2(),
	new vec2(),
	new vec2(),
	new vec2(),
	new vec2(),
	new vec2(),
]

accel = .1;
frict = .1;
airaccel = .1;
airfrict = .1;
walkspeed = 1.9;
jumpspeed = 3.75;
grav = .1;
leniance = 0;
lencount = 10;
magazines = 1;
maxmagazines = 1;
aerial = false;
altpos = 0;
hp = 10;
maxhp = 100;
dir = 0;
inv = 0;

eqwp = 0;
altpos = 0;

switch os_get_config() {
	default:
		sprites = {
			idle: s_meidle,
			walk: s_mewalk,
			up: s_meup,
			upwalk: s_meupwalk,
			down: s_medown,
		}
		weapons = [
			[wp.deagle],
		];
		state = st_standard;
		drawstate = st_standarddraw;
		break;
	case "ultrakill":
		sprites = {
			idle: s_v1,
			walk: s_v1,
			up: s_v1,
			upwalk: s_v1,
			down: s_v1,
		}
		weapons = [
			[wp.javelin, wp.coin],
			[wp.shotgun, wp.deagle],
			[wp.bounceback, wp.nicole_dunlap],
		];
		arm = [
			wp.feedbacker,
		]
		eqwp = 0;
		eqarm = 0;
		dashing = false;
		stamina = 3;
		slamduration = 0;
		slamming = false;
		sliding = false;
		punchdelay = 0;
		walljumps = 3;
		state = st_v1;
		drawstate = st_v1draw;
		break;
	case "lily":
		weapons = [
			[wp.deagle],
		];
		sprites = {
			idle: s_lily,
			walk: s_lilyrun,
			run: s_lilyfastrun,
			up: s_lily,
			upwalk: s_lily,
			down: s_lily,
			jump: s_lilyjump,
		}
		walkspeed = 1.7;
		jumpspeed = 4.6;
		grav = .12;
		leniance = 6;
		accel = .1;
		airaccel = .1;
		frict = .16;
		airfrict = .08;
		dashtime = 0;
		state = st_lily;
		drawstate = st_lilydraw;
		sprite_index = s_kyblock;
		break;
	case "elsewhere":
		sprites = {
			idle: s_ky,
			walk: s_ky,
			up: s_ky,
			upwalk: s_ky,
			down: s_ky,
			jump: s_kyjump,
		}
		/*sprites = {
			idle: s_kyblock,
			walk: s_kyblock,
			up: s_kyblock,
			upwalk: s_kyblock,
			down: s_kyblock,
			jump: s_kyblock,
		}*/
		sprite_index = s_kyblock;
		weapons = [
			[wp.rod],
		];
		grav = .16;
		leniance = 12;
		accel = .1;
		airaccel = .04;
		frict = .14;
		airfrict = .01;
		walkspeed = 2.1;
		jumpspeed = 4;
		state = st_ky;
		drawstate = st_kydraw;
		break;
	case "needle":
		sprites = {
			idle: s_ky,
			walk: s_ky,
			up: s_ky,
			upwalk: s_ky,
			down: s_ky,
			jump: s_kyjump,
		}
		/*sprites = {
			idle: s_kyblock,
			walk: s_kyblock,
			up: s_kyblock,
			upwalk: s_kyblock,
			down: s_kyblock,
			jump: s_kyblock,
		}*/
		sprite_index = s_kyblock;
		weapons = [
			[wp.resistance],
		];
		grav = .16;
		leniance = 12;
		accel = .1;
		airaccel = .04;
		frict = .14;
		airfrict = .01;
		walkspeed = 2.1;
		jumpspeed = 4;
		state = st_needle;
		drawstate = st_needledraw;
		inv = 0;
		break;
}
faceangle = 0;
spriteindex = 0;
imageindex = 0;
//actionstate = st_7
touchers = [];
xdraw = -100;
ydraw = 310;
global.count = 0;
global.me = id;
#macro df global.me
//instance_create(0, 0, o_mapmanager);

//lilystats
/*

*/

camera_set_view_target(view_camera[0], global.me);
camera_set_view_border(view_camera[0], MIDWID, MIDHEI);