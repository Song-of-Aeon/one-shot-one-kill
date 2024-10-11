function c_healradius(x, y, amount) {
	if collision_circle(x, y, 32, df, false, false) {
		df.hp += amount;
		return true;
	}
	return false;
}