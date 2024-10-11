function c_pushhistory(name) {
	with o_mapper {
		if undone {
			/*log(array_length(history)-undone);
			log(array_length(history));
			array_delete(history, array_length(history)-undone, undone);
			array_delete(historynames, array_length(historynames)-undone, undone);*/
			undone = 0;
			future = [];
			futurenames = [];
		}
		actionnum++;
		var histname = roomname+"_hist_"+st(actionnum);
		var friend = c_saveroom(histname, roomname, true);
		//log(histname);
		array_push(history, friend);
		array_push(historynames, name);
		if array_length(history) > historycap {
			array_delete(history, 0, 1);
			array_delete(historynames, 0, 1);
		}
		log("history recorded");
	}
}

function undo() {
	with o_mapper {
		//reloadMaps();
		if !array_length(history) return false;
		if !undone {
			c_pushhistory("started undo");
			var friend = array_pop(history);
			array_push(future, friend);
			array_push(futurenames, array_pop(historynames));
			//array_pop(history);
			//array_pop(historynames);
		}
		undone++;
		/*var grabfrom = array_length(history)-undone;
		log(grabfrom);
		log(array_length(history));*/
		grabfrom = true;
		if grabfrom {
			//var friend = history[grabfrom];
			var friend = array_pop(history);
			array_push(future, friend);
			array_push(futurenames, array_pop(historynames));
			c_loadmap(friend);
			instance_destroy(DEFINE);
			with o_enemy {
				step = c_null;
			}
			with o_mapper {
				roomname = friend.roomname;
				roomsize = friend.roomsize;
				//triggers = friend.triggers;
				spawn = friend.spawn;
				bg = global.backgrounds[$friend.bg];
			}
			undone++;
			return true;
		} else {
			//undone--;
			return false;
		}
	}
}

/*mungus = {};
mungus.if = 5;
log(mungus.if);*/

function redo() {
	with o_mapper {
		log(futurenames[array_length(futurenames)-1]);
		if !array_length(future) return false;
		//var friend = history[array_length(history)-undone];
		var friend = array_pop(future);
		array_push(history, friend);
		array_push(historynames, array_pop(futurenames));
		c_loadmap(friend);
		instance_destroy(DEFINE);
		with o_enemy {
			step = c_null;
		}
		with o_mapper {
			roomname = friend.roomname;
			roomsize = friend.roomsize;
			//triggers = friend.triggers;
			spawn = friend.spawn;
			bg = global.backgrounds[$friend.bg];
		}
		return true;
	}
}