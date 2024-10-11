draw_set_color(c_red);
draw_rectangle(x-8, y-14, x-8+hp/maxhp*16, y-12, false);

if(is_method(draw))
	draw()
else
	method(self,draw)();
