/*
audio_group_load(ag_game_music);
audio_group_load(ag_radio_cursewords);

all_music_loaded = false;
	game_music_loaded = false;
	radio_cursewords_loaded = false;
	
sg_game_music = NaN;
sg_radio_cursewords = NaN;
arr_game_music = NaN;
arr_radio_cursewords = NaN;
*/

index_radio_undertale = 0;
arr_radio_undertale = [snd_gm_ut_fd, snd_gm_ut_bt, snd_gm_ut_bird, snd_gm_ut_mv];
M_RMP_UT = audio_play_sound(UT_SONGS[UT_INDEX], 10, false);
audio_sound_gain(UT_SONGS[UT_INDEX], GMVOL, 0);

index_radio_cursewords = 0;
arr_radio_cursewords = [snd_cw_disgruntled_employee, snd_cw_i_didnt_get_a_lot_of_sleep_last_night, snd_cw_the_gem, snd_cw_premonition, snd_cw_thinking_about_you];
M_RMP_CW = audio_play_sound(CW_SONGS[CW_INDEX], 10, false);
audio_sound_gain(CW_SONGS[CW_INDEX], RVOL, 0);

function radio_crossfade_channels(){
	if(RADIO_PLAYING_CHANNEL==CHANNEL_CURSEWORDS){ 
		RADIO_VOL_CW = 0;
		RADIO_VOL_UT = 1;
		RADIO_PLAYING_CHANNEL=CHANNEL_UNDERTALE;
	} else { 
		RADIO_VOL_CW = 1;
		RADIO_VOL_UT = 0;
		RADIO_PLAYING_CHANNEL=CHANNEL_CURSEWORDS;
	}
	
	radio_crossfade_channel(CHANNEL_CURSEWORDS);
	radio_crossfade_channel(CHANNEL_UNDERTALE);
}

/// @param {Real} channel The macro for the channel you are crossfading. For example, CHANNEL_CURSEWORDS
function radio_crossfade_channel(_c){
	var _t = .5;
	
	switch(_c){
		case CHANNEL_CURSEWORDS:
			if(RADIO_PLAYING_CHANNEL==CHANNEL_UNDERTALE){_t=0; audio_play_sound(snd_radio_static, 10, false, SVOL);}
			audio_sound_gain(CW_SONGS[CW_INDEX], RVOL_CW, s_to_ms(_t));
			break;
			
		case CHANNEL_UNDERTALE:
			if(RADIO_PLAYING_CHANNEL==CHANNEL_CURSEWORDS){_t=0; audio_play_sound(snd_radio_static, 10, false, SVOL);}
			audio_sound_gain(UT_SONGS[UT_INDEX], RVOL_UT, s_to_ms(_t));
			break;
	}
}