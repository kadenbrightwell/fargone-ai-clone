if (KEY_MENU){
    MENU_TIME += 1/(FPS+15);
	EXIT_ALPHA = clamp(MENU_TIME/(EXIT_TIME-0.5), 0.25, 1);
    if (MENU_TIME>=EXIT_TIME){
        EXIT_ALPHA=1;
        game_end();
    }
}
if (KEY_MENU_RELEASED){
    MENU_TIME = 0;
	EXIT_ALPHA = 0;
} 

if(room_get_name(room)!=rm_speakeasy){ 
	global.spk_song_pos++; 
} 



if(keyboard_check_pressed(ord("Y"))){
	show_debug_message("player killed");
	player_death();
}