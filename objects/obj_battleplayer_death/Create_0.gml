depth=TEXTBOX_DEPTH;

spinning = false;

time = 0;
spin_time = 6*FPS;

rot = 0;
rot_d = 0;

function start_spinning(){
	alarm_set(0, spin_time);
	spinning = true;
}

#region defaults
x = 144;
y = 144;

PLAYER.visible=false;
visible=true;
#endregion defaults

wait_time = 3*FPS;
alarm_set(1, wait_time);

audio_stop_all();
audio_play_sound(snd_death, 6, false, max(0.25, MVOL));