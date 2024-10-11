z = 0;
scale = 1;
dir = 0;
image_angle = dir - 90;
spd = 0;
tspd = 0; //turnspeed
hspd = 0;
vspd = 0;
dspd = 0;
acc = 0;
count = 0;
behaviors = NUMBER5;
//draws = c_bulletdraw;
rotate = true;
additive = false;
conditions = array_create(5);
type = global.bullets.small;
grazed = false;
image_alpha = .4;
acount = .4;
alpha = 0;
didit = false;
created = false;
//show_debug_overlay(true);
//depth = 10;
simple = false;
fxxscale = image_xscale*((alpha-image_alpha)*4+1);
fxyscale = image_yscale*((alpha-image_alpha)*4+1);
iterations = 0;
intangible = false;
despawn = c_null;
escapedistance = 50;
designed = false;
addvspd = 0;
color = c_white;
function c_getticks(){
	return global.ticks;
}

event_perform_object(self,ev_step,0);

image_angle = point_direction(xprevious, yprevious, x, y)-90;