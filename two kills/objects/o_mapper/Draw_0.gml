//this is unbearable. i will not do this anymore.
//who thought of this shit

/*draw_set_color(c_white);
draw_text(10, 10, object_get_name(types[selector[0]]));
var i;
switch selectedtype {
	case 0:
		draw_sprite(tl[$datas[selectedtype][selecteddata]].sprite, 0, 20, 40);
		break;
	case 1:
		//log(mp[datas[selectedtype][selecteddata]])
		draw_text(20, 40, mp[datas[selectedtype][selecteddata]].name);
		break;
}
draw_set_alpha(1);
*/

//draw_text(10, 10, object_get_name(types[selectedtype]));
//draw_circle(x, y, 3, false);
draw_set_font(ft_marineconstellation);
draw_set_alpha(.4);
draw_spr(spawn.x, spawn.y, s_when_im);
for (i=-global.tilesize/2; i<roomsize.x; i+=global.tilesize) {
	draw_set_color(make_color_hsv(i%256, 128, 255));
	draw_set_alpha((abs(c_tilequantizeval(mouse_x)-i)<=8)+.1);
	draw_line(i-1, 0-1, i-1, room_height-1);
}
for (i=-global.tilesize/2; i<roomsize.y; i+=global.tilesize) {
	draw_set_color(make_color_hsv(i%256, 128, 255));
	draw_set_alpha((abs(c_tilequantizeval(mouse_y)-i)<=8)+.1);
	draw_line(0-1, i-1, room_width-1, i-1);
}
draw_set_color(c_white);
draw_set_alpha(1);
draw_set_halign(fa_right);
//draw_text(WIDTH-10, HEIGHT-20, st(c_tilequantizeval(mouse_x, -8)/global.tilesize+.5) + ", " + st(c_tilequantizeval(mouse_y, -8)/global.tilesize+.5));
window_set_caption(st(c_tilequantizeval(mouse_x)/global.tilesize) + ", " + st(c_tilequantizeval(mouse_y)/global.tilesize));
draw_set_halign(fa_left);


exit;

var i;
for (i=0; i<array_length(datas[selectedtype]); i++) {
	var localzone = datas[selectedtype][i];
	var localzone2 = datas[selectedtype][i][selector[selectedtype][i]];
	draw_set_alpha(.4+(i == selecteddata && !typing)*.6);
	if selectedtype == 0 && i == 0 {
		//mod_negative(selectedtype+right.hit-left.hit, array_length(types));
		var friender2 = cycle(localzone[selector[selectedtype][i]-1], array_length(localzone));
		var friender3 = cycle(localzone[selector[selectedtype][i]-1], array_length(localzone));
		var friend = tl[$localzone[selector[selectedtype][i]]];
		var friend2 = tl[$friender2];
		var friend3 = tl[$friender3];
		draw_sprite(friend.sprite, 0, x-MIDWID+24+8, y-MIDHEI+25+i*15+8);
		draw_sprite_ext(friend2.sprite, 0, x-MIDWID+24+8-24, y-MIDHEI+25+i*15+8, 1, 1, 0, c_white, .6);
		draw_sprite_ext(friend3.sprite, 0, x-MIDWID+24+8+24, y-MIDHEI+25+i*15+8, 1, 1, 0, c_white, .6);
	} else if (selectedtype == 1 || selectedtype == 3) && i == 0 {
		draw_text(x-MIDWID+24, y-MIDHEI+25+i*15, mp[datas[selectedtype][i][selector[selectedtype][i]]].name);
	} else {
		draw_text(x-MIDWID+24, y-MIDHEI+25+i*15, datas[selectedtype][i][
		selector[selectedtype][i]
		]);
	}
}



