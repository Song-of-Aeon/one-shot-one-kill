// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function lerp_angle(a,b,val){
	return a - (angle_difference(a,b) / (1/ val));
}
