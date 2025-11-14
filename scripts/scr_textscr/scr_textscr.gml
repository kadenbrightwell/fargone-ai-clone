function scr_set_defaults_for_text(){ 
	var _page_number = TEXTBOX.page_number;
	line_break_pos[0, _page_number] = 999;
	line_break_num[_page_number] = 0;
	line_break_offset[_page_number] = 0;
	
	//variables for every letter/character
	for(var _c = 0; _c<5000; _c++){
		col_1[_c, _page_number] = c_white;
		col_2[_c, _page_number] = c_white;
		col_3[_c, _page_number] = c_white;
		col_4[_c, _page_number] = c_white;
		
		float_text[_c, _page_number] = 0;
		float_dir[_c, _page_number] = _c*20;
		
		shake_text[_c, _page_number] = 0;
		shake_dir[_c, _page_number] = irandom(360);
		shake_timer[_c, _page_number] = irandom(4);
	}
	
	txtb_spr[_page_number] = spr_menu;
	speaker_sprite[_page_number] = noone;
	speaker_side[_page_number] = 1;
	
	snd[_page_number] = EMPTYSOUND;
	snd_gain[_page_number] = 0.5;
	snd_delay[_page_number] = 2;
	snd_count[_page_number] = snd_delay[_page_number];
}

/// @function       scr_text(text, [character], [side], [volume]);
/// @param {String} text
/// @param {String} [character]
/// @param {int}    [side]   1 | -1
/// @param {int}    [volume] 0 -> 1
function scr_text(_text){
	with(TEXTBOX_ID){
		scr_set_defaults_for_text();
	}
	
	text[page_number] = _text;
	
	//get character info
	if(argument_count > 1){
		switch(argument[1]){
			case "blue kid":
				speaker_sprite[page_number] = spr_test_spk;
				txtb_spr[page_number] = spr_menu_blue;
				snd[page_number] = snd_voice_sans_low;
				snd_delay[page_number] = 3;
				break;
			case "blue kid - happy":
				speaker_sprite[page_number] = spr_test_spk_happy;
				txtb_spr[page_number] = spr_menu_blue;
				snd[page_number] = snd_voice_papyrus_mid;
				break;
			case "green kid - sassy":
				speaker_sprite[page_number] = spr_greenkid_spk_sassy;
				txtb_spr[page_number] = spr_menu_green;
				snd[page_number] = snd_voice_undyne_high;
				break;
			
			case "spk_bartender":
				speaker_sprite[page_number] = spr_spk_bartender;
				txtb_spr[page_number] = spr_menu;
				snd[page_number] = snd_voice_sans_low;
				break;
			
			case "cw_drummer":
				//speaker_sprite[page_number] = spr_cw_drummer;
					speaker_sprite[page_number] = spr_cw_guitarist_spk;
				txtb_spr[page_number] = spr_menu;
				snd[page_number] = snd_voice_undyne_high;
				break;
			case "cw_drumset":
				speaker_sprite[page_number] = spr_cw_drumset;
				txtb_spr[page_number] = spr_menu;
				snd[page_number] = snd_voice_sans_low;
				break;
			case "cw_bassist":
				speaker_sprite[page_number] = spr_cw_bassist_spk;
				txtb_spr[page_number] = spr_menu;
				snd[page_number] = snd_voice_papyrus_mid;
				break;
			case "cw_bass":
				speaker_sprite[page_number] = spr_cw_bass;
				txtb_spr[page_number] = spr_menu;
				snd[page_number] = snd_voice_sans_low;
				break;
			case "cw_organist":
				//speaker_sprite[page_number] = spr_cw_organist;
					speaker_sprite[page_number] = spr_cw_bassist_spk;
				txtb_spr[page_number] = spr_menu;
				snd[page_number] = snd_voice_sans_low;
				break;
			case "cw_piano":
				speaker_sprite[page_number] = spr_cw_piano;
				txtb_spr[page_number] = spr_menu;
				snd[page_number] = snd_voice_undyne_high;
				break;
			case "cw_guitarist":
				speaker_sprite[page_number] = spr_cw_guitarist_spk;
				txtb_spr[page_number] = spr_menu;
				snd[page_number] = snd_voice_papyrus_mid;
				break;
				
			case "cw_guitar":
				speaker_sprite[page_number] = spr_cw_guitar;
				txtb_spr[page_number] = spr_menu;
				snd[page_number] = snd_voice_undyne_high;
				break;
			case "cw_microphone":
				speaker_sprite[page_number] = spr_cw_microphone;
				txtb_spr[page_number] = spr_menu;
				snd[page_number] = snd_voice_papyrus_mid;
				break;
				
			case "ice cream man - speakeasy":
				speaker_sprite[page_number] = spr_rando2_face;
				txtb_spr[page_number] = spr_menu;
				snd[page_number] = snd_voice_papyrus_mid;
				break;
			
			case "ice cream man - battle":
				speaker_sprite[page_number] = EMPTYSPRITE;
				txtb_spr[page_number] = EMPTYSPRITE;
				snd[page_number] = snd_voice_undyne_high;
				break;
				
			case "blue house":
				speaker_sprite[page_number] = spr_rando_house;
				txtb_spr[page_number] = spr_menu_blue;
				snd[page_number] = snd_voice_sans_low;
				break;
		}
	}
	
	//side the character is on
	if(argument_count > 2){
		speaker_side[page_number] = argument[2];
	}
	if(argument_count > 3){
		snd_gain[page_number] = argument[3];
	}
	
	page_number++;
}

