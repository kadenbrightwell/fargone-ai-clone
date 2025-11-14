patswre = []; // playing audios to stop when room ends

room_triggered = false;

function trigger_room(){
	room_triggered = true;
}

_titlemenu_time=-1;
_titlemenu_playing=false;
/// @description updates the title menu music just in case the volume change affected it
function title_menu_volume_changed(){
	var _st = _titlemenu_time;
	show_debug_message("Song_Time: " + string(_st));
	show_debug_message("Song_Time (s): " + string(_st/FPS));
	audio_stop_sound(snd_titlemenu);
	_titlemenu_playing=false;
	audio_play_sound(snd_titlemenu,6,true,MVOL, (_st+1)/FPS);
	_titlemenu_playing=true;
}