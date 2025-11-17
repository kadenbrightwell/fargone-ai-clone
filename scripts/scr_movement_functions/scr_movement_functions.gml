/// @description Calculate movement speed based on sprint inputs
/// @param {Real} base_speed Base movement speed
/// @return {Real} Calculated movement speed
function scr_calculate_move_speed(_base_speed){
	var _move_spd = _base_speed;
	if(PLAYER_SPRINT){ _move_spd = _base_speed * 2; }
	if(PLAYER_SUPER_SPRINT){ _move_spd = _base_speed * (10/3); }
	if(PLAYER_SPRINT && PLAYER_SUPER_SPRINT){ _move_spd = _base_speed * 5; }
	return _move_spd;
}

/// @description Calculate xspd and yspd based on player input
/// @param {Real} move_spd Movement speed multiplier
/// @return {Array} [xspd, yspd]
function scr_calculate_movement(_move_spd){
	var _xspd = (PLAYER_RIGHT - PLAYER_LEFT) * _move_spd;
	var _yspd = (PLAYER_DOWN - PLAYER_UP) * _move_spd;
	return [_xspd, _yspd];
}

/// @description Update facing direction based on movement speeds
/// @param {Real} xspd Horizontal speed
/// @param {Real} yspd Vertical speed
/// @param {Real} current_facing Current facing direction
/// @return {Real} New facing direction
function scr_update_facing(_xspd, _yspd, _current_facing){
	var _facing = _current_facing;
	
	if(_yspd==0){
		if(_xspd>0){_facing=RIGHT;}
		if(_xspd<0){_facing=LEFT;}
	}
	if(_xspd>0&&_facing==LEFT){_facing=RIGHT;}
	if(_xspd<0&&_facing==RIGHT){_facing=LEFT;}
	
	if(_xspd==0){
		if(_yspd>0){_facing=DOWN;}
		if(_yspd<0){_facing=UP;}
	}
	if(_yspd>0&&_facing==UP){_facing=DOWN;}
	if(_yspd<0&&_facing==DOWN){_facing=UP;}
	
	return _facing;
}

/// @description Check and handle wall collisions
/// @param {Real} xspd Horizontal speed
/// @param {Real} yspd Vertical speed
/// @param {Real} x Current x position
/// @param {Real} y Current y position
/// @return {Array} [xspd, yspd] after collision checks
function scr_check_wall_collisions(_xspd, _yspd, _x, _y){
	var _new_xspd = _xspd;
	var _new_yspd = _yspd;
	
	if(place_meeting(_x + _xspd, _y, WALL) == true){ _new_xspd = 0; }
	if(place_meeting(_x, _y + _yspd, WALL) == true){ _new_yspd = 0; }
	
	return [_new_xspd, _new_yspd];
}

/// @description Handle player interaction with nearby interactable objects
/// @param {Real} player_x Player x position
/// @param {Real} player_y Player y position
function scr_handle_interactions(_player_x, _player_y){
	if(PLAYER_INTERACT){
		with(instance_nearest(_player_x, _player_y, INTERACT)){
			var _pos = get_interaction_pos(real(id));
			if( ( distance_to_object(PLAYER) <= maxdtp[_pos] ) && ( pfs[_pos][PLAYERDIR] == 1 ) ){
				result[_pos]();
			}
		}
	}
}