draw_self();
draw_set_alpha((delay > 0) ? delay/60 : 1);
draw_set_color(c_yellow);
draw_circle_width(x-1, y-1, 16, 2, true);
draw_set_color(c_white);
draw_set_alpha(1);