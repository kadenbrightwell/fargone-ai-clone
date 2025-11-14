///@param _text_id
function scr_game_text(_text_id){
	var _pl = string_length(PLAYERNAME);
	var _pfix = 0;
	
	switch(_text_id){
		
	//----TESTING----//
		
		case "npc 1":
			scr_text(string("Hi {0}! My name is Blue Kid! I'm here as a test of the communication system!", PLAYERNAME), "blue kid");
				_pfix = _pl+1;
				scr_playercolor(3,3+_pl-1);
				scr_text_color(15+_pfix, 22+_pfix, c_aqua, c_white, c_aqua, c_blue); 
				scr_text_color(36+_pfix, 43+_pfix, c_red, c_orange, c_orange, c_orange);
			scr_text("oh hey Blue Kid.... Didn't expect to see you here....", "green kid - sassy", -1, 0.2);
				scr_text_shake(7, 14);
				scr_text_float(49, 52);
			scr_text("Do you like the communication system so far Green Kid!?", "blue kid");
				scr_option("Yeah", "npc 1 - yes");
				scr_option("Nah", "npc 1 - no");
			break;
			case("npc 1 - yes"):
				scr_text("Me too! I'm glad I could be here to help show it off.", "blue kid - happy", -1, 0.5);
				scr_text("Test.");
				break;
			case("npc 1 - no"):
				scr_text("WTF!?!", "blue kid");
				break;
			
		case "npc 2":
			scr_text("Hi! I'm NPC 2!");
			scr_text("woidnaowfgnaopwginapwoginawpgoiawng");
			scr_text("awdafsdgsgafaf");
			break;
			
		case "npc 3":
			scr_text("awdafsdgsgafaf wafnhpoaiuwfhpaowih awfanhowfuianhpfwoiuanhf awhfpoiuawfhpoawiufh aowufhapowfihawoif aowhbdfpaou");
			scr_text("Hi! I'm NPC 3!");
			scr_text("woidnaowfgnaopwgin apwoginawpgoiawn guawhfpiawufhp aowiufhapwofi uahwpfoiuah wpfoiawhf");
			break;
			
		case "rm_bedroom-bed":
			scr_text("Looks like a comfy bed.");
			break;
			case "rm_bedroom-bed-overuse":
				scr_text("What is it with you and this bed?");
				break;
			case "rm_bedroom-bed-overuse1":
				scr_text("Really, it's kinda weird I mean it's just a bed.");
				break;
			case "rm_bedroom-bed-overuse2":
				scr_text("Alright ENOUGH with the bed.");
				break;
			case "rm_bedroom-bed-overuse3":
				scr_text("Fine I'll just ignore you and pretend this never happened.");
				break;
				
		case "rm_bedroom-drawer":
			scr_text("It's a nightstand!");
			scr_text("Its also a stand during the day!");
			break;
			case "rm_bedroom-drawer-overuse-1":
				scr_text("...");
				break;
			case "rm_bedroom-drawer-overuse":
				scr_text("Thanks for putting your grubby little mitts all over everything.");
				break;
				
		case "rm_bedroom-tv":
			scr_text("The TV is off. Turn it on?");
			scr_option("Yes", "rm_bedroom-tv - yes");
			scr_option("No", "rm_bedroom-tv - no");
			break;
			case("rm_bedroom-tv - yes"):
				scr_text("You don't have the remote.");
				break;
			case("rm_bedroom-tv - no"):
				scr_text("You didn't have the remote anyway.");
				break;
				
		case "rm_bedroom-corner":
			scr_text("It's a corner.");
			break;
			case "rm_bedroom-corner-still":
				scr_text("It's still a corner.");
				break;
			case "rm_bedroom-corner-pleaseForTheLoveOfGodGoOutsideAndTouchSomeGrass":
				scr_text("IT IS STILL A FUCKING CORNER");
				break;
				
		case "rm_livingroom-drawer":
			scr_text("It's just some drawers.");
			break;
			
		case "rm_livingroom-painting1":
			scr_text("It's a picture of a man with the caption \"What?\".");
			break;
		case "rm_livingroom-painting2":
			scr_text("It's a painting of a skull with pixelated flames.");
			break;
			
		case "rm_livingroom-stair-creaky":
			scr_text("This step is creaky.");
			break;
		
		case "rm_livingroom-tv":
			scr_text("It's a TV.");
			break;
		
		//piano tiles
		case "pianotiles - start":
			scr_text(string("Greetings {0}! Welcome to [whatever the fuck I'm gonna call this minigame without getting sued by PianoTiles]!", PLAYERNAME), "green kid - sassy");
				_pfix = _pl+1;
				scr_playercolor(10,10+_pl-1);
			if(!PT_PLAYED){
				scr_text("Are you ready to play?", "green kid - sassy");
					scr_option("Yeah", "pianotiles - rules");
					scr_option("Nah", "pianotiles - exit");
				break;
			} else {
				scr_text("Are you ready to play?", "green kid - sassy");
					scr_option("Yeah", "pianotiles - playedyeah");
					scr_option("Nah", "pianotiles - exit");
				break;
			}
			//break;
			
			case "pianotiles - playedyeah": 
					scr_text("Do you want to run over the rules again?", "green kid - sassy");
						scr_option("Yeah", "pianotiles - rules");
						scr_option("Nah", "pianotiles - norules");
						break;
			
				case "pianotiles - rules":
					scr_text("Use 0-9 to control the game.", "green kid - sassy", -1);
					scr_text("Press SPACE to begin.", "green kid - sassy", -1);
					obj_pianotiles_controller.start_song("deviltown");
					break;
				
				case "pianotiles - norules":
					scr_text("Alright hotshot, if you think you're ready, let's see what you've got!", "green kid - sassy");
					obj_pianotiles_controller.start_song("deviltown");
					break;
		
		case "rm_speakeasy_bartender":
			scr_text("Shmatle my friend! Welcome back!", "spk_bartender");
			scr_text("Would you like a drink or something to eat?", "spk_bartender");
				scr_option("Drink", "spr_bartender - drink");
				scr_option("Food", "spr_bartender - food");
			break;
			
				case "spr_bartender - drink":
					scr_text("You might already know, but we only got 2 options. Take your pick.", "spk_bartender");
						scr_option("rootBEER - 2 Moneys", "spk_bartender - beer");
						scr_option("Water - 20 Moneys", "spk_bartender - water");
					break;
					
					case "spk_bartender - beer":
						scr_text("Nice pick! Enjoy.", "spk_bartender");
						inv_add(BEER);
						break;
					case "spk_bartender - water":
						scr_text("Mhm... okay. Here you go I guess.", "spk_bartender");
						inv_add(WATER);
						break;
				
				case "spk_bartender - food":
					scr_text("Pick a food, any food.", "spk_bartender");
						scr_option("Burger - 3 Moneys", "spk_bartender - burger");
						scr_option("Bürgẽr - 6 Moneys", "spk_bartender - bürgẽr");
					break;
					
					case "spk_bartender - burger":
						scr_text("Enjoy.", "spk_bartender");
						inv_add(BURGER);
						break;
					case "spk_bartender - bürgẽr":
						scr_text("En-chante sir.", "spk_bartender");
						inv_add(BIBURGER);
						break;
			
			case "rm_speakeasy_bartender_first-interaction":
				scr_text("Shmatle! Welcome to The Whisper. I have not seen you around these parts before.", "spk_bartender");
				scr_text("Let me know if you'd like something to drink!", "spk_bartender");
				break;
			case "rm_speakeasy_bartender_overdrinking":
			
				break;
		
		case "rm_speakeasy_cw_playing-drummer":
			scr_text("...", "cw_drummer");
			break;
		
			case "rm_speakeasy_cw_playing-drummer_bothering":
				scr_text("What's up, I'm [Alex]. You enjoyin' the set?", "cw_drummer");
				break;
			case "rm_speakeasy_cw_playing-drummer_bothering1":
				scr_text("Honestly it don't bother me either way, I love doin' this stuff.", "cw_drummer");
				break;
			case "rm_speakeasy_cw_playing-drummer_bothering2":
				scr_text("...", "cw_drummer");
				scr_text("Hey listen, it was really nice meetin' you and all, but I gotta get back to this set. Catch me later.", "cw_drummer");
				break;
				case "rm_speakeasy_cw_playing-drummer_bothering2-again":
					scr_text("Hey listen, it was really nice meetin' yo-...", "cw_drummer");
					scr_text("Wait a minute...", "cw_drummer");
					scr_text("...", "cw_drummer");
					scr_text("Have I met you?", "cw_drummer");
						scr_option("Yes", "rm_speakeasy_cw_drummer_playing - yes");
						scr_option("No", "rm_speakeasy_cw_drummer_playing - no");
					break;
					case "rm_speakeasy_cw_drummer_playing - yes":
						scr_text("Thought I recognized you! Let's you and me get to talkin' after the set.", "cw_drummer");
						scr_text("...", "cw_drummer");
						scr_text("Alright well, hey listen, it was really nice meetin' you and all, but I gotta get back to this set. Catch me later.", "cw_drummer");
						break;
					case "rm_speakeasy_cw_drummer_playing - no":
						scr_text("Ah, well geez. Sorry about that. Let me make it up to you, I'll buy you a drink after the set.", "cw_drummer");
						scr_text("...", "cw_drummer");
						scr_text("Well, hey listen, it was really nice meetin' you and all, but I gotta get back to this set. Catch me later.", "cw_drummer");
						break;
		
		case "rm_speakeasy_cw_playing-drum":
			scr_text("bonk.", "cw_drum");
			break;
		
		case "rm_speakeasy_cw_playing-organist":
			scr_text("...", "cw_organist");
			break;
			
		case "rm_speakeasy_icecreamman_battle_start":
			scr_text("You wanna fight bro?","ice cream man - speakeasy");
				scr_option("Yeah","speakeasy-icecreamman-startbattle");
				scr_option("Nah","speakeasy-icecreamman-nostartbattle");
				break;
				
			case "speakeasy-icecreamman-startbattle":
				scr_text("Alright, let's do this!","ice cream man - speakeasy");
				battle("test-battle-1");
				break;
				
			case "speakeasy-icecreamman-nostartbattle":
				scr_text("Oh, okay. My bad.","ice cream man - speakeasy");
				break;
		
			case "rm_speakeasy_cw_playing-organist_bothering":
				scr_text("Hey. I don't want to be rude, but I'm kinda in the middle of something if you couldn't tell.", "cw_organist");
				break;
			case "rm_speakeasy_cw_playing-organist_bothering1":
					scr_text("I really appreciate the support though!", "cw_organist");
					break;			
			case "rm_speakeasy_cw_playing-organist_bothering2":
				scr_text("...", "cw_organist");
				scr_text("Come on man, leave me be. You're kinda starting to bother me.", "cw_organist");
				break;
			case "rm_speakeasy_cw_playing-organist_bothering3":
				scr_text("Hey, like I said, I'm not meaning to be rude, but I'm clearly in the middle of something.", "cw_organist");
				break;
			case "rm_speakeasy_cw_playing-organist_bothering4": 
				scr_text("Come on man, please, leave me alone. You're beginning to frustrate me.", "cw_organist");
				break;
			case "rm_speakeasy_cw_playing-organist_bothering5": 
				scr_text("You're pissing me off. Leave me alone. Now.", "cw_organist");
				scr_text_color(39, 41, #AA0000, #AA0000, #AA0000, #AA0000);
				//scr_text_shake(39, 41);
				break;
			case "rm_speakeasy_cw_playing-organist_bothering6": 
				scr_text("Don't talk to me anymore please.... Or ever.", "cw_organist");
				break;
		
		case "battle - ice cream man - start":
			scr_text("* You're an embarrassment. `n    `n* Try me!", "ice cream man - battle");
			if(TEXTBOX_CLOSED){ B_PHASE=1; } reset_textbox_trigger();
			break;
			
		case "battle - ice cream man - first attack":
			scr_text("* You think you can harm me?", "ice cream man - battle");
			scr_text("* ha. `n    `n* and double ha. `n    `n* ha ha.", "ice cream man - battle");
			scr_text("* Now time for you to die.", "ice cream man - battle");
			break;
			
		case "rm_tutorialmain-house_locked":
			scr_text("The house seems to be locked.", "blue house", -1);
			break;
			
			case "rm_tutorialmain-house_locked-4":
				scr_text("hey", "blue house", -1);
			break;
			
			case "rm_tutorialmain-house_locked-5":
				scr_text("stop it", "blue house", -1);
			break;
			
			case "rm_tutorialmain-house_locked-6":
				scr_text("seriously", "blue house", -1);
			break;
			
			case "rm_tutorialmain-house_locked-7":
				scr_text("knock it off", "blue house", -1);
			break;
			
			case "rm_tutorialmain-house_locked-8":
				scr_text("eww", "blue house", -1);
			break;
			
			case "rm_tutorialmain-house_locked-9":
				scr_text("please", "blue house", -1);
			break;
			
			case "rm_tutorialmain-house_locked-10":
				scr_text("stop", "blue house", -1);
			break;
			
			case "rm_tutorialmain-house_locked-11":
				scr_text("go away", "blue house", -1);
			break;
			
			case "rm_tutorialmain-house_locked-12":
				scr_text("i'm serious", "blue house", -1);
			break;
			
			case "rm_tutorialmain-house_locked-13":
				scr_text("leave me alone", "blue house", -1);
			break;
			
			case "rm_tutorialmain-house_locked-14":
				scr_text("please", "blue house", -1);
			break;
			
			case "rm_tutorialmain-house_locked-15":
				scr_text("come on, stop", "blue house", -1);
			break;
			
			case "rm_tutorialmain-house_locked-16":
				scr_text("please!", "blue house", -1);
			break;
			
			case "rm_tutorialmain-house_locked-17":
				scr_text("i'm done", "blue house", -1);
			break;
			
			case "rm_tutorialmain-house_locked-18":
				scr_text("i can't handle this", "blue house", -1);
			break;
			
			case "rm_tutorialmain-house_locked-19":
				scr_text("bye.", "blue house", -1);
			break;
			
			case "rm_tutorialmain-house_locked-20":
				scr_text("...", "blue house", -1);
			break;
		
		default:
			scr_text("oopsie poopsie...");
			break;
	}
}