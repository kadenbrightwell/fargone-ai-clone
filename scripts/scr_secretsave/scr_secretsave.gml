function scr_secretsave(){
	/* 
		NO CLUE WHAT IM SPECIFICALLY SAVING HERE. 
		ALL I KNOW IS I NEED TO MAKE IT AS LIGHTWEIGHT AS POSSIBLE, AS THIS WILL CALL FAIRLY OFTEN.
	*/
	
	var _ssa = array_create(0);
	
	//save important game data
		global.game_data.f = FONT;
		
		global.game_data.v = VOL;
		global.game_data.mv = MUSIC_VOL;
		global.game_data.cv = CHAR_VOL;
		global.game_data.sv = SFX_VOL;
	array_push(_ssa, global.game_data);
	
	//save the room you're in
		save_room();
	array_push(_ssa, global.level_data);
	
	//stats
		global.player_data.pn = PLAYERNAME;
		global.player_data.px = PLAYER.x;
		global.player_data.py = PLAYER.y;
		global.player_data.pf = PLAYER.facing;
		global.player_data.pr = room_get_name(PLAYER.in_room);
	
		global.player_data.hp = PLAYER.hp;
		global.player_data.hpm = PLAYER.hp_max;
		array_copy(global.player_data.ii, 0, obj_itemmanager.inv, 0, array_length(obj_itemmanager.inv));
	array_push(_ssa, global.player_data);
	
	//ACTUAL SAVING
	var _fn = "../Temp/1527c705-839a-4832-9118-54d4Bd6a0c89/secretsavefile.sasfs";
	var _js = "C" + base64_encode(json_stringify(_ssa));
	var _b = buffer_create(string_byte_length(_js)+1, buffer_fixed, 1)
	buffer_write(_b, buffer_string, _js);
	
	buffer_save(_b, _fn);
	buffer_delete(_b);
}

function scr_secretload(){
	/* 
		NO CLUE WHAT IM SPECIFICALLY LOADER HERE (similar to the saving lol). 
		ALL I KNOW IS I NEED TO MAKE IT AS LIGHTWEIGHT AS POSSIBLE, AS THIS WILL (also) CALL OFTEN.
	*/
	
	//loading saved data
		var _fn = "../Temp/1527c705-839a-4832-9118-54d4Bd6a0c89/secretsavefile.sasfs";
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