/// @description 

// x,y,z
sound_center = [0, 0];

current_song = {
	index: -1,
	sound: snd_empty,
};

song_pos_s = global.spk_song_pos/FPS;
song_len = 999999;

playlist = undefined;
playlist_id = "STW";
playlist_length = -1;

global.band_breaks = [0, 0, 0, 0];
global.band_breakable = false;

delay_time = -1;

//ears = audio_listener_position(PLAYER.x, PLAYER.x, 0);
//ears = audio_listener_position(sound_center[0], sound_center[1], 0);

/// @description create a playlist to play in the speakeasy. Minimum 2 songs
/// @param {Real} song_delay
/// @param {Asset.GMSound} song_1
/// @param {Asset.GMSound} song_2
/// @param {Asset.GMSound} ...
function create_playlist(_sd, _s1, _s2, _s3=snd_empty) constructor {
	song_delay = _sd;
	songs = [];
	for(var _ss = 1; _ss<argument_count-2; _ss++){
		array_push(songs, argument[_ss]);
	}
	
	show_debug_message(songs);
}

/// @description begin_playlist. can specify index if not beginning at 0
/// @param {Struct} playlist
/// @param {Real} index
function playlist_start(__p, __i=0){
	current_song.sound = __p.songs[__i];
	current_song.index = __i;
	
	audio_stop_sound(current_song.sound);
	audio_falloff_set_model(audio_falloff_inverse_distance_clamped);
	
	audio_play_sound_at(
		current_song.sound, 
		sound_center[0], sound_center[1], 0, 
		50, 250, 1, 
		false, 1, MVOL, song_pos_s
	);
	
	global.spk_song_playing = true;
	
	
	/// @description decided which bandmates will take a break following the current song
	/// @description Current order: [guitarist, bassist, organist, drummer]
	global.band_breaks = [0, 0, 0, 0];
	global.band_breakable = true;
}
/// @description decided which bandmates will take a break following the current song
/// @description Current order: [guitarist, bassist, organist, drummer]
function band_breaks(){
	var _bb = [0, 0, 0, 0];
	var _bbc = 0;
	for(var __b = array_length(global.band_breaks)-1; __b>0; __b--){
		if( (floor(random_range(0, 4-__b))==0)&&(_bbc<2) ){
			_bbc++;
			_bb[__b]=1;
		}
	}
	global.band_breaks=_bb;
}

switch(playlist_id){
	case "STW":
		playlist = new create_playlist( 15, 
			snd_stw_american_spirits, 
			snd_stw_maria, 
			snd_stw_the_gem,
			snd_stw_baby_doll,
			snd_stw_federal_twist,
			snd_stw_she_said,
			snd_stw_thinking_about_you,
			snd_stw_premonition,
			snd_stw_i_didnt_get_a_lot_of_sleep_last_night,
			snd_stw_disgruntled_employee,
			snd_stw_all_of_the_time,
		);
		sound_center = [224, 64];
		break;
		
	default:
		break;
}

playlist_start(playlist);