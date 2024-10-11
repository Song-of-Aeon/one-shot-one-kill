nu enemy("sakuya", s_akuya, 200, c_sakuyastep);

function c_sakuyastep2() {
	statish("timer", 0);
	statish("attack", -1);
	statish("attackamount", 0);
	statish("grav", .14);
	if hp < 500 {
		attack = -1;
		spd.h = 0;
		spd.v = 0;
		attackamount = 0;
		step = c_sakuyastep2;
	}
	log(count, attack);
	switch attack {
		default:
			c
			if ncm(60) {
				if attackamount > irandom(2)+2 {
					attackamount = 0;
					attack = 99;
				} else {
					attackamount++;
					attack = irandom(2)+1;
				}
				log(attack);
				count = 0;
			}
			break;
		case 1:
			c
			if nam(count+10, 20) {
				c_tryteleport(30, floor(point_direction(x, y, df.x, df.y)/180)*180+180, 0);
				
			}
			if ncm(20) {
				c_shoot(x, y, 4, point_me(), bul.circle, c_blue).friendly = false;
				iterations++;
			}
			if iterations >= 3 {
				attack = 0;
				count = 0;
				iterations = 0;
			}
			break;
		case 2:
			c
			y = -999;
			if count == 30 {
				c_shoot(df.x-120, df.y, 3, 0, bul.circle, c_blue);
			}
			if count == 40 {
				c_shoot(df.x+120, df.y, 3, 180, bul.circle, c_blue);
			}
			if count == 90 {
				attack = 0;
				count = 0;
				iterations = 0;
				c_tryteleport(120, irandom(180), 0);
			}
			break;
		case 3:
			spd.v += grav;
			if array_length(ymeeting) && !iterations {
				iterations++;
				spd.v = -4.3;
			}
			if iterations {
				c
				if count == 40 {
					spd.h = 0;
					spd.v = 4;
				}
				if array_length(ymeeting) && iterations == 1 {
					iterations++;
					c_shoot(x, y, 2, 180, bul.circle, c_blue, function() {
						c
						if ncm(3) {
							c_shoot(x, y, 2, 90, bul.circle, c_blue, function() {spd-=.1}).friendly = false;
						}
					}).friendly = false;
					c_shoot(x, y, 2, 0, bul.circle, c_blue, function() {
						c
						if ncm(3) {
							c_shoot(x, y, 2, 90, bul.circle, c_blue, function() {spd-=.1}).friendly = false;
						}
					}).friendly = false;
				}
				if count == 120 {
					spd.v = 0;
					attack = 0;
					count = 0;
					iterations = 0;
				}
			}
			break;
	}
	xmeeting = move_and_collide(spd.h, 0, o_solid);
	ymeeting = move_and_collide(0, spd.v, o_solid);
	if array_length(xmeeting) {
		c_tryteleport(120, irandom(180), 0);
	}
}

