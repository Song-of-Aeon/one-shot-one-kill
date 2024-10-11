//CONSTS
max_spd = 4.5;
accel = 0.8;
deaccel = 0.8;
jump_spd = -10;
fall_spd = 12;
grav = 0.4;
jump_grav = grav;
bash_spd = 7;
recoil_hsp = 2;
recoil_vsp = 6;

//VARS
depth = 50;
state = player_grounded;
hsp = 0;
vsp = 0;
move = 0;
last_move = 0;
jump_early = 0;
jump_late = 0;
dir = 1;

last_sprite = sprite_index;