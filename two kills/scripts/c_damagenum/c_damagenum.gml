function c_damagenum(target_, amount) {
	var dude = noone;
	var chump = noone;
	with o_damagenumbers {
		if owner == target_ dude = id;
	}
	if !dude || true {
		chump = instance_create(target_.x, target_.y, o_damagenumbers);
		chump.owner = target_;
	} else {
		chump = dude;
		chump.x = target_.x;
		chump.y = target_.y;
		chump.decay = 0;
	}
	chump.spd.h = random(4)-2;
	chump.spd.v = -random(2)-4;
	chump.amount += amount;
	return chump;
}