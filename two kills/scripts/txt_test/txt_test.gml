function txt_test() { //dont forget to rename scripts when you copy them
	
	msg = msglang([ //mglang exists so you can have alternate versions of dialogue per language (or for other variations)
	
	//txt("it's a beautiful day outside.", u, u, u, function() {textbox_create(txt_testwo, u, u, false)}),
	txt("it's a beautiful day outside.", SANS.NOTHING),
	txt("birds are singing, flowers are blooming...", SANS.NOTHING),
	txt("on days like these, kids like you...", SANS.NOTHING),
	txt("...Should probably change the default textscript.", SANS.NOTHING),
	
	],[
	
	txt(""),
	
	])
	
	endevent = c_null;
}

function txt_testwo() { //im testing multiple textboxes at once
	y -= 200;
	msg = msglang([
	
	txt("y'know, the surface isn't much better than here."),
	txt("people are dying, flowers are wilting..."),
	txt("i hate to say it, but kids like you..."),
	txt("...Should probably change the default textscript."),
	
	],[
	
	txt(""),
	
	])
	
	endevent = c_null;
}