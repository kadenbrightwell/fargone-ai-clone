//set default font
draw_set_font(FONT);

switch(B_DTRIGGER){
	case 0:
		var _lbx = 32; var _tby = 96;
		var _rbx = 256; var _bby = 200;
		var _pad = 16; var _sep = 4;
		var _ls = 16; var _line = 0;
		var _width = _rbx - 2*_pad - _lbx;
		var _s = "* You're an embarrassment. `n    `n* Try me!"; var _sw = string_width(_s);
		var _char_length = string_length(_s)+1; var _line_count = 1; 
		var _lines = []; var _line_breaks = [];
		
		var _chars = []; for(var _cc=0; _cc<_char_length; _cc++){ array_push(_chars, string_char_at(_s, _cc)); }
		
		var _cl = array_length(_chars);
		for(var _ccc = 0; _ccc<_cl; _ccc++){
			if(_chars[_ccc]=="`" && _ccc<_cl-1){ 
				switch(_chars[_ccc+1]){
					case "n": array_push(_line_breaks, _ccc+1); _line_count++; break; 
					case "m": array_push(_line_breaks, _ccc); array_push(_line_breaks, _ccc+1); _line_count+=2; break; 
					default: exit;
				}
				show_debug_message("_s1: " + string(_s));
				_s=string_copy(_s,0,_ccc-1)+" "+string_copy(_s,_ccc+1,string_length(_s));
				show_debug_message("_s2: " + string(_s));
				_s=string_copy(_s,0,_ccc)+" "+string_copy(_s,_ccc+2,string_length(_s));
				show_debug_message("_s3: " + string(_s));
			}
		}
		
		var _line_breaks_length = array_length(_line_breaks);
		array_push(_line_breaks, string_length(_s));
		array_push(_lines, string_copy(_s, 0, (_line_breaks[0])-1));
		if(_line_breaks_length>0){
			for(var _l = 1; _l<_line_breaks_length+1; _l++){
				var __b = _line_breaks[_l-1]; var __e = _line_breaks[_l];
				array_push(_lines, string_copy(_s, __b+1, __e-__b));
			}
		}
		
		for(var _c=0; _c<_line_count; _c++){
			var _line_string = _lines[_c];
			var _wwidth = string_width(_line_string);
			var _scale = 1.25; var _col = c_white;
			draw_text_ext_transformed_color(_lbx+_pad, _tby+_pad+(_ls*_c), _line_string, _sep, _wwidth, _scale, _scale, 0, _col, _col, _col, _col, 1);
		}
		
		hide_battler();
		
		/*
		var _break_next=false;
		var _line_break_next=false;
		var _line_break_fix=0;
		for(var _cc=0; _cc<_char_length; _cc++){
			var _cchar = string_char_at(_s, _cc); 
			
			if(_line_break_next){
				_line++;
				_line_break_fix=124;
				_line_break_next=false;
			}
			
			if(_break_next){
				switch(_cchar){
					case "n": _line_break_next=true; break; 
					case "m": _line_break_next=true; _cchar=" "; _break_next=true; exit; 
					default: _break_next=false; exit;
				}
				_cchar=" ";
				_break_next=false;
			}
			
			//break sequence
			if(_cchar=="`" && _cc<_char_length-2){ _cchar=" "; _break_next=true; }
			
			var _wwidth = string_width(_cchar);
			
			var _scale = 1.25; var _col = c_white;
			draw_text_ext_transformed_color(_lbx+_pad+(_cc*_sep)-_line_break_fix, _tby+_pad+(_ls*_line), _cchar, 0, _wwidth, _scale, _scale, 0, _col, _col, _col, _col, 1);
			show_debug_message("");
			show_debug_message("line_break_fix: " + string(_line_break_fix));
			show_debug_message("");
			show_debug_message("_cc: " + string(_cc));
			show_debug_message("_sep: " + string(_sep));
			show_debug_message("_cc*_sep: " + string(_cc*_sep));
			show_debug_message("_ls: " + string(_ls));
			show_debug_message("_line: " + string(_line));
			show_debug_message("_ls*_line: " + string(_ls*_line));
			show_debug_message("");
			show_debug_message("_cc: " + string(_cc));
			show_debug_message("_x: " + string(_lbx+_pad+(_cc*_sep)));
			show_debug_message("_y: " + string(_tby+_pad+(_ls*_line)));
			show_debug_message("_cchar: " + string(_cchar));
			show_debug_message("_wwidth: " + string(_wwidth));
			show_debug_message("");
		}
		*/
		//draw_text_ext(_lbx+_pad, _tby+_pad, _s, _sep, _width);
		break;
		
	case 2:
		if(array_length(tabs)>0 && array_length(tabs[menu_level])>0){
			var _draw_options = function(_element, _index){ 
				var _lbx = 32; var _tby = 96;
				var _rbx = 256; var _bby = 200;
				var _bpad = 16; var _spad = 24; 
				var _spc = 32; var _sw = 0;
			
			
				var _ds=tabs[menu_level, _index]; 
				var _dscale = 1.25;
				var _dc=c_white;
				if(_index==tab_option){ 
					_dc=c_yellow; 
				} 
			
				_sw = string_width(_ds)*+_dscale;
			
				var __x1 = _lbx+_spad;		var __y1 = _tby+_bpad;
				var __x2 = _rbx-_spad-_sw;	var __y2 = _tby+_bpad;
				var __x3 = _lbx+_spad;		var __y3 = _tby+_bpad+_spc;
				var __x4 = _rbx-_spad-_sw;	var __y4 = _tby+_bpad+_spc;
			
				var _dx=[__x1, __x2, __x3, __x4]; 
					var __dx=_dx[_index];
				var _dy=[__y1, __y2, __y3, __y4]; 
					var __dy=_dy[_index];
			
				draw_text_transformed_color(__dx, __dy, _ds, _dscale, _dscale, 0, _dc, _dc, _dc, _dc, 1); 
			}
			
			array_foreach(tabs[menu_level],_draw_options);
		}
		break;
		
	case 13:
		break;
		
	case 14:
		
		break;
	
} reset_battle_draw_trigger();

