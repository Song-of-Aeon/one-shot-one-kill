function c_maketrigger(x, y, x2, y2, enter=c_null, stay=c_null, leave=c_null, step=c_null) {
	var chump = instance_create(x, y, o_trigger);
	chump.x = x;
	chump.y = y;
	chump.x2 = x2;
	chump.y2 = y2;
	chump.enter = enter;
	chump.stay = stay;
	chump.leave = leave;
	chump.step = step;
	log(x, y, x2, y2);
	log(chump);
	global.chump = chump;
	return chump;
}