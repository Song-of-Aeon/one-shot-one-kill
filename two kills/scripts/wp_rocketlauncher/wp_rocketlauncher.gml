weapongen({
	step: function(input, alt)
	{
		if input.hit
		{
			gunther=c_shoot(DEFINE.x,DEFINE.y,7*not the_world,point_mouse(),bul.big,c_red,function(){
				variable=place_meeting(x,y,o_enemy)
				if variable=true{c_shoot(x,y,0,0,bul.explosion) kys}
				})
			tag("dunlap explosives",gunther);
		}
		
			if alt.hit
			{
					if the_world= false{with_tag("dunlap explosives",function(){spd=0})
					} else{with_tag("dunlap explosives",function(){spd=7})
					}
						the_world=not the_world
						}
	
	
				
	}, 
	draw: function() {
		
	},
	ammo: 0,
	ammomax: 0,
	name: "nicole_dunlap",
	the_world: false,
	sprite: s_deagle,
});