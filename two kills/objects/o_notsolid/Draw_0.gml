//surface_set_target(global.gameplay);
//image_blend = make_color_hsv(0, 0, value);
//log(draw);
/*if(!surface_exists(bloodOverlay)){
	setBloodOverlay();
	setBloodMask()
	setReflectionOverlay()
}*/
//if(reflective)
//draw_surface_ext(reflectionSurface,x-8,y+8,0.5,-0.5,0,c_white,1);

draw();
exit;
surface_set_target(bloodOverlay); //mask blood surface using the solid's texture
gpu_set_colorwriteenable(0,0,0,1);
gpu_set_blendmode(bm_subtract)
draw_surface(bloodMask,0,0);
gpu_set_blendmode(bm_normal);
gpu_set_colorwriteenable(1,1,1,1);
surface_reset_target()

draw_surface(bloodOverlay,x-8,y-8);
if instance_exists(o_mapper) {
	draw_set_color(c_white);
	draw_text(x, y, depth);
}


//draw_sprite(s_mistake,0,x,y);
//draw_point(x,bbox_top-32);
//surface_reset_target();