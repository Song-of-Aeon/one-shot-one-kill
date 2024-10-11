surface_set_target(global.surfaces.HUD);
draw_clear_alpha(c_white, 0);
surface_reset_target();
global.currentbackground.draw();