//text VFX---------------------------

/// @param {int}			1st_char
/// @param {int}			last_char
/// @param {Constant.Color} col1
/// @param {Constant.Color} col2
/// @param {Constant.Color} col3
/// @param {Constant.Color} col4
function scr_text_color(_start, _end, _col1, _col2, _col3, _col4){
	for(var _cc = _start; _cc <= _end; _cc++){
		col_1[_cc, page_number-1] = _col1;
		col_2[_cc, page_number-1] = _col2;
		col_3[_cc, page_number-1] = _col3;
		col_4[_cc, page_number-1] = _col4;
	}
}

		/// @param 1st_char
		/// @param last_char
		/// @param [col]
		function scr_playercolor(_start, _end){
			var _col = PLAYERCOLOR;
			
			if(argument_count>2){ _col = argument[2]; }
			
			for(var _cc = _start; _cc <= _end; _cc++){
				col_1[_cc, page_number-1] = _col;
				col_2[_cc, page_number-1] = _col;
				col_3[_cc, page_number-1] = _col;
				col_4[_cc, page_number-1] = _col;
			}
		}

/// @param 1st_char
/// @param last_char
function scr_text_float(_start, _end){
	for(var _cc = _start; _cc <= _end; _cc++){
		float_text[_cc, page_number-1] = true;
	}
}

/// @description DEPRECIATED: (DO NOT USE)
/// @param 1st_char
/// @param last_char
function scr_text_shake(_start, _end){
	for(var _cc = _start; _cc <= _end; _cc++){
		shake_text[_cc, page_number-1] = true;
	}
}



///@param option
///@param link_id
function scr_option(_option, _link_id){
	option[option_number] = _option;
	option_link_id[option_number] = _link_id;
	
	option_number++;
}

///@param text_id
function create_textbox(_text_id){
	switch(LANG){
		case LANG_ENGLISH:
			TEXTBOX_ID = instance_create_depth(0,0,TEXTBOX_DEPTH,TEXTBOX);
			with(TEXTBOX_ID){
				scr_game_text(_text_id);
			}
			break;
			
		case LANG_SPANISH:
			with(instance_create_depth(0,0,TEXTBOX_DEPTH,TEXTBOX)){
				scr_game_text_sp(_text_id);
			}
			break;
			
		case LANG_JAPANESE:
			with(instance_create_depth(0,0,TEXTBOX_DEPTH,TEXTBOX)){
				scr_game_text_jp(_text_id);
			}
			break;
	}
}

/// @description resets TEXTBOX_CLOSED to false
function reset_textbox_trigger(){
	TEXTBOX_CLOSED=false;
}