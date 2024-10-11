global.thumbnailsize = new vec2(200, 200);

function c_saveroom(filename, roomname_=u, returnearly=false) {
	if roomname_ == u roomname_ = filename;
	if roomname == "" {
		filename = "untitled";
	}
	var theroom = {
		roomsize: roomsize,
		roomname: roomname_,
		guys: deep_copy(guys),
		enemies: deep_copy(enemies),
		triggers: deep_copy(triggers),
		spawn: spawn,
		bg: bg.name,
		thumbnail: s_mistake,
	}
	var surf = surface_create(global.thumbnailsize.x, global.thumbnailsize.y);
	surface_copy_part(surf, 0, 0, application_surface, spawn.x+(global.tilesize/2), spawn.y+(global.tilesize/2), global.thumbnailsize.x, global.thumbnailsize.y);
	var buff = buffer_create(64, buffer_grow, 1);
	buffer_get_surface(buff, surf, 0);
	theroom.thumbnail = buffer_base64_encode(buff, 0, buffer_get_size(buff));
	//log(thumbnail);
	with theroom {
		iterate guys to {
			guys[i] = {
				x: guys[i].x,
				y: guys[i].y,
				tileset: guys[i].tileset,
				index: guys[i].index,
				links: guys[i].links,
				depth: guys[i].depth,
			}
			/*if typeof(guys[i].sprite) == "string" continue;
			guys[i].sprite = sprite_get_name(guys[i].sprite);
			guys[i].step = script_get_name(guys[i].step);
			guys[i].draw = script_get_name(guys[i].draw);
			guys[i].ontouch = script_get_name(guys[i].ontouch);
			guys[i].onstay = script_get_name(guys[i].onstay);
			guys[i].onleave = script_get_name(guys[i].onleave);*/
		}
		iterate enemies to {
			enemies[i] = {
				x: enemies[i].x,
				y: enemies[i].y,
				name: enemies[i].name,
				links: enemies[i].links,
				depth: enemies[i].depth,
				variation: enemies[i].variation,
			}
			/*if typeof(enemies[i].sprite) == "string" continue;
			enemies[i].sprite = sprite_get_name(enemies[i].sprite);
			enemies[i].step = script_get_name(enemies[i].step);
			enemies[i].draw = script_get_name(enemies[i].draw);
			enemies[i].create = script_get_name(enemies[i].create);*/
		}
		
		iterate triggers to {
			triggers[i] = {
				x: triggers[i].x,
				y: triggers[i].y,
				x2: triggers[i].x2,
				y2: triggers[i].y2,
				target: triggers[i].target,
				targetx: triggers[i].targetx,
				targety: triggers[i].targety,
				enter: script_get_name(triggers[i].enter),
				stay: script_get_name(triggers[i].stay),
				leave: script_get_name(triggers[i].leave),
				step: script_get_name(triggers[i].step),
			}
			log(triggers[i]);
		}
	}
	if returnearly {
		return theroom;
	}
	var thefile = file_text_open_write(filename+".aeon"); //awesome epic object notation
	file_text_write_string(thefile, json_stringify(theroom));
	file_text_close(thefile);
	log("saved!");
}







