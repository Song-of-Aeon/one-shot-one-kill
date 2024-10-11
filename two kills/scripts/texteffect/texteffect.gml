function texteffect(char_, arglength_, event_=c_null, textmod_=c_null) constructor {
	char = char_;
	arglength = arglength_;
	event = event_;
	textmod = textmod_;
	global.texteffects[$char_] = self;
}

//event is munctioned to o_textbox
//textmod is munctioned to the charspecial
//MASSIVE PROBLEM: THINGS DONT WORK ABOVE TALKSPEED ONE
global.texteffects = {};
nu texteffect("w", 4, function(argstr) { //(W)ait, 4, int
	wait = real(argstr);
});
nu texteffect("c", 9, u, function(argstr) { //(C)olor, 9, R/255 G/255 B/25	
	color = make_color_rgb(real(string_copy(argstr, 1, 3)), real(string_copy(argstr, 4, 3)), real(string_copy(argstr, 7, 3)));
	color2 = make_color_rgb(real(string_copy(argstr, 1, 3)), real(string_copy(argstr, 4, 3)), real(string_copy(argstr, 7, 3)));
});
nu texteffect("r", 0, u, function(argstr) { //(R)ainbow, 0
	color = make_color_hsv(256-(count*4+i*10)%256, 255, 255);
	color2 = make_color_hsv(256-(count*4+i*10)%256, 255, 255);
});
nu texteffect("s", 3, function(argstr) { //(S)peed, 3, int|float
	talkspeed = real(argstr);
});
nu texteffect("l", 3, u, function(argstr) { //(L)argeness, 3, int|float
	size = real(argstr);
});
nu texteffect("b", 1, u, function(argstr) { //(B)ang, 1, int
	var spd = real(argstr)/5.5;
	size = max(3-((count*talkspeed)*spd-i*spd), 1);
	log(size);
});
/*nu texteffect("b", 1, u, function(argstr) { //(B)ang, 1, int
	var spd = real(argstr)/4;
	size = clamp(size+2-((count*talkspeed)*spd-i*spd), 0, 3);
	log(size);
});*/
nu texteffect("-", 0, function(argstr) { //(-)skipping-, 0
	charpos = string_length(msg[talkpos].text);
});
nu texteffect("v", 2, u, function(argstr) { //(V)viggle, 2, xint yint
	wiggle.x = sinmult(count+i, 40, real(string_copy(argstr, 1, 1)));
	wiggle.y = cosmult(count+i, 40, real(string_copy(argstr, 2, 1)));
});
nu texteffect("x", 2, u, function(argstr) { //(X)hake, 2, xint yint
	var xsize = real(string_copy(argstr, 1, 1));
	var ysize = real(string_copy(argstr, 2, 1));
	shake.x = irandom(xsize)-xsize/2;
	shake.y = irandom(ysize)-ysize/2;
});
nu texteffect("f", 3, function(argstr) { //(F)acepic, 2, int/99, talker/9
	talkers[string_copy(argstr, 3, 1)].index = real(string_copy(argstr, 1, 2));
});