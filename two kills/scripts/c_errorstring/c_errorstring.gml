function c_errorstring() {
	var returnable = "super busted"
	switch irandom(9) {
		case 0:
			returnable = "...But nothing sent.";
			break;
		case 1:
			returnable = "Sorry, Link, I can't fix your code. Come back when you're a little, mmm, smarter.";
			break;
		case 2:
			returnable = "There's nothing there.";
			break;
		case 3:
			returnable = environment_get_variable("USERNAME") + " was killed by Intentional Game Design.";
			break;
		case 4:
			returnable = "SHIT MY PANTS 2014";
			break;
		case 5:
			returnable = "what if i just gave you an empty string instead";
			break;
		case 6:
			returnable = "Uh oh! Program crashed with error type " + string(irandom(234789)) + "! Contact the developers immediately!"
			break;
		case 7:
			returnable = "It didn't work!";
			break;
		case 8:
			returnable = "It's nothing but garbage text."
			break;
		case 9:
			returnable = "do the hokey pokey and turn yourself around"
			break;
	}
	return returnable;
}