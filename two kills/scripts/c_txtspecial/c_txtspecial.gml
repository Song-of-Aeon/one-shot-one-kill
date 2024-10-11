function c_txtspecial() {
	specialchars += 2;
	i++
	switch string_char_at(msg[talkpos].text, i++) {
		case "c": //color
			var myguy = string_copy(msg[talkpos].text, i, 9);
			var myguy2 = string_replace(myguy, ".", "0");
			if string_digits(myguy2) != myguy2 {
				clr = c_white;
			} else {
				clr = make_color_rgb(real(string_copy(myguy, 1, 3)), real(string_copy(myguy, 4, 3)), real(string_copy(myguy, 7, 3)));
				//log(real(string_copy(myguy, 0, 3)), real(string_copy(myguy, 3, 3)), real(string_copy(myguy, 6, 3)));
				//clr = make_color_rgb(0, 0, 255);
				i += 9;
				specialchars += 9;
			}
			
			//
			break;
		case "s": //speed
			var myguy = string_copy(msg[talkpos].text, i, 3);
			var myguy2 = string_replace(myguy, ".", "0");
			if string_digits(myguy2) != myguy2 {
				talkspeed = talker[0].textspeed;
			} else {
				talkspeed = real(myguy);
				i += 3;
				specialchars += 3;
			}
			break;
		case "l": //size (large)
			var myguy = string_copy(msg[talkpos].text, i, 3);
			var myguy2 = string_replace(myguy, ".", "0");
			if string_digits(myguy2) != myguy2 {
				sizemult = 1;
			} else {
				sizemult = real(myguy);
				i += 3;
				specialchars += 3;
			}
			break;
		case "w": //wait
			var myguy = string_copy(msg[talkpos].text, i, 4);
			i += 4;
			specialchars += 4;
			
			if !waited[waiting] {
				wait = real(myguy);
				waited[waiting] = true;
				drawchars--;
				exit;
			} else {
				//wait = 9999;
			}
			break;
		case "-": //try to skip
			if !skipped {
				selecting = true;
				skipped = true;
				drawchars = talklength;
			}
		case "q": //try to skip
			drawchars = talklength;
			break;
		case "v": //viggle
			var myguy = string_copy(msg[talkpos].text, i, 2);
			var myguy2 = string_replace(myguy, ".", "0");
			if string_digits(myguy) != myguy {
				wigglex = 0;
				wiggley = 0;
			} else {
				wigglex = real(string_copy(myguy, 1, 1));
				wiggley = real(string_copy(myguy, 2, 1));
				i += 2;
				specialchars += 2;
			}
			//
			break;
		case "i": //italics
			var myguy = string_copy(msg[talkpos].text, i, 1);
			if string_digits(myguy) != myguy {
				draw_set_font(restorefont);
			} else {
				i++;
				specialchars++;
				restorefont = draw_get_font()
				draw_set_font(font_get_italic(draw_get_font()));
			}
			break;
		case "x": //shake
			var myguy = string_copy(msg[talkpos].text, i, 2);
			if string_digits(myguy) != myguy {
				shake = 0;
			} else {
				shake = real(myguy);
				i += 2;
				specialchars += 2;
			}
			break;
		case "n": //nod
			if select || pressed[pressing] {
				pressed[pressing] = true;
				pressing++;
				wait = 0;
			} else {
				wait = 9999;
			}
			
			break;
		case "f": //facepic
			var myguy = string_copy(msg[talkpos].text, i, 2);
			talkindex[spritepos] = real(myguy);
			i += 2;
			specialchars += 2;
			break;
		
		
		#region bustedones
		case "j": //actually doesnt work maybe later
			var myguy = string_copy(msg[talkpos].text, i, 1);
			switch myguy {
				case "c":
					draw_set_halign(fa_center);
					break;
				case "r":
					draw_set_halign(fa_right);
					break;
				default:
					draw_set_halign(fa_left);
					break;
			}
			i++;
			specialchars++;
			break;
		case "|": //neither does this
			
			break;
		#endregion
		
		default:
			msg[talkpos].text = c_errorstring();
			break;
	}
}