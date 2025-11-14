///@description
/*
if (countdown > 0) {
	show_debug_message("Countdown: " + string(countdown));
	show_debug_message("Countdown (s): " + string(countdown_s));
	
    countdown--;
	countdown_s = ceil(countdown/FPS);
} else if (!countdown_done) {
    countdown_done = true;
	var _countdown = string("{0}", countdown_s);
	draw_text_ext_transformed_color(
	//256-string_length(_countdown)
	0, 
	//128
	0, _countdown, 0, string_width(_countdown), 1, 1, 0, c_white, c_white, c_white, c_white, 1);
} else {
	//time
	time++;
	time_ms = (time*1000)/FPS;
	// time_ms = s_to_ms(time)/FPS;
	time_s = time_ms/1000;
	// time_s = ms_to_s(time_ms);

	if(!instance_exists(PT_TILE)){
		var _tile_m = 1;
		var _tile_h = PT_TILE.tile_h*_tile_m;
		
		var _tile = instance_create_layer(lane_x[lane], 0-_tile_h, "PianoTiles", PT_TILE);
		_tile.tile_h = _tile_h;
		array_push(tiles, _tile);
	} else {
		tiles[0].y--;
	}

}
*/

camera_set_view_pos(view_camera[0],-16,0);

if (countdown > 0) {
    countdown--;
    if(countdown <= 0 && !audio_is_playing(current_song.audio)){
		playing_sound = audio_play_sound(current_song.audio,0,false,MVOL);
		dt_time+=(delta_time/1_000_000);
		countdown_done = true;
	}
} else {
	dt_time+=(delta_time/1_000_000);
    //var _song_pos = audio_sound_get_track_position(playing_sound);
	var _song_pos = dt_time;
    
    // Spawn tiles
    while(array_length(song_data) > 0 && _song_pos >= song_data[0][0]) {
        var _beat = song_data[0];
		array_delete(song_data, 0, 1)
        var _lane = _beat[1];
        
        // Get tile from pool
        var _tile = instance_create_depth(-999999, -999999, -9992, PT_TILE);
        if(_tile != noone) {
            _tile.x = lane_x[_lane];
            _tile.y = -PT_TILE.tile_h;
            _tile.target_y = room_h + PT_TILE.tile_h;
            _tile.vspeed = ((room_h + PT_TILE.tile_h) / (time_to_end - _beat[0]));
            array_push(tiles, _tile);
        }
    }
    
    // Update tiles
    for(var i = array_length(tiles)-1; i >= 0; i--) {
        if(!instance_exists(tiles[i])) {
            array_delete(tiles, i, 1);
            continue;
        }
        tiles[i].y += tiles[i].speed;
    }
}

var _kp = [KEY_PT_1, KEY_PT_2, KEY_PT_3, KEY_PT_4, KEY_PT_5, KEY_PT_6, KEY_PT_7, KEY_PT_8, KEY_PT_9, KEY_PT_0];
for(var _k = 0; _k < lane_count; _k++){
	if(_kp[_k] != 0){
		show_debug_message(_k);
		for(var _t = array_length(tiles)-1; _t >= 0; _t--){
			if(place_meeting(lane_x[_k],room_hh-lane_padding,tiles[_t])){
				show_debug_message("Yay!");
			}
		}
	}
}