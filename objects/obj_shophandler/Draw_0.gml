/*

var _draw_shop_text = function(){
	shop_text_x = camera_get_view_x(view_camera[0]);
	shop_text_y = camera_get_view_y(view_camera[0]) + 144;
	
	//--------------------setup
	if(!shop_text_setup){
		shop_text_setup = true;
		draw_set_font(FONT);
		draw_set_valign(fa_top);
		draw_set_halign(fa_left);
	
		//loop through pages
		for(var _p = 0; _p < text_page_number; _p++){
			//find num chars on page and store in arr
			shop_text_length[_p] = string_length(shop_text[_p]);
		
			//get x pos for textbox
			portrait_x_offset[_p] = 8;
			text_x_offset[_p] = 44;
		
			//set chars and finding text breaks
			for(var _c = 0; _c < shop_text_length[_p]; _c++){
				var _char_pos = _c+1;
				//store chars to arr
				st_char[_c, _p] = string_char_at(shop_text[_p], _char_pos);
			
				//get width of line
				var _txt_up_to_char = string_copy(shop_text[_p], 1, _char_pos);
				var _current_text_w = string_width(_txt_up_to_char)-string_width(st_char[_c, _p]);
			
				//get last free space
				if(st_char[_c, _p] == " "){
					st_last_free_space = _char_pos+1;
				}
			
				//get the line breaks
				if((_current_text_w - line_break_offset[_p]) > line_width){
					line_break_pos[line_break_num[_p],_p] = st_last_free_space;
					line_break_num[_p]++;
					var _txt_up_to_last_space = string_copy(shop_text[_p], 1, st_last_free_space);
					var _last_free_space_string = string_char_at(shop_text[_p], st_last_free_space);
					line_break_offset[ _p] = string_width(_txt_up_to_last_space)-string_width(_last_free_space_string);
				}
			}
		
			//getting char coords
			for(var _c = 0; _c < shop_text_length[_p]; _c++){
				var _char_pos = _c+1;
				var _txt_x = shop_text_x+text_x_offset[_p] + st_border;
				var _txt_y = shop_text_y + st_border;
				//get width of line
				var _txt_up_to_char = string_copy(shop_text[_p], 1, _char_pos);
				var _current_text_w = string_width(_txt_up_to_char)-string_width(st_char[_c, _p]);
				var _txt_line = 0;
				//compensate string breaks
				for(var _lb = 0; _lb < line_break_num[ _p]; _lb++){
					if(_char_pos >= line_break_pos[_lb, _p]){
						var _string_copy = string_copy(shop_text[_p], line_break_pos[_lb, _p], _char_pos-line_break_pos[_lb, _p]);
						_current_text_w = string_width(_string_copy);
					
						//record the line this character should be on
						_txt_line = _lb+1;
					}
				}
			
				//add to the x and y coords based on new info
				st_char_x[_c, _p] = _txt_x + _current_text_w;
				st_char_y[_c, _p] = _txt_y + _txt_line*st_line_sep;
			}
		}
	}
	
	//---------------typing the text
	if(st_text_pause_timer<=0){
		if(st_draw_char < shop_text_length[st_page]){
			st_draw_char = clamp(st_draw_char + st_text_spd, 0, shop_text_length[st_page]);
			var _check_char = string_char_at(shop_text[st_page], st_draw_char);
			if(_check_char=="." || _check_char=="," || _check_char=="!" || _check_char=="?"){
				st_text_pause_timer = st_text_pause_time;
			} else {
				//typing sound
				if(snd_count[page]<snd_delay[st_page]){
					snd_count[page]++;
				} else {
					snd_count[page]=0;
					audio_play_sound(snd[st_page], 0, false, snd_gain[page]*CVOL);
				}
			}
		}
	} else { st_text_pause_timer--; }

	//-------------------flip through pages
	if(PLAYER_INTERACT){
		//if typing is done
		if(st_draw_char==shop_text_length[st_page]){
			//next page
			if(st_page<text_page_number-1){
				st_page++;
				st_draw_char=0;
			} else {
				//link text for options
				if(st_option_number>0){
					create_textbox(st_option_link_id[st_option_pos]);
				}
				//destroy textbox
				text_page_number = -1;
			}
		} else {
			//if not done typing
			st_draw_char = shop_text_length[st_page];
		}
	}
}

//------------------------TABS------------------------//
switch(current_tab){
	case 0: //in drawgui event
		break;
	
	case 1: //in drawgui event 
		break;
		
	case 2: _draw_shop_text(); break;
		
	case 3:
		break;
		
	case 4:
		break;
}

*/