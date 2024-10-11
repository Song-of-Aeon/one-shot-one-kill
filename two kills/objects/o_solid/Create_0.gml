//type = tl[5][0];
step = c_null;
draw = draw_self;
count = 0;
iterations = 0;
hp = infinity;
hitboxradius = 8;
inv = false;
defense = 0;
image_speed = 0;
reflective = false;
value = 256;
bloodOverlay = -1;
function setBloodOverlay(){
	bloodOverlay = surface_create(16,16);
	surface_set_target(bloodOverlay)
	draw_clear_alpha(c_black,0.)
	surface_reset_target()
}



function setBloodMask(){
	bloodMask = surface_create(16,16)
	surface_set_target(bloodMask); //mask blood surface using the solid's texture
	draw_clear_alpha(c_black,1);
	gpu_set_colorwriteenable(0,0,0,1);
	gpu_set_blendmode(bm_subtract)
	draw_sprite(sprite_index,image_index,8,8);
	gpu_set_blendmode(bm_normal);
	gpu_set_colorwriteenable(1,1,1,1);
	surface_reset_target()
}
function setReflectionOverlay(){
	reflectionSurface = surface_create(32,32);
}
//mask_index = TT_LCS2;