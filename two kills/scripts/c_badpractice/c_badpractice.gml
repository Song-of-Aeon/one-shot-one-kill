function c_badpractice(line) {
	specialchars += 2;
	i++;
	var shitread = {text: line};
	switch string_char_at(shitread.text, i++) {
		case "c": //color
			var myguy = string_copy(shitread.text, i, 9);
			var myguy2 = string_replace(myguy, ".", "0");
			i += 9;
			specialchars += 9;
			
			//
			break;
		case "s": //speed
			var myguy = string_copy(shitread.text, i, 3);
			var myguy2 = string_replace(myguy, ".", "0");
			if string_digits(myguy2) != myguy2 {
			} else {
				i += 3;
				specialchars += 3;
			}
			break;
		case "l": //size (large)
			var myguy = string_copy(shitread.text, i, 3);
			var myguy2 = string_replace(myguy, ".", "0");
			if string_digits(myguy2) != myguy2 {
			} else {
				i += 3;
				specialchars += 3;
			}
			break;
		case "w": //wait
			i += 4;
			specialchars += 4;
			break;
		case "-": //try to skip
		case "q": //try to skip
			break;
		case "v": //viggle
			var myguy = string_copy(shitread.text, i, 2);
			var myguy2 = string_replace(myguy, ".", "0");
			if string_digits(myguy) != myguy {
			} else {
				i += 2;
				specialchars += 2;
			}
			//
			break;
		case "i": //italics
			var myguy = string_copy(shitread.text, i, 1);
			if string_digits(myguy) != myguy {
			} else {
				i++;
				specialchars++;
			}
			break;
		case "x": //shake
			var myguy = string_copy(shitread.text, i, 2);
			if string_digits(myguy) != myguy {

			} else {

				i += 2;
				specialchars += 2;
			}
			break;
		case "n": //nod
			break;
		case "p": //portrait
			i += 2;
			specialchars += 2;
			break;
		case "j": //actually doesnt work maybe later
			i++;
			specialchars++;
			break;
		case "a": //audio (sound effect)
			break;
		case "f": //in-text function
			break;
		case "|": //neither does this
			
			break;
		case "g": //neither does this
			break;
		#endregion
		
		default:
			shitread.text = c_errorstring();
			break;
	}
}