var xdraw = camera_get_view_x(view_camera[0]);
var ydraw = camera_get_view_y(view_camera[0]);

draw_set_color(c_black);
draw_rectangle(xdraw+16, ydraw+16, xdraw+WIDTH-16, ydraw+64, false);
draw_rectangle(xdraw+16, ydraw+HEIGHT-16, xdraw+WIDTH-16, ydraw+HEIGHT-64, false);

var i;
for (i=0; i<array_length(items); i++) {
	draw_set_alpha(.4+(i==x)*.6);
	draw_sprite(items[i].sprite, 0, xdraw+16+32*(i+1), ydraw+40);
}
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_valign(fa_middle);
draw_text(xdraw+32, ydraw+HEIGHT-48, items[x].name);
draw_text(xdraw+32, ydraw+HEIGHT-32, items[x].desc);
draw_set_valign(fa_top);