/*&
function c_saveroom(name) {
	global.doingguys = 0;
	global.thename = name;
	log("we go");
	var dude = file_text_open_write(name + ".yy");
	log("we GO");
	file_text_write_string(dude, "{\n\"isDnd\": false,\n\"volume\": 1.0,\n\"parentRoom\": null,\n");
	file_text_write_string(dude, "\"views\": [\n{\"inherit\":false,\"visible\":true,\"xview\":0,\"yview\":0,\"wview\":320,\"hview\":240,\"xport\":0,\"yport\":0,\"wport\":960,\"hport\":720,\"hborder\":32,\"vborder\":32,\"hspeed\":-1,\"vspeed\":-1,\"objectId\":null,},\n],\n")
	file_text_write_string(dude, "\"layers\": [\n{\"instances\":[\n");
	log("begin instances");
	with all {
		if object_index != o_mapper {
			var oname = object_get_name(object_index);
			myname = global.thename+st(global.doingguys);
			global.doingguys++;
			if object_index == o_trigger {
				file_text_write_string(dude, "{\"properties\":[],\"isDnd\":false,\"objectId\":{\"name\":\""+oname+"\",\"path\":\"objects/"+oname+"/"+oname+".yy\",},\"inheritCode\":false,\"hasCreationCode\":true,\"colour\":4294967295,\"rotation\":0.0,\"scaleX\":"+st(x2-x)+".0,\"scaleY\":"+st(y2-y)+".0,\"imageIndex\":0,\"imageSpeed\":1.0,\"inheritedItemId\":null,\"frozen\":false,\"ignore\":false,\"inheritItemSettings\":false,\"x\":"+st(x)+".0,\"y\":"+st(y)+".0,\"resourceVersion\":\"1.0\",\"name\":\""+myname+"\",\"tags\":[],\"resourceType\":\"GMRInstance\",},\n");
			} else {
				file_text_write_string(dude, "{\"properties\":[],\"isDnd\":false,\"objectId\":{\"name\":\""+oname+"\",\"path\":\"objects/"+oname+"/"+oname+".yy\",},\"inheritCode\":false,\"hasCreationCode\":true,\"colour\":4294967295,\"rotation\":0.0,\"scaleX\":1.0,\"scaleY\":1.0,\"imageIndex\":0,\"imageSpeed\":1.0,\"inheritedItemId\":null,\"frozen\":false,\"ignore\":false,\"inheritItemSettings\":false,\"x\":"+st(x)+".0,\"y\":"+st(y)+".0,\"resourceVersion\":\"1.0\",\"name\":\""+myname+"\",\"tags\":[],\"resourceType\":\"GMRInstance\",},\n");
			}
		}
	}
	log("done instances");
	file_text_write_string(dude, "\n      ],\"visible\":true,\"depth\":0,\"userdefinedDepth\":false,\"inheritLayerDepth\":false,\"inheritLayerSettings\":false,\"gridX\":16,\"gridY\":16,\"layers\":[],\"hierarchyFrozen\":false,\"resourceVersion\":\"1.0\",\"name\":\"Instances\",\"tags\":[],\"resourceType\":\"GMRInstanceLayer\",},\n    {\"spriteId\":null,\"colour\":4283190348,\"x\":0,\"y\":0,\"htiled\":false,\"vtiled\":false,\"hspeed\":0.0,\"vspeed\":0.0,\"stretch\":false,\"animationFPS\":15.0,\"animationSpeedType\":0,\"userdefinedAnimFPS\":false,\"visible\":true,\"depth\":100,\"userdefinedDepth\":false,\"inheritLayerDepth\":false,\"inheritLayerSettings\":false,\"gridX\":32,\"gridY\":32,\"layers\":[],\"hierarchyFrozen\":false,\"resourceVersion\":\"1.0\",\"name\":\"Background\",\"tags\":[],\"resourceType\":\"GMRBackgroundLayer\",},\n  ],\n  \"inheritLayers\": false,\n  \"creationCodeFile\": \"\",\n  \"inheritCode\": false,\n  \"instanceCreationOrder\": [\n");
	log("begin instance orders");
	with all {
		if object_index != o_mapper {
			var oname = object_get_name(object_index);
			global.doingguys++;
			file_text_write_string(dude, "{\"name\":\""+myname+"\",\"path\":\"rooms/"+name+"/"+name+".yy\",},\n");
		}
	}
	log("done instance orders");
	file_text_write_string(dude, "],\n  \"inheritCreationOrder\": false,\n  \"sequenceId\": null,\n  \"roomSettings\": {\n    \"inheritRoomSettings\": false,\n    \"Width\": 320,\n    \"Height\": 240,\n    \"persistent\": false,\n  },\n  \"viewSettings\": {\n    \"inheritViewSettings\": false,\n    \"enableViews\": true,\n    \"clearViewBackground\": false,\n    \"clearDisplayBuffer\": true,\n  },\n  \"physicsSettings\": {\n    \"inheritPhysicsSettings\": false,\n    \"PhysicsWorld\": false,\n    \"PhysicsWorldGravityX\": 0.0,\n    \"PhysicsWorldGravityY\": 10.0,\n    \"PhysicsWorldPixToMetres\": 0.1,\n  },\n  \"parent\": {\n    \"name\": \"Rooms\",\n    \"path\": \"folders/Rooms.yy\",\n  },\n  \"resourceVersion\": \"1.0\",\n  \"name\": \""+name+"\",\n  \"tags\": [],\n  \"resourceType\": \"GMRoom\",\n}");
	log("done room");
	file_text_close(dude);
	log("creation coding");
	with all {
		if object_index != o_mapper {
			var guy = file_text_open_write("InstanceCreationCode_"+myname+".gml");
			switch object_index {
				case o_solid:
					//file_text_write_string(guy, @"c_maketile("+st(x)+", "+st(y)+", tl[$\""+type.name+"\""+@"])
					file_text_write_string(guy, "c_maketile(x, y, +tl[$\""+type.name+"\""+@"])
instance_destroy();");
					break;
				case o_trigger:
					file_text_write_string(guy, @"c_maketrigger("+st(x)+", "+st(y)+", "+st(x2)+", "+st(y2)+@", function() {
	c_mapchange(mp["+st(target)+"], "+st(targetx)+", "+st(targety)+@");
})
instance_destroy();");
					break;
			}
			file_text_close(guy);
		}
	}
	log("done");
	return "LOL";
}


/*var solidcreation = @"
	c_maketile("+st(x)+", "+st(y)+", tl[$"+type.name+@"])
	instance_destroy();
";
	
var triggercreation = @"
	c_maketrigger("+st(x)+", "+st(y)+", "+st(x2)+", "+st(y2)+@", function() {
		c_mapchange(mp["+st(target)+"], "+st(10 tiles)+", "+st(10 tiles)+@");
	})
	instance_destroy();
";*/