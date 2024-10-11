function c_reload() {
	var i, j;
	var refilled = 0;
	/*loopmode = {
		playbackSpeed: .5,
	};*/
	for (i=0; i<array_length(df.weapons); i++) {
		for (j=0; j<array_length(df.weapons[i]); j++) {
			refilled += abs(df.weapons[i][j].ammo-df.weapons[i][j].ammomax);
			df.weapons[i][j].ammo = df.weapons[i][j].ammomax;
		}
	}
	se_play(se_reload);
	return refilled;
}