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

if(KEY_DEBUG_RADIO_G){
	RADIO_VOL=toggle_zero_one(RADIO_VOL);
}

if(KEY_DEBUG_RADIO_H){
	radio_crossfade_channels();
}

if(KEY_DEBUG_RADIO_I){
	RADIO_VOL_CW=toggle_zero_one(RADIO_VOL_CW);
	audio_sound_gain(CW_SONGS[CW_INDEX], RVOL_CW, s_to_ms(0));
}

if(KEY_DEBUG_RADIO_O){
	RADIO_VOL_UT=toggle_zero_one(RADIO_VOL_UT);
	audio_sound_gain(UT_SONGS[UT_INDEX], RVOL_UT, s_to_ms(0));
}

M_RTP_CW = audio_sound_get_track_position(M_RMP_CW);
M_RTP_UT = audio_sound_get_track_position(M_RMP_UT);
if(audio_sound_get_gain(CW_SONGS[CW_INDEX])>0){ M_RMP = M_RMP_CW; M_RTP = M_RTP_CW; } else if(audio_sound_get_gain(UT_SONGS[UT_INDEX])>0) { M_RMP = M_RMP_UT; M_RTP = M_RTP_UT; } else { M_RMP = -1; M_RTP = -1; }