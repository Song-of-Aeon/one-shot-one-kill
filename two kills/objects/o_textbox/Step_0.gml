c_input();
wait--;

if skip.hold {
	select = true;
	wait = 0;
}

if interim {
	textline_next();
	exit;
}

skip = select;
if back halting = !halting;
if select halting = false;

var i;
for (i=array_length(talkers)-1; i>=0; i--) {
	talkers[i].step();
}

if wait || halting exit;

count++;

if charpos < string_length(msg[talkpos].text) {
	var i;
	for (i=0; i<talkspeed; i++) {
		var flatpos = floor(charpos);
		tevents[flatpos+i].event(tevents[flatpos+i].argstr);
		tevents[flatpos+i].event = c_null;
	}
	charpos += talkspeed;
	
	if ncm(4+round((1/talkspeed)/4)) se_play(talkers[0].talksound, random(1)+.5, .25);
	if skip charpos = string_length(msg[talkpos].text);
} else {
	isdone = true;
	if !advance gotime = true;
    if select textboxes_complete();
	if gotime {
		gotime = false;
		if talkpos < array_length(msg)-1 {
			textline_next();
		} else {
			endevent();
			instance_destroy();
		}
	}
}

if !surface_exists(textsurf) {
	textsurf = surface_create(room_width, room_height);
}