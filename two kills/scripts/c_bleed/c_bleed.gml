// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function c_bleed(x,y,amount,dir){
	repeat(amount){
		var blood = instance_create(x,y,o_blood);
		blood.direction = dir + random_range(-50,50);
	}
	
}