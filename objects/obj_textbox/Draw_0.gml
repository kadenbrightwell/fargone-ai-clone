var _textbox_fix = [80,0];
switch(PLAYER.in_room){
	case rm_battle:
		textbox_x = 35 - _textbox_fix[0];
		textbox_y = 99 - _textbox_fix[1];
		text_spd = 2;
		break;
	
	default:
		textbox_x = camera_get_view_x(view_camera[0]);
		textbox_y = camera_get_view_y(view_camera[0]) + 144;
		text_spd = 1;
		break;
}

//--------------------setup
if(!setup){
	setup = true;
	draw_set_font(FONT);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
	//loop through pages
	for(var _p = 0; _p < page_number; _p++){
		//find num chars on page and store in arr
		text_length[_p] = string_length(text[_p]);
		
		//get x pos for textbox
			//character on left
			text_x_offset[_p] = 80;
			portrait_x_offset[_p] = 8;
			//character on right
			if(speaker_side[_p] == -1){
				text_x_offset[_p] = 8;
				portrait_x_offset[_p] = 216;
			}
			//no character (centered textbox)
			if(speaker_sprite[_p] == noone){
				text_x_offset[_p] = 44;
			}
		
		//set chars and finding text breaks
		for(var _c = 0; _c < text_length[_p]; _c++){
			var _char_pos = _c+1;
			//store chars to arr
			char[_c, _p] = string_char_at(text[_p], _char_pos);
			
			//get width of line
			var _txt_up_to_char = string_copy(text[_p], 1, _char_pos);
			var _current_text_w = string_width(_txt_up_to_char)-string_width(char[_c, _p]);
			
			//get last free space
			if(char[_c, _p] == " "){
				last_free_space = _char_pos+1;
			}
			
			if(_c>0 && char[_c-1, _p] =="`"){
				switch(char[_c, _p]){
					case "n":
						char[_c-1, _p] = " "; char[_c, _p] = " ";
						last_free_space = _char_pos+1;
						line_break_pos[line_break_num[_p],_p] = last_free_space;
						line_break_num[_p]++;
						var _txt_up_to_last_space = string_copy(text[_p], 1, last_free_space);
						var _last_free_space_string = string_char_at(text[_p], last_free_space);
						line_break_offset[ _p] = string_width(_txt_up_to_last_space)-string_width(_last_free_space_string);
						break;
				}
			}
			
			//get the line breaks
			if((_current_text_w - line_break_offset[_p]) > line_width){
				line_break_pos[line_break_num[_p],_p] = last_free_space;
				line_break_num[_p]++;
				var _txt_up_to_last_space = string_copy(text[_p], 1, last_free_space);
				var _last_free_space_string = string_char_at(text[_p], last_free_space);
				line_break_offset[ _p] = string_width(_txt_up_to_last_space)-string_width(_last_free_space_string);
			}
		}
		
		//getting char coords
		for(var _c = 0; _c < text_length[_p]; _c++){
			var _char_pos = _c+1;
			var _txt_x = textbox_x+text_x_offset[_p] + border;
			var _txt_y = textbox_y + border;
			//get width of line
			var _txt_up_to_char = string_copy(text[_p], 1, _char_pos);
			var _current_text_w = string_width(_txt_up_to_char)-string_width(char[_c, _p]);
			var _txt_line = 0;
			//compensate string breaks
			for(var _lb = 0; _lb < line_break_num[ _p]; _lb++){
				if(_char_pos >= line_break_pos[_lb, _p]){
					var _string_copy = string_copy(text[_p], line_break_pos[_lb, _p], _char_pos-line_break_pos[_lb, _p]);
					_current_text_w = string_width(_string_copy);
					
					//record the line this character should be on
					_txt_line = _lb+1;
				}
			}
			
			//add to the x and y coords based on new info
			char_x[_c, _p] = _txt_x + _current_text_w;
			char_y[_c, _p] = _txt_y + _txt_line*line_sep;
		}
	}
}
	
//---------------typing the text
if(text_pause_timer<=0){
	if(draw_char < text_length[page]){
		draw_char = clamp(draw_char + text_spd, 0, text_length[page]);
		var _check_char = string_char_at(text[page], draw_char);
		if(_check_char=="." || _check_char=="," || _check_char=="!" || _check_char=="?"){
			text_pause_timer = text_pause_time;
		} else {
			//typing sound
			if(snd_count[page]<snd_delay[page]){
				snd_count[page]++;
			} else {
				snd_count[page]=0;
				audio_play_sound(snd[page], 0, false, snd_gain[page]*CVOL);
			}
		}
	}
} else { text_pause_timer--; }

