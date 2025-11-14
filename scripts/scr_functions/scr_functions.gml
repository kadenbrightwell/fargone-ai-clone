/// @description Returns the maximum value in an array
/// @param {Array} array
function array_max(_arr) {
    if (array_length(_arr) == 0) {
        return undefined; // Return undefined for empty arrays
    } else if(array_length(_arr) == 1){
		return _arr[0];
	}

    var _max_val = _arr[0]; // Start with the first element as the initial max
    for (var _i = 1; _i < array_length(_arr); _i++) {
        if (_arr[_i] > _max_val) {
            _max_val = _arr[_i];
        }
    }
    return _max_val;
}

/// @description Sets the volume of a choice to the volume level selected
/// @param {Real} choice
/// @param {Real} volume
function set_vol_val(_c, _v){
	switch(_c){
		//master
		case 0: global.vol = _v; break;
		//music
		case 1: global.mvol = _v; break;
		//character
		case 2: global.cvol = _v; break;
		//sfx
		case 3: global.svol = _v; break;
	}
}

/// @description Searches provided text_to_search for the FIRST presence of provided text_to_check_for and returns an array with two numbers, the 1st_char and the last_char. Returns [-1,-1] if not found.
/// @param {String} text_to_search
/// @param {String} text_to_check_for
function string_check_presence(_text, _check){
	var _r = [-1,-1];
	var _text_l = string_length(_text); var _check_l = string_length(_check);
	
	if(string_trim(_text)==""){return _r;}
	if(_text_l<_check_l){return _r;}
	
	for(var _c = 0; _c<_text_l; _c++){
		if(string_copy(_text,_c,_check_l)==_check){ _r = [_c,_c+_check_l]; }
	}
	
	return _r;
}

/// @description Searches provided text_to_search for the FIRST presence of provided text_to_check_for and returns the index of the 1st_char. Returns -1 if not found.
/// @param {String} text_to_search
/// @param {String} text_to_check_for
function scp_first(_t1, _c1){ return string_check_presence(_t1, _c1)[0]; }

/// @description Searches provided text_to_search for the FIRST presence of provided text_to_check_for and returns the index of the last_char. Returns -1 if not found.
/// @param {String} text_to_search
/// @param {String} text_to_check_for
function scp_last(_t2, _c2){ return string_check_presence(_t2, _c2)[1]; }

/// @param {Real} seconds
/// @return {Real} milliseconds
function s_to_ms(_s){ return _s*1000; }

/// @param {Real} milliseconds
/// @return {Real} seconds
function ms_to_s(_ms){ return _ms/1000; }

/// @param {Real} input	The input; generally either 1 or 0
/// @desription	Returns either 1 or 0, whichever is the opposite of the input. If the input is neither 0 nor 1, the function will return the number rounded to whichever is closest
function toggle_zero_one(_in){ switch(_in){ case 0: return 1; case 1: return 0; default: return round(_in); } }

/// @description returns the exit string
function get_exit_string(){
	var _t = clamp(round( (EXIT_TIME-MENU_TIME)+0.75 ), 1, 3);
	var _s = string("Exiting game in T-{0} seconds", _t);
	
	if(_t==1){ _s = string("Exiting game in T-{0} second", _t); }
	
	return _s;
}
