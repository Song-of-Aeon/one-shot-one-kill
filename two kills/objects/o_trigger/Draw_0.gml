draw_set_color(c_red);
draw_set_alpha(.2);
//draw_rectangle(x, y, x2, y2, false);
image_xscale = x2-x;
image_yscale = y2-y;
draw_self();
draw_set_alpha(1);
draw_set_color(c_white);