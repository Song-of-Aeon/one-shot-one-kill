/// @description Insert description here
// You can write your code in this editor
x = xprevious;
y = yprevious;

var going = distabs(direction,speed);
var ary = move_and_collide(going.x,going.y,o_solid,4);
var additionalGoing = distabs(direction,random_range(-10,10));

x+=additionalGoing.x;
y+=additionalGoing.y;

//instance_destroy()
surface_set_target(other.bloodOverlay);
draw_set_color(c_red)

var xpos = other.x-x+8;
var ypos = other.y-y+8;
xpos -= 8;
xpos = -xpos
xpos +=8;

ypos -=8;
ypos = -ypos;
ypos += 8;
draw_sprite(s_blood,0,xpos,ypos);
surface_reset_target();

instance_destroy()
