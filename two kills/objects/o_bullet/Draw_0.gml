
if rotate {
	//UNOPTIMAL
	if x == xprevious && y == yprevious {
		image_angle = dir-90;
	} else {
		image_angle = point_direction(xprevious, yprevious, x, y)-90;
	}
}
draws();