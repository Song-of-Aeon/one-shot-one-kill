function array_create_order(max_, value=1, base=0) {
	var array = [];
	var i;
	var pos = 0;
	for (i=base; i<max_; i+=value) {
		array[pos] = i;
		pos++;
	}
	return array;
}