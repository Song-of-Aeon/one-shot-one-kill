function st_textadv() {
	if halting exit;
	draw_set_font(font);
	draw_self();
	draw_set_color(talkers[0].namecolor);
	draw_set_halign(fa_center);
	draw_text(namepos.x, namepos.y, talkers[0].displayname);
	draw_set_halign(fa_left);
	draw_set_color(c_white);
	
	var xpos = 0;
	var lb = 0;
	var ftheight = string_size("O").y;
	
	var textheight = (string_count("#", string_copy(msg[talkpos].text, 1, charpos))+1)*ftheight;
	while textheight >= height {
		lb--;
		textheight -= ftheight;
	}
	color = c_white;
	size = 1;
	angle = 0;
	alpha = 1;
	color = c_white;
	color2 = c_white;
	textpos = new vec2();
	textass();
	var mychar = ""
	for (i=1; i<=charpos; i++) {
		mychar = string_char_at(msg[talkpos].text, i);
		textpos.x = x+xpos-width/2+wiggle.x+shake.y;
		textpos.y = y+lb*ftheight+wiggle.x+shake.y;
		textpass();
		textpos.y -= ftheight*(size-1)/2;
	    if mychar = "#" {
	        lb++;
	        xpos = 0;
	    } else if lb >= 0 {
			draw_text_ext_transformed_colour(textpos.x, textpos.y+3, mychar, 0, 9999, size, size, angle, color, color, color2, color2, alpha/2);
			draw_text_ext_transformed_colour(textpos.x, textpos.y, mychar, 0, 9999, size, size, angle, color, color, color2, color2, alpha);
			xpos += string_width(mychar)*size;
		}
		//log(color);
	}
}