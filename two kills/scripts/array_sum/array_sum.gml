function array_sum(array) {
	var i;
	var result = 0;
	for (i=0; i<array_length(array); i++) {
		result += array[i];
	}
	return result;
}