/// @description Insert description here
// You can write your code in this editor
//log(view_get_xport(view_current))
//log(view_get_yport(view_current));
var camx = camera_get_view_x(view_camera[0]);
var camy = camera_get_view_y(view_camera[0]);


if(reflective)
	surface_copy_part(reflectionSurface,0,0,application_surface,((x-camx)*2)-16,((y-camy)*2)-32-16,64,64);