function c_sakuyastep() {
	
	if df.x < 160 tiles {
		x = -999;
		exit;
	}
	itsover++;
	if itsover > 30 sec {
		//room_goto(icarus);
	}
	show_debug_message("going");
	statish("timer", 0);
	statish("attack", -1);
	statish("attackamount", 0);
	statish("grav", .14);
	if hp < 500 {
		attack = -1;
		spd.h = 0;
		spd.v = 0;
		attackamount = 0;
		step = c_sakuyastep2;
	}
	log(count, attack);
	switch attack {
		default:
			c
			if ncm(60) {
				if attackamount > irandom(2)+2 {
					attackamount = 0;
					attack = 99;
				} else {
					attackamount++;
					attack = irandom(3)+1;
				}
				log(attack);
				count = 0;
			}
			break;
		case 1:
			c
			if nam(count+10, 20) {
				c_tryteleport(30, floor(point_direction(x, y, df.x, df.y)/180)*180+180, 0);
				
			}
			if ncm(20) {
				c_shoot(x, y, 4, point_me(), bul.circle, c_blue).friendly = false;
				iterations++;
			}
			if iterations >= 3 && nam(count+10, 20) {
				c_tryteleport(120, irandom(180), 0);
				c_shoot(x, y, 2, 180, bul.circle, c_blue, function() {
					c
					if ncm(3) {
						c_shoot(x, y, 2, dir+90, bul.circle, c_blue).friendly = false;
						c_shoot(x, y, 2, dir-90, bul.circle, c_blue).friendly = false;
					}
				}).friendly = false;
				attack = 0;
				count = 0;
				iterations = 0;
			}
			break;
		case 2:
			c
			y = -999;
			if count == 30 {
				c_shoot(df.x-120, df.y, 3, 0, bul.circle, c_blue);
			}
			if count == 40 {
				c_shoot(df.x+120, df.y, 3, 180, bul.circle, c_blue);
			}
			if count == 50 {
				c_shoot(df.x-120, df.y, 3, 0, bul.circle, c_blue);
			}
			if count == 60 {
				c_shoot(df.x+120, df.y, 3, 180, bul.circle, c_blue);
			}
			if count == 110 {
				attack = 0;
				count = 0;
				iterations = 0;
				c_tryteleport(120, irandom(180), 0);
			}
			break;
		case 3:
			spd.v += grav;
			if array_length(ymeeting) && !iterations {
				iterations++;
				spd.v = -4.3;
				y--;
			}
			if iterations {
				c
				if count == 40 {
					spd.h = 0;
					spd.v = 4;
				}
				if array_length(ymeeting) && iterations == 1 {
					iterations++;
					c_shoot(x, y, 2, 180, bul.circle, c_blue, function() {
						c
						if ncm(3) {
							c_shoot(x, y, 2, 90, bul.circle, c_blue, function() {spd-=.1}).friendly = false;
						}
					}).friendly = false;
					c_shoot(x, y, 2, 0, bul.circle, c_blue, function() {
						c
						if ncm(3) {
							c_shoot(x, y, 2, 90, bul.circle, c_blue, function() {spd-=.1}).friendly = false;
						}
					}).friendly = false;
				}
				if count == 90 {
					if x < df.x {
						spd.h = 3;
					} else {
						spd.h = -3;
					}
					spd.v = -4;
					boul[0] = c_shoot(x, y, 0, 0, bul.circle, c_fuchsia, function() {
						c c c c c
						var dude = distabs(count, 32);
						x = o_enemy.x+dude.x;
						y = o_enemy.y+dude.y/3;
					});
					boul[1] = c_shoot(x, y, 0, 0, bul.circle, c_fuchsia, function() {
						c c c c c
						var dude = distabs(count, 32);
						x = o_enemy.x+dude.x;
						y = o_enemy.y+dude.y/3;
					});
					boul[1].count = 90;
					boul[2] = c_shoot(x, y, 0, 0, bul.circle, c_fuchsia, function() {
						c c c c c
						var dude = distabs(count, 32);
						x = o_enemy.x+dude.x;
						y = o_enemy.y+dude.y/3;
					});
					boul[2].count = 180;
					boul[3] = c_shoot(x, y, 0, 0, bul.circle, c_fuchsia, function() {
						c c c c c
						var dude = distabs(count, 32);
						x = o_enemy.x+dude.x;
						y = o_enemy.y+dude.y/3;
					});
					boul[3].count = 270;
				}
				if iterations == 2 {
					spd.h = lerp(spd.h, 0, .05);
					spd.v = lerp(spd.h, 0, .085);
				}
				if count == 180 {
					spd.v = 0;
					attack = 0;
					count = 0;
					iterations = 0;
				}
			}
			break;
		case 4:
			c
			if count == 60 {
				c_shoot(x, y, 4, point_me(), bul.circle, c_fuchsia, function() {
					if collision_circle(x, y, 10, o_solid, false, false) && iterations < 5 {
						iterations++;
						dir = point_me();
					}
				}).friendly = false;
			}
			if count == 90 {
				attack = 0;
				count = 0;
				iterations = 0;
			}
			break;
	}
	xmeeting = move_and_collide(spd.h, 0, o_solid);
	ymeeting = move_and_collide(0, spd.v, o_solid);
	if array_length(xmeeting) {
		c_tryteleport(120, irandom(180), 0);
	}
}




function c_tryteleport(playerdist, ang=0, variation=359) {
	var dude;
	do {
		dude = distabs(ang+irandom(variation), playerdist);
		playerdist--;
	} until !collision_line(df.x, df.y, df.x+dude.x, df.y+dude.y, o_solid, false, true) || playerdist = 0;
	x = df.x+dude.x;
	y = df.y+dude.y;
}