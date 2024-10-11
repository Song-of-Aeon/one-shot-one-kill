function load_tevents(str, textbox, teventarray=tevents) {
	var i;
	for (i=1; i<=string_length(str); i++) {
		if string_char_at(str, i) == "|" {
			theffect = global.texteffects[$string_char_at(str, i+1)];
			var args = string_copy(str, i+2, theffect.arglength);
			tevents[i] = new tevent(method(textbox, theffect.event), theffect.textmod, args);
			//show_debug_message(string_char_at(str, i+1));
			//method(textbox, theffect.event)();
			//show_debug_message(color);
			str = string_delete(str, i, theffect.arglength+2);
			i--;
			
		}
	}
	return str;
}