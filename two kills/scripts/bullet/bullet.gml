//ADD INT KNOCKBACK AS AN ARGUMENT

function bullet(name_, sprite_=s_mistake, damage_=1, destructible_=true, friendly_=false, alpha_=1, draw_=c_bulletdraw, rotate_=true, sound_=se_null, onhit_=st_hurt) constructor {
	sound_ = se_null;
	sprite = sprite_;
	colorable = asset_get_index(string(sprite_get_name(sprite_)) + "cc");
	damage = damage_;
	destructible = destructible_;
	friendly = friendly_;
	alpha = alpha_;
	//draw = rotate ? function_append(dospin, draw_) : draw_;
	draw = munction(draw_);
	rotate = rotate_;
	sound = sound_;
	onhit = onhit_;
	variable_struct_set(global.bullets, name_, self);
}

function hitscan(name_, sprite_=s_mistake, damage_=1, destructible_=true, friendly_=false, alpha_=1, draw_=c_bulletdraw, sound_=se_null, onhit_=st_hurt) constructor {
	sprite = sprite_;
	colorable = asset_get_index(string(sprite_get_name(sprite_)) + "cc");
	damage = damage_;
	destructible = destructible_;
	friendly = friendly_;
	alpha = alpha_;
	draw = munction(draw_);
	sound = sound_;
	onhit = onhit_;
	variable_struct_set(global.hitscans, name_, self);
}

function laser(name_, sprite_=s_mistake, damage_=1, destructible_=true, friendly_=false, alpha_=1, draw_=c_bulletdraw, sound_=se_null, onhit_=st_hurt) constructor {
	sprite = sprite_;
	colorable = asset_get_index(string(sprite_get_name(sprite_)) + "cc");
	damage = damage_;
	destructible = destructible_;
	friendly = friendly_;
	alpha = alpha_;
	//draw = rotate ? function_append(dospin, draw_) : draw_;
	draw = munction(draw_);
	sound = sound_;
	onhit = onhit_;
	variable_struct_set(global.lasers, name_, self);
}