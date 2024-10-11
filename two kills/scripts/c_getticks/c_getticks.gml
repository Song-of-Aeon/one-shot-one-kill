global.timescale = 1;

function c_gettimescale(){
	try{
		return self.c_gettimescale() //if our guy has a timescale, use that, otherwise, use the global timescale //TODO:see how slow this is
	}
	catch(e){
		return global.timescale;
	}
}
function c_settimescale(_timescale){
	try{
		self.c_settimescale(_timescale) //if our guy has a timescale, use that, otherwise, use the global timescale //TODO:see how slow this is
	}
	catch(e){
		global.timescale = _timescale;
	}
	with(o_bullet){
		speed = spd * global.timescale;
	}
}

function c_getticks(){
	return global.ticks;
}