function player_grounded(){
	player_movement();
	
	/*if ((move != 0 or hsp != 0) and !place_meeting(x+move,y,parSolid)){
		sprite_index = sMokouRun;
		image_speed = abs(hsp)/max_spd;
		if (floor(image_index) != last_index and image_index >= 1) audio_play_sound(sndMokouStep,1,false);
		last_index = floor(image_index);
		dust_wait = clamp(dust_wait-1,0,dust_delay);
		if (dust_wait == 0){
			instance_create_depth(x+sprite_bbox_left*dir,y+sprite_bbox_bottom-4,80,oDustParticle);
			dust_wait = dust_delay;
		}
	}
	else{
		if (!kDown and v_axis != 1) sprite_index = sMokouIdle;
		else sprite_index = sMokouSquat;
		image_speed = 1;
		last_index = 0;
		dust_wait = 0;
	}*/
	
	if (kAttack and move != 0 and !kDown and !kUp and v_axis == 0){
		state = player_bashing;	
		hsp = bash_spd*move;
	}
	
	if (kAttack and (kDown or v_axis == 1) and move == 0){
		if (instance_exists(oPlayerPlatform)) instance_destroy(oPlayerPlatform);
		instance_create_depth(x+144*dir,y-16,depth+1,oPlayerPlatform);
	}
	
	if (!place_meeting(x,y+1,parSolid)){
		vsp = grav;
		jump_late = 6;
		state = player_falling;	
	}
	
	if (kJump){
		player_jump()
	}
	
	player_collision();
}

//JUMPING
function player_jumping(){
	player_movement();
	
	vsp += jump_grav;
	
	if (!kJumpHeld) vsp /= 2;
	
	if (vsp >= 0){
		state = player_falling;
	}
	
	player_collision();
}

function player_falling(){
	player_movement();
	
	jump_early = clamp(jump_early-1,0,jump_early);
	jump_late = clamp(jump_late-1,0,jump_late);
	
	vsp += grav;
	if (vsp > fall_spd) vsp = fall_spd;
	
	if (kJump){
		if (jump_late > 0){
			player_jump()
		}
		else jump_early = 5;
	}
	
	if (place_meeting(x,y+1,parSolid)){
		if (jump_early){
			player_jump()
		}	
		else{
			player_land()
		}
	}
	
	player_collision();
}

function player_bashing(){
	player_input();
	
	var inst = instance_place(x+dir,y,parSolid);
	if (inst != noone){
		state = player_recoiling;
		hsp = recoil_hsp*-dir;
		vsp = -recoil_vsp;
		if (inst.object_index == oWallBreakable) instance_destroy(inst);
	}
	
	if (kJump){
		player_jump();
	}
	
	if (!place_meeting(x,y+1,parSolid)){
		vsp = grav;
		jump_late = 6;
		state = player_falling;	
	}
	
	player_collision();
}

function player_recoiling(){
	
	vsp += grav;
	if (vsp > fall_spd) vsp = fall_spd;
	
	if (place_meeting(x,y+1,parSolid)){
		player_land();
	}
	
	player_collision();
}
