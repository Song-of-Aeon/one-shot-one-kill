function input_active(input, type) {
	switch type {
		case INPUT.PRESSED:
			if typeof(input) == "string" {
				return keyboard_check_pressed(ord(input));
			} else if input == mb_left || input == mb_right || input == mb_middle || input == mb_any || input == mb_none {
				return mouse_check_button_pressed(input);
			} else {
				return keyboard_check_pressed(input);
			}
			break;
		case INPUT.HELD:
			if typeof(input) == "string" {
				return keyboard_check(ord(input));
			} else if input == mb_left || input == mb_right || input == mb_middle || input == mb_any || input == mb_none {
				return mouse_check_button(input);
			} else {
				return keyboard_check(input);
			}
			break;
		case INPUT.RELEASED:
			if typeof(input) == "string" {
				return keyboard_check_released(ord(input));
			} else if input == mb_left || input == mb_right || input == mb_middle || input == mb_any || input == mb_none {
				return mouse_check_button_released(input);
			} else {
				return keyboard_check_released(input);
			}
			break;
	}
}

enum INPUT {
	PRESSED,
	HELD,
	RELEASED,
}