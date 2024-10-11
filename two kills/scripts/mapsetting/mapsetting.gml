function mapsetting(name_, options_, step_, draw_) constructor {
	name = name_;
	options = options_;
	step = munction(step_);
	draw = munction(draw_);
	pos = 0;
	opos = array_create(array_length(options));
	count = 0;
	xdraw = o_mapper.elementxdraw;
	ydraw = o_mapper.elementydraw;
	interval = 32;
}