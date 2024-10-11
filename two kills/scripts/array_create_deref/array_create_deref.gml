function array_create_deref(length, val) {
	var i;
	var array = [];
	for (i=0; i<length; i++) {
		array[i] = deep_copy(val);
	}
	return array;
}

//array = array_create(5, []);