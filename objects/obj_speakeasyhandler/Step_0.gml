var _pcs = current_song;
playlist_length = array_length(playlist.songs);

if(!global.spk_song_playing && delay_time<playlist.song_delay){ //between time
	delay_time++;
} else if(global.spk_song_pos>=song_len) { //song ended
	global.spk_song_playing = false;
	global.spk_song_pos = 0;
} else {
	
	
	//stuff happens
	
	
	global.spk_song_pos = audio_sound_get_track_position(current_song.sound);
	if(current_song!=_pcs){ 
		song_len = audio_sound_length(current_song.sound);
	}
	
	if(audio_get_name(current_song.sound)==snd_empty){
			var _i = current_song.index; var __i = 0;
		if(_i<playlist_length){ __i=_i+1; }
		
		global.spk_song_pos = 0;
		playlist_start(playlist, __i);
	}
}

//audio_listener_position(432-PLAYER.x, PLAYER.y, 0);
audio_listener_position(sound_center[0] + (sound_center[0] - PLAYER.x), PLAYER.y, 0);


with(PLAYER){
	if(room!=rm_speakeasy){ instance_destroy(obj_speakeasyhandler); }
}

song_pos_s = global.spk_song_pos/FPS;

if( (global.spk_song_playing==true)&&(array_equals(global.band_breaks, [0, 0, 0, 0]))&&(global.band_breakable = true) ){
	global.band_breakable = false;
	band_breaks();
	show_debug_message("Worked?");
}