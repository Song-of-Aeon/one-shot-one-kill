function array_remove(array, val) {
	var returnable = false;
	var i;
	for (i=0; i<array_length(array); i++) {
		if array[i] == val {
			array_delete(array, i, 1);
			i--;
			returnable = true;
		}
	}
	return returnable;
}