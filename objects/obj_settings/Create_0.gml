depth = SETTINGS_DEPTH;

global.font_en = font_add_sprite(spr_main_font, 32, true, 1);
global.font_asian = font_add_sprite(spr_font_asian, 12288, true, 1);
global.font_farsi = fnt_pixelae;

global.font_main = global.font_en;

global.language = LANG_ENGLISH;

global.previous_room = rm_titleroom;

global.vol = 1;
	global.mvol = 1;
	global.cvol = 1;
	global.svol = 1;
	
	global.gmvol = 0;
		global.game_music_playing = -1;
	global.rvol = 0;
		global.radio_music_playing = -1;
			global.radio_track_position = -1;
				
				global.rvol_cw = 0;
				global.rvol_ut = 0;
	
	global.radio_playing = false;
	global.radio_playing_channel = 0;
	
	global.radio_cw_music_playing = -1;
		global.radio_cw_track_position = -1;
	global.radio_ut_music_playing = -1;
		global.radio_ut_track_position = -1;
	//global.crossfade_finished = false;

global.menu_time = 0;
global.exit_time = 3;
global.exit_alpha = 0;

global.rin = 0; //room interaction number
global.rid = []; //i dont remember what this stands for - maybe room interaction data?

global.enemies = [];
global.in_battle = false;
global.battler = undefined;

global.battle_trigger=-1;
global.battle_draw_trigger=-1;
global.battle_phase=-1;

global.in_minigame = false;

global.battle_id = -1;
global.textbox_id = -1;

global.pt_played = false;

global.in_shop = false;
global.shop_id = -1;

global.textbox_closed=false;

global.spk_song_playing = false;
global.spk_song_pos = 0;
global.spk_bartender_interactions = 0;

// BAND STUFFS
global.cw_drummer_metplaying = false;
global.cw_organist_met = 0;
// YOU WOULDN'T GET IT

global.secretsave = {
	talked_to_toriel: 0,
	bscotch_pie: 0,
}



function player_death(){
	room_goto(rm_death);
}