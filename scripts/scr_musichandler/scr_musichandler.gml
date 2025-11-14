/*

/// @description toggle radio and crossfade with music to be natural
function radio_crossfade(){
	crossfade_time = 5;
	
	global.crossfade_finished = false;
	
	if(!global.radio_playing){ 
			show_debug_message("CROSSFADE ON");
		GAME_MUSIC_VOL = 1;
		RADIO_VOL = 0;
		while(!global.crossfade_finished){
				show_debug_message(string("GMV: {0}", GAME_MUSIC_VOL));
				show_debug_message(string("RV: {0}", RADIO_VOL));
			radio_crossfade_on(); 
		}
	} else { 
			show_debug_message("CROSSFADE OFF");
		GAME_MUSIC_VOL = 0;
		RADIO_VOL = 1;
		while(!global.crossfade_finished){
				show_debug_message(string("GMV: {0}", GAME_MUSIC_VOL));
				show_debug_message(string("RV: {0}", RADIO_VOL));
			radio_crossfade_off(); 
		}
	}
	
	show_debug_message(string("GMV: {0}", GAME_MUSIC_VOL));
	show_debug_message(string("RV: {0}", RADIO_VOL));
}

function radio_crossfade_on(){
  var _gmvol = GAME_MUSIC_VOL;
  var _rv = RADIO_VOL;

  var _tc = (1/FPS)/crossfade_time;
  
  if(_gmvol>0){ _gmvol-=_tc; }
  if(_rv<1) { _rv+=_tc; }
  
  _gmvol = clamp(_gmvol,0,1);
  _rv = clamp(_rv,0,1);
  
  GAME_MUSIC_VOL = _gmvol;
  RADIO_VOL = _rv;
  
  if( (GAME_MUSIC_VOL<=0) && (RADIO_VOL>=1) ){ global.crossfade_finished=true; global.radio_playing=true; }
}

function radio_crossfade_off(){
  var _gmvol = GAME_MUSIC_VOL;
  var _rv = RADIO_VOL;

  var _tc = (1/FPS)/crossfade_time;
  
  if(_gmvol<1){ _gmvol+=_tc; }
  if(_rv>0) { _rv-=_tc; }
  
  _gmvol = clamp(_gmvol,0,1);
  _rv = clamp(_rv,0,1);
  
  GAME_MUSIC_VOL = _gmvol;
  RADIO_VOL = _rv;
  
  if( (GAME_MUSIC_VOL>=1) && (RADIO_VOL<=0) ){ global.crossfade_finished=true; global.radio_playing=false; }
}

*/