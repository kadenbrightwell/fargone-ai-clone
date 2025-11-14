//room saving
function save_room(){
	var _in = instance_number(obj_item_overworld);
	var _dn = instance_number(obj_red_door);
	var _room_struct = {
		item_num: _in,
		item_data: array_create(_in),
		
		door_num: _dn,
		door_data: array_create(_dn),
	}
	
	//get data from saveable objects
	
		//items
		for(var _i = 0; _i < _in; _i++){
			var _ins = instance_find(obj_item_overworld, _i);
			_room_struct.item_data[_i] = {
				x: _ins.x,
				y: _ins.y,
				i: _ins.item,
			}
		}
		
		//doors
		for(var _d = 0; _d < _dn; _d++){
			var _dins = instance_find(obj_red_door, _d);
			_room_struct.door_data[_d] = {
				x: _dins.x,
				y: _dins.y,
				xs: _dins.image_xscale,
			}
		}
		
	//store room struct in leveldata meant for level
	if(room==rm_inventory_test){ global.level_data.level_1 = _room_struct; }
	if(room==rm_save_test_2){ global.level_data.level_2 = _room_struct; }
}

function load_room(){
	var _room_struct = 0;
	
	//get the struct for room
	if(room==rm_inventory_test){ _room_struct = global.level_data.level_1; }
	if(room==rm_save_test_2){ _room_struct = global.level_data.level_2; }
	
	//EXIT if _room_struct isn't struct
	if(!is_struct(_room_struct)){exit;}
	
	//get rid of old items, remake new
	if(instance_exists(obj_item_overworld)){ instance_destroy(obj_item_overworld); }
	for(var _i = 0; _i < _room_struct.item_num; _i++){
		var _ii = _room_struct.item_data[_i];
		with (instance_create_layer(_ii.x, _ii.y, layer, obj_item_overworld)){ item = _ii.i; }
	}
	
	//get rid of old doors, remake new
	if(instance_exists(obj_red_door)){ instance_destroy(obj_red_door);}
	for(var _d = 0; _d < _room_struct.door_num; _d++){
		var _dd = _room_struct.door_data[_d];
		with (instance_create_layer(_dd.x, _dd.y, layer, obj_red_door)){ image_xscale = _dd.xs; }
	}
}

//overall saving
function save_game(){
	var _sa = array_create(0);
	
	//save important game data
		global.game_data.f = FONT;
		
		global.game_data.v = VOL;
		global.game_data.mv = MUSIC_VOL;
		global.game_data.cv = CHAR_VOL;
		global.game_data.sv = SFX_VOL;
	array_push(_sa, global.game_data);
	
	//save the room you're in
		save_room();
	array_push(_sa, global.level_data);
	
	//stats
		global.player_data.pn = PLAYERNAME;
		global.player_data.px = PLAYER.x;
		global.player_data.py = PLAYER.y;
		global.player_data.pf = PLAYER.facing;
		global.player_data.pr = room_get_name(PLAYER.in_room);
	
		global.player_data.hp = PLAYER.hp;
		global.player_data.hpm = PLAYER.hp_max;
		array_copy(global.player_data.ii, 0, obj_itemmanager.inv, 0, array_length(obj_itemmanager.inv));
	array_push(_sa, global.player_data);
	
	//ACTUAL SAVING
	var _fn = "file0.sasfs";
	var _js = "C" + base64_encode(json_stringify(_sa));
	var _b = buffer_create(string_byte_length(_js)+1, buffer_fixed, 1)
	buffer_write(_b, buffer_string, _js);
	
	buffer_save(_b, _fn);
	buffer_delete(_b);
}

function load_game(){
	//loading saved data
		var _fn = "file0.sasfs";
		if(!file_exists(_fn)){ exit; }
		
		//load buffer, get json, delete buffer
		var _b = buffer_load(_fn);
		var _js = buffer_read(_b, buffer_string);
		buffer_delete(_b);
		
		//"unstringify" and get arr
		var _la = json_parse(base64_decode(string_copy(_js, 2, string_length(_js))));
		
	//set data in game
		global.game_data = array_get(_la, 0);
			var _g = global.game_data;
		global.level_data = array_get(_la, 1);
		global.player_data = array_get(_la, 2);
			var _p = global.player_data;
		
		//setting data
			//game
				global.font_main = _g.f;
				
				global.vol = _g.v;
				global.mvol = _g.mv;
				global.cvol = _g.cv;
				global.svol = _g.sv;
	
			//player
				room_goto(asset_get_index(_p.pr));
				
				if(instance_exists(PLAYER)){ instance_destroy(PLAYER); }
				with(instance_create_layer(_p.px, _p.py, layer, PLAYER)){
					facing = _p.pf;
					
					name = _p.pn;
					
					hp = _p.hp;
					hp_max = _p.hpm;
					array_copy(obj_itemmanager.inv, 0, _p.ii, 0, array_length(_p.ii));
				}
				
				load_room();
				
				
}