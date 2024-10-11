function c_screenshake(_amplitude,_length){
	if(_amplitude == infinity){
		_amplitude = 1000
	}
	with(instance_create(0,0,o_screenshake)){
		length = _length;
		amplitude = _amplitude;
	}
}
function c_hitpause(mstime){
	var initialtime = get_timer();
	while(true){
		if(initialtime+(mstime*1000) < get_timer()){
			return;
		}
	}
}
///flash(surface, duration, colour);
function c_flash(_surface/*:surface*/, _duration/*:number*/, _color/*:any*/){
	with(instance_create(0,0,o_flash)){
		surface = other._surface;
		duration = other._duration;
		color = other._color
	}
}