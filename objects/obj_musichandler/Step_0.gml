/*
if(all_music_loaded){
	audio_group_set_gain(ag_game_music, GMVOL, 0);
	audio_group_set_gain(ag_radio_cursewords, RVOL, 0);
} else {
	if(!game_music_loaded){
		if(audio_group_is_loaded(ag_game_music)){
			sg_game_music = audio_create_sync_group(true);
			arr_game_music = audio_group_get_assets(ag_game_music);
			var _len_gma = array_length(arr_game_music);
			for(var _t_gm = 0; _t_gm < _len_gma; _t_gm++){ audio_play_in_sync_group(sg_game_music, arr_game_music[_t_gm]); }
			game_music_loaded = true;
		}
	}
	if(!radio_cursewords_loaded){
		if(audio_group_is_loaded(ag_radio_cursewords)){
			sg_radio_cursewords = audio_create_sync_group(true);
			arr_radio_cursewords = audio_group_get_assets(ag_radio_cursewords);
			var _len_rca = array_length(arr_radio_cursewords);
			for(var _t_cw = 0; _t_cw < _len_rca; _t_cw++){ audio_play_in_sync_group(sg_radio_cursewords, arr_radio_cursewords[_t_cw]); }
			radio_cursewords_loaded = true;
		}
	}
	
	if(game_music_loaded&&radio_cursewords_loaded){ all_music_loaded=true; }
}

if(keyboard_check_pressed(ord("I"))){
	audio_start_sync_group(sg_game_music);
	audio_start_sync_group(sg_radio_cursewords);
}
if(keyboard_check_pressed(ord("O"))){
	show_debug_message(string("GM: {0}", audio_sync_group_is_playing(sg_game_music)));
	show_debug_message(string("CW: {0}", audio_sync_group_is_playing(sg_radio_cursewords)));
	
	show_debug_message(string("AL: {0}", all_music_loaded));
		show_debug_message(string("GMVOL: {0}", GMVOL));
			show_debug_message(string("GMG: {0}", audio_group_get_gain(ag_game_music)));
		show_debug_message(string("RVOL: {0}", RVOL));
			show_debug_message(string("RG: {0}", audio_group_get_gain(ag_radio_cursewords)));
}
if(keyboard_check_pressed(ord("U"))){
	audio_group_set_gain(ag_game_music, 0, 0);
	audio_group_set_gain(ag_radio_cursewords, 0, 0);
	
	show_debug_message(string("GMG: {0}", audio_group_get_gain(ag_game_music)));
	show_debug_message(string("RG: {0}", audio_group_get_gain(ag_radio_cursewords)));
}

if(keyboard_check_pressed(ord("J"))){
	// Toggle the audio gain between 0 and 1
	if (RADIO_VOL == 0) {
	    RADIO_VOL = 1;
	} else {
	    RADIO_VOL = 0;
	}

	// Apply the new gain immediately
	audio_sound_gain(arr_radio_cursewords[index_radio_cursewords], RVOL, 0);
}
*/

if (!audio_is_playing(CW_SONGS[CW_INDEX])) {
    // Move to the next song
    CW_INDEX = (CW_INDEX + 1) % array_length(CW_SONGS);

    // Start playing the new song
    M_RMP_CW = audio_play_sound(CW_SONGS[CW_INDEX], 10, false);
    audio_sound_gain(CW_SONGS[CW_INDEX], RVOL_CW, 0);
}

if (!audio_is_playing(UT_SONGS[UT_INDEX])) {
    // Move to the next song
    UT_INDEX = (UT_INDEX + 1) % array_length(UT_SONGS);

    // Start playing the new song
    M_RMP_UT = audio_play_sound(UT_SONGS[UT_INDEX], 10, false);
    audio_sound_gain(UT_SONGS[UT_INDEX], RVOL_UT, 0);
}

if(keyboard_check_pressed(ord("G"))){
	RADIO_VOL=toggle_zero_one(RADIO_VOL);
}

if(keyboard_check_pressed(ord("H"))){
	radio_crossfade_channels();
}

if(keyboard_check_pressed(ord("I"))){
	RADIO_VOL_CW=toggle_zero_one(RADIO_VOL_CW);
	audio_sound_gain(CW_SONGS[CW_INDEX], RVOL_CW, s_to_ms(0));
}

if(keyboard_check_pressed(ord("O"))){
	RADIO_VOL_UT=toggle_zero_one(RADIO_VOL_UT);
	audio_sound_gain(UT_SONGS[UT_INDEX], RVOL_UT, s_to_ms(0));
}

M_RTP_CW = audio_sound_get_track_position(M_RMP_CW);
M_RTP_UT = audio_sound_get_track_position(M_RMP_UT);
if(audio_sound_get_gain(CW_SONGS[CW_INDEX])>0){ M_RMP = M_RMP_CW; M_RTP = M_RTP_CW; } else if(audio_sound_get_gain(UT_SONGS[UT_INDEX])>0) { M_RMP = M_RMP_UT; M_RTP = M_RTP_UT; } else { M_RMP = -1; M_RTP = -1; }