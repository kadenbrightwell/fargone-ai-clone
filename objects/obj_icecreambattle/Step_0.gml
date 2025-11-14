var _pbp = B_PHASE;

var _sml = menu_level;

switch(B_TRIGGER){
	case 0:
		ENEMIES=["ice cream man"];
		BATTLE.start_battle(ENEMIES);
		audio_play_sound(snd_battle_1, 6, true, MVOL);
		B_PHASE=0;
		break;
		
	case 3:
		B_PHASE=2; show_debug_message("phase set to 2"); 
		break;
		
	case 5:
		audio_stop_sound(snd_battle_1);
		execute after 2 seconds
			audio_play_sound(snd_battle_2, 6, true, MVOL);
		done
		
		break;
		
	case 6:
		audio_stop_sound(snd_battle_2);
		break;
		
	case 17:
		cone_attack(8, 0.4, 2, 2);
		//reset_battle_trigger_data();
		break;
	case 18:
		scoop_attack(4, 0.8, 1.2, 2, 6);
		//reset_battle_trigger_data();
		break;
		
} reset_battle_trigger();

//phase must change above :shrug:
if( _pbp!=B_PHASE ){ _bpc=0; } else { _bpc++; }

switch(B_PHASE){
	case 0:
		hide_battler();
		B_DTRIGGER=0;
		break;
		
	case 1:
		hide_battler();
		option_phase=true;
		BATTLE.optionable=true;
		B_DTRIGGER=2;
		break
		
	case 2:
		if(_bpc=0){
			show_debug_message("phase 2 switch triggered");
			alarm_set(3,2*FPS);
		}
		BATTLE.optionable=false;
		option_phase = false;
		show_battler();
		break;
}

if(INTERACT_KEY){
	switch(B_PHASE){
		case 0:
			B_PHASE=1;
			break;
	}
}

if(keyboard_check_pressed(ord("O"))){ B_TRIGGER=17; }
if(keyboard_check_pressed(ord("P"))){ B_TRIGGER=18; }

if(option_phase){
	tabs[0, 0] = ""; //ATTACK
		tabs[1, 0] = "Insult";
		tabs[1, 1] = "Joke";
		tabs[1, 2] = "Cry";
	tabs[0, 1] = ""; //SPEAK
		tabs[2, 0] = "Identify";
		tabs[2, 1] = BATTLE.enemies[0][0];
	tabs[0, 2] = ""; //ITEMS
		for(var _it = 0; _it < array_length(PLAYERINV); _it++){
			tabs[3, _it] = PLAYERINV[_it].name;
		}
	tabs[0, 3] = ""; //ESCAPE
		tabs[4, 0] = "Sooth";
		tabs[4, 1] = "Run  ";
	
	tab_length = array_length(tabs[menu_level]);
	
	tab_option += RIGHT_KEY - LEFT_KEY;
	tab_option = clamp(tab_option, 0, tab_length-1); //REWATCH PEYTON VIDEO ABOUT TITLE MENU AND IMPLEMENT HERE
}

if(option_phase){
	//using the options
	if (INTERACT_KEY){ 
	    switch (menu_level) {
	        case 0:
	            switch (BATTLE.selected_page) {
	                case 0: //ATTACK
	                    menu_level = 1;
	                    break;
	                case 1: //SPEAK
	                    menu_level = 2;
	                    break;
	                case 2: //ITEMS
	                    menu_level = 3;
	                    break;
					case 3: //ESCAPE
	                    menu_level = 4;
	                    break;
	            }
	            break;

	        case 1: //ATTACK MENU
	            switch (selected_tab) {
	                case 0: //insult
						B_PHASE=1;
						B_TRIGGER=3;
						break; 
	                case 1: B_TRIGGER=3; break; //joke
	                case 2: B_TRIGGER=3; break; //cry
	            }
	            break;

	        case 2:
	            switch (selected_tab) {
	                case 0:
	                    break;
	                case 1:
	                    break;
	                case 2:
	                    break;
	                case 3:
	                    break;
	                case 4:
	                    break;
	            }
	            break;

	        case 3:
	            switch (selected_tab) {
	                case 0: break;
	                case 1: break;
	                case 2: break;
	                case 3: break;
	                case 4: break;
	                case 5: break;
	            }
	            break;
		}

	    // Fix option length
	    tab_length = array_length(tabs[menu_level]);
	}
}

if(option_phase){ if(BACK_KEY){ menu_level=0; } }

hide_battler();

c++;

// Reset position if needed
if (_sml != menu_level) { tab_option = 0; selected_tab = -1; }

if(keyboard_check_pressed(ord("]"))){B_PHASE=2;}