//-------------------flip through pages
if(PLAYER_INTERACT){
	//if typing is done
	if(draw_char==text_length[page]){
		//next page
		if(page<page_number-1){
			page++;
			draw_char=0;
		} else {
			//link text for options
			if(option_number>0){
				create_textbox(option_link_id[option_pos]);
			}
			//destroy textbox
			instance_destroy();
			TEXTBOX_CLOSED=true;
		}
	} else {
		//if not done typing
		draw_char = text_length[page];
	}
}

//-------------------draw the textbox
txtb_img += txtb_img_spd;
txtb_spr_w = sprite_get_width(txtb_spr[page]);
txtb_spr_h = sprite_get_height(txtb_spr[page]);
var _txtb_x = textbox_x+text_x_offset[page];
var _txtb_y = textbox_y;

	//CAMZOOM FIX
		var _camzoom_0 = CAMZOOM*0.975; //back of face x, face x
		var _camzoom_1 = CAMZOOM*0.8;  //back of face y, back of textbox y
		var _camzoom_2 = CAMZOOM;  //back of face xscale, back of face yscale, back of textbox xscale
		var _camzoom_3 = CAMZOOM*0.8125; //face y
		var _camzoom_4 = CAMZOOM*0.95; //face xscale, face yscale
		var _camzoom_5 = sqr(CAMZOOM)*1.05; //back of textbox yscale
		
		if(CAMZOOM==1){ _camzoom_0 = 1; _camzoom_1 = 1; _camzoom_2 = 1; _camzoom_3 = 1; _camzoom_4 = 1; _camzoom_5 = 1; }

//draw the speaker
if(speaker_sprite[page]!=noone){
	sprite_index = speaker_sprite[page];
	if(draw_char == text_length[page] || text_pause_timer>0){ image_index = 0; }
	var _speaker_x = textbox_x + portrait_x_offset[page];
	if(speaker_side[page] == -1){ _speaker_x += sprite_width; }
	
	//draw the face
	draw_sprite_ext(txtb_spr[page], txtb_img, (textbox_x + portrait_x_offset[page])*(_camzoom_0), (_txtb_y)*(_camzoom_1), (sprite_width/txtb_spr_w)*(_camzoom_2), (sprite_height/txtb_spr_h)*(_camzoom_2), 0, c_white, 1);
	draw_sprite_ext(sprite_index, image_index, (_speaker_x+sprite_get_xoffset(sprite_index))*(_camzoom_0), (_txtb_y+sprite_get_yoffset(sprite_index))*(_camzoom_3), (speaker_side[page])*(_camzoom_4), (1)*(_camzoom_4), 0, c_white, 1);
}

//back of textbox
draw_sprite_ext(txtb_spr[page],txtb_img,_txtb_x,(_txtb_y)*(_camzoom_1),(textbox_width/txtb_spr_w)*_camzoom_2,(textbox_height/txtb_spr_h)*(_camzoom_5),0,c_white,1);

//----------------options
if(draw_char==text_length[page] && page == page_number-1){
	
	//option selection
	option_pos += keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);
	option_pos = clamp(option_pos, 0, option_number-1);
	
	//draw the options
	var _op_space = 15;
	var _op_bord = 4;
	for(var _op = 0; _op < option_number; _op++){
		//option box
		var _o_w = string_width(option[_op]) + _op_bord*2;
		var _o_y = _txtb_y - _op_space*option_number + _op_space*_op;
		draw_sprite_ext(txtb_spr[page], txtb_img,_txtb_x + 16,_o_y, (_o_w/txtb_spr_w)*CAMZOOM,((_op_space-1)/txtb_spr_h)*CAMZOOM,0,c_white,1);
		
		//the arrow
		if(option_pos==_op){
			draw_sprite(spr_textbox_arrow, 0, _txtb_x, _o_y);
		}
		
		//the option text
		draw_text_color(_txtb_x + 16 + _op_bord, _o_y + 2, option[_op],c_white, c_white, c_white, c_white, 1);
	}
}

//draw the text
for(var _c = 0; _c < draw_char; _c++){
	
	//---special stuff---//
		//wavy text
		var _float_y = 0;
		if(float_text[_c, page] == true){ 
			float_dir[_c, page] +=-6; 
			_float_y = dsin(float_dir[_c, page])*1; 
		}
		
		//shaky text
		var _shake_x = 0;
		var _shake_y = 0;
		if(shake_text[_c, page] == true){
			shake_timer[_c, page]--;
			if(shake_timer[_c, page] <= 0){
				shake_timer[_c, page] = irandom_range(4,8);
				shake_dir[_c, page] = irandom(360);
				_shake_x = lengthdir_x(1, shake_dir[_c, page]);
				_shake_y = lengthdir_y(1, shake_dir[_c, page]);
			}
		}
	
	//the text
	draw_text_color(char_x[_c, page] + _shake_x, char_y[_c, page] + _float_y + _shake_y, char[_c, page], col_1[_c, page], col_2[_c, page], col_3[_c, page], col_4[_c, page], 1);
}