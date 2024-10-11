function st_drawui() {
	var size = 16;
	var margin = 8;
	draw_set_color(c_white);
	draw_line_width_color(margin+size, margin+size/2, margin+size*5, margin+size/2, 2, c_maroon, c_red);
	draw_line_width_color(margin+size*5, margin, margin+size*5, margin+size, 2, c_white, c_white);
	draw_text(margin+size*5+4, margin, hp);
	draw_set_halign(fa_center);
	var altinteract = 0;
	iterate weapons to {
		if !array_length(weapons[i]) continue;
		var using = i==eqwp;
		if using altinteract = altpos else altinteract = 0;
		var ammo = weapons[i][altinteract].ammo/weapons[i][altinteract].ammomax;
		draw_set_color(using ? c_yellow : c_olive);
		draw_line_width(i*size+margin+size/2, i*size+margin+size, i*size+margin+size/2, i*size+margin+size*((using*3.5+.5)*ammo+1), 2);
		draw_set_color(using ? c_white : c_grey);
		draw_rectangle(i*size+margin, i*size+margin, i*size+margin+size, i*size+margin+size, false);
		//draw_line(i*size+margin, i*size+margin+size*5, i*size+margin, i*size+margin+size*5);
		draw_line_width(i*size+margin, i*size+margin+size*((using*3.5+.5)*ammo+1), i*size+margin+size, i*size+margin+size*((using*3.5+.5)*ammo+1), 2);
		
		draw_text(i*size+margin+size/2, i*size+margin+size*((using*3.5+.5)*ammo+1)+4, weapons[i][altinteract].ammo);
	}
	draw_set_halign(fa_left);
	//draw_line_width(margin+size/2, margin+size, margin+size/2, margin+size*5, 2);
}


function st_dcdrawui() {
	var xdraw = camera_get_view_x(view_camera[0]);
	var ydraw = camera_get_view_y(view_camera[0]);
	draw_set_alpha(.45);
	draw_rectangle(xdraw+8, ydraw+HEIGHT*.7, xdraw+WIDTH*.3, ydraw+HEIGHT-8, false);
	draw_set_alpha(1);
	draw_set_color(c_red);
	draw_rectangle(xdraw+16, ydraw+HEIGHT*.94-8-16, xdraw+16+(WIDTH*.3-24)*(hp/maxhp), ydraw+HEIGHT*.97-8-16, false);
	draw_set_color(stamina >= 1 ? c_cyan : c_teal);
	draw_rectangle(xdraw+16, ydraw+HEIGHT*.97-16, xdraw+16+(WIDTH*.3-24)*(stamina/3), ydraw+HEIGHT-16, false);
	draw_set_color(c_white);
	draw_text(xdraw+24, ydraw+HEIGHT*.7+8, weapons[eqwp][altpos].name);
}
