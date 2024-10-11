function lb_auto(str, maxlength) {
	var possible = true;
	var j;
	var xpos = 0;
	var extrapos = 0;
	var lbcount = 0;
	for (i=1; i<=string_length(str); i++) {
		if string_char_at(str, i) == "#" {
			lbcount = 0;
			xpos = 0;
		}
		if xpos >= maxlength {
			for (j=0; j<lbcount; j++) {
				extrapos += string_width(string_char_at(str, i-j));
				if string_char_at(str, i-j) == " " && lbcount-j < maxlength {
					str = string_insert("#", str, i-j);
					str = string_delete(str, i-j+1, 1);
					possible = true;
					break;
				}
				possible = false;
			}
			xpos = extrapos;
			extrapos = 0;
			lbcount = j;
		}
		lbcount++;
		xpos += string_width(string_char_at(str, i));
	}
	return str;
}