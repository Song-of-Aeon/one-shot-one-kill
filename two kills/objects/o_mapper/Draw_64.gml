if !typing {
	draw_set_color(c_aolu);
	draw_text(xdraw+2, ydraw+2, menuoptions[selectedtype].name);
	draw_set_color(c_white);
}
draw_text(xdraw, ydraw, menuoptions[selectedtype].name);
var thispos = c_tilequantizeval(ydraw)+global.tilesize*2;
draw_line_fade(elementxdraw-10, 600, 200, 0, -1);
draw_line_fade(elementxdraw-10, 514+32, 200, 1);
draw_line_fade(0, thispos, 200, 1);
draw_set_color(c_aolu);
var i;
for (i=1; i<8; i++) {
	draw_set_alpha(1/i);
	var name = menuoptions[cycle(selectedtype+i, array_length(menuoptions))].name;
	draw_text(xdraw+i*170, ydraw, name);
}
draw_reset();
iterate historynames to {
	draw_set_color(!i ? c_white : c_aolu);
	draw_set_alpha(1-i/5);
	draw_text(elementxdraw, 514-i*32, historynames[array_length(historynames)-1-i]);
}
draw_reset();
draw_set_color(c_aolu);
iterate futurenames to {
	draw_set_alpha(1-i/5);
	draw_text(elementxdraw, 514+32+i*32, futurenames[array_length(futurenames)-1-i]);
}
draw_reset();
if !typing {
	menuoptions[selectedtype].draw();
	draw_reset();
	var i;
	draw_line_fade(elementxdraw-10, thispos, 200, 0, 1);
}
draw_reset();