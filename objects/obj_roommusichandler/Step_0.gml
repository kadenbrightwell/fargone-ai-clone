switch(room){
	
	case rm_titleroom:
		if(!room_triggered){
			trigger_room();
			
			audio_play_sound(snd_titlemenu, 6, true, MVOL);
			_titlemenu_playing=true;
		}
		if(_titlemenu_playing){ _titlemenu_time++; }
		break;
	
	case rm_tutorialmain: 
		if(!room_triggered){
			trigger_room();
			
			audio_stop_sound(snd_titlemenu);
			var _songs = [snd_tutorialmain_1, snd_tutorialmain_2]; 
			var _song = _songs[irandom_range(0, array_length(_songs)-1)];
			audio_play_sound(_song, 6, true, MVOL);
			array_push(patswre, _song);
		}
		break;
		
	case rm_forest:
		if(!room_triggered){
			trigger_room();
			
			audio_stop_all();
			var _songs = [snd_tutorialmain_5, snd_tutorialmain_6, ]; 
			var _song = _songs[irandom_range(0, array_length(_songs)-1)];
			audio_play_sound(_song, 6, true, MVOL);
			array_push(patswre, _song);
		}
		break;
		
	case rm_livingroom:
		if(!room_triggered){
			trigger_room();
			
			audio_stop_all();
			var _songs = [snd_tutorialmain_3, snd_tutorialmain_4, ]; 
			var _song = _songs[irandom_range(0, array_length(_songs)-1)];
			audio_play_sound(_song, 6, true, MVOL);
			array_push(patswre, _song);
		}
		break;
		
	default: break;
}

show_debug_message("_st: " + string(_titlemenu_time));
show_debug_message("_st (s): " + string(_titlemenu_time/FPS));