function distabs(dir, distance) {
	var dist = {
		x: (dsin(dir+90)%360)*distance,
		y: (dcos(dir+90)%360)*distance,
	}
	return dist;
}
function distabs_ext(dir, distance, xscale, yscale) {
	var dist = {
		x: (dsin(dir+90)%360)*distance*xscale,
		y: (dcos(dir+90)%360)*distance*yscale,
	}
	return dist;
}