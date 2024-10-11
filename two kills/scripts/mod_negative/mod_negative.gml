function mod_negative(val, modval) {
	if modval == 0 {
		log(":[");
		return 0;
	}
	if val < 1 {
		while val < 0 {
			val += modval;
		}
		return val;
	} else {
		if(modval == 0){
			return 0
		}
		return val % modval;		
	}
}