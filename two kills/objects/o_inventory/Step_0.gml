c_input();
x = cycle(x+right.hit-left.hit, array_length(items));

if jump.hit || inventory.hit {
	c_settimescale(1);
	instance_destroy();
}