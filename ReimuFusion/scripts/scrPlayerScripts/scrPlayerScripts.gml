function player_input(){
	kRight = max( keyboard_check(vk_right) , keyboard_check(ord("D")) , gamepad_button_check(0,gp_padr), gamepad_button_check(4,gp_padr), 0);
	kLeft = max( keyboard_check(vk_left) , keyboard_check(ord("A")) , gamepad_button_check(0,gp_padl), gamepad_button_check(4,gp_padl), 0);
	kUp = max( keyboard_check(vk_up) , keyboard_check(ord("W")) , gamepad_button_check(0,gp_padu), gamepad_button_check(4,gp_padu), 0);
	kDown = max( keyboard_check(vk_down) , keyboard_check(ord("S")) , gamepad_button_check(0,gp_padd), gamepad_button_check(4,gp_padd), 0);
	kJump = max(keyboard_check_pressed(ord("Z")), keyboard_check_pressed(ord("Y")),keyboard_check_pressed(ord("J")), keyboard_check_pressed(vk_space) , gamepad_button_check_pressed(0,gp_face1), gamepad_button_check_pressed(4,gp_face1), 0);
	kJumpHeld = max(keyboard_check(ord("Z")), keyboard_check(ord("Y")),keyboard_check(ord("J")), keyboard_check(vk_space) , gamepad_button_check(0,gp_face1), gamepad_button_check(4,gp_face1), 0);
	kAttack = max(keyboard_check_pressed(ord("X")),keyboard_check_pressed(ord("K")), keyboard_check_pressed(vk_shift) , gamepad_button_check_pressed(0,gp_face3), gamepad_button_check_pressed(4,gp_face3), 0);
}

function player_movement(){
	player_input();
	#region Directional Variables
	v_axis = sign(round(gamepad_axis_value(0,gp_axislv))+round(gamepad_axis_value(4,gp_axislv)));
	last_move = move;
	move = sign((kRight - kLeft)+round(gamepad_axis_value(0,gp_axislh))+round(gamepad_axis_value(4,gp_axislh)));
	if (move != 0) dir = move;
	image_xscale = dir;
	#endregion
	
	#region Acceleration
	var _accel_diff = clamp(max_spd*move-hsp, min(max_spd*move,0), max(max_spd*move,0));
	_accel_diff = clamp(abs(_accel_diff),0,accel);
	if (dir == sign(hsp) or sign(hsp) == 0) hsp += _accel_diff*move;
	else hsp += deaccel*move;
	
	if (abs(hsp) > max_spd){
		//hsp = max_spd*move;
		hsp -= accel*sign(hsp);
	}

	if (move == 0 and hsp != 0){
		hsp -= deaccel*sign(hsp);
		if (abs(hsp) < deaccel) hsp = 0;
	}
	#endregion
}

function player_collision(){
	
	//Offsets
	var sprite_bbox_top = sprite_get_bbox_top(mask_index) - sprite_get_yoffset(mask_index);
	var sprite_bbox_bottom = sprite_get_bbox_bottom(mask_index) - sprite_get_yoffset(mask_index);
	var sprite_bbox_left = sprite_get_bbox_left(mask_index) - sprite_get_xoffset(mask_index);
	var sprite_bbox_right = sprite_get_bbox_right(mask_index) - sprite_get_xoffset(mask_index);
	
	x += hsp;

	//Snap
	if (place_meeting(x+sign(hsp),y,parSolid)) {
		var wall = instance_place(x+sign(hsp),y,parSolid);
		if hsp > 0 { //right
			x = (wall.bbox_left-1)-sprite_bbox_right;
		} 
		else if hsp < 0 { //left
			x = (wall.bbox_right)-sprite_bbox_left;
		}
		hsp = 0;
	}

	y += vsp;

	//Snap
	if (place_meeting(x,y+sign(vsp),parSolid)) {
		var wall = instance_place(x,y+sign(vsp),parSolid);
		if vsp > 0 { //bottom
			y = (wall.bbox_top-1)-sprite_bbox_bottom;
		} 
		else if vsp < 0 { //top
			y = (wall.bbox_bottom)-sprite_bbox_top;
		}
		vsp = 0;
	}
}

function player_land(){
	state = player_grounded;
}

function player_jump(){
	jump_early = 0;
	jump_late = 0;
	vsp = jump_spd-abs(hsp)/4;	
	state = player_jumping;
}