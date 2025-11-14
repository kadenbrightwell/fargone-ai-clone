///@param _text_id
function scr_game_text_sp(_text_id){
	var _pl = string_length(PLAYERNAME);
	var _pfix = 0;
	
	switch(_text_id){
		
	//----TESTING----//
		
		case "npc 1":
			scr_text(string("¡Hola {0}! ¡Mi nombre es Blue Kid! Estoy aquí como una prueba del sistema de comunicación!", PLAYERNAME), "blue kid");
				_pfix = _pl+1;
				scr_playercolor(3,3+_pl-1);
				scr_text_color(15+_pfix, 22+_pfix, c_aqua, c_white, c_aqua, c_blue); 
				scr_text_color(36+_pfix, 43+_pfix, c_red, c_orange, c_orange, c_orange);
			scr_text("oh hey Blue Kid.... No esperaba verte aquí....", "green kid - sassy", -1, 0.2);
				scr_text_shake(7, 14);
				scr_text_float(49, 52);
			scr_text("¿Te gusta el sistema de comunicación hasta ahora Green Kid!?", "blue kid");
				scr_option("Sí", "npc 1 - yes");
				scr_option("No", "npc 1 - no");
			break;
			case("npc 1 - yes"):
				scr_text("¡A mí también! Me alegra poder estar aquí para mostrarlo.", "blue kid - happy", -1, 0.5);
				scr_text("Prueba.");
				break;
			case("npc 1 - no"):
				scr_text("¡¿QUÉ!?", "blue kid");
				break;
			
		case "npc 2":
			scr_text("¡Hola! ¡Soy NPC 2!");
			scr_text("woidnaowfgnaopwginapwoginawpgoiawng");
			scr_text("awdafsdgsgafaf");
			break;
			
		case "npc 3":
			scr_text("awdafsdgsgafaf wafnhpoaiuwfhpaowih awfanhowfuianhpfwoiuanhf awhfpoiuawfhpoawiufh aowufhapowfihawoif aowhbdfpaou");
			scr_text("¡Hola! ¡Soy NPC 3!");
			scr_text("woidnaowfgnaopwgin apwoginawpgoiawn guawhfpiawufhp aowiufhapwofi uahwpfoiuah wpfoiawhf");
			break;
			
		case "rm_bedroom-bed":
			scr_text("Parece una cama cómoda.");
			break;
			case "rm_bedroom-bed-overuse":
				scr_text("¿Qué te pasa con esta cama?");
				break;
			case "rm_bedroom-bed-overuse1":
				scr_text("En serio, es algo raro quiero decir es solo una cama.");
				break;
			case "rm_bedroom-bed-overuse2":
				scr_text("Basta YA con la cama.");
				break;
			case "rm_bedroom-bed-overuse3":
				scr_text("Está bien, solo te ignoraré y fingiré que esto nunca pasó.");
				break;
				
		case "rm_bedroom-drawer":
			scr_text("¡Es una mesita de noche!");
			scr_text("¡También es un soporte durante el día!");
			break;
			case "rm_bedroom-drawer-overuse-1":
				scr_text("...");
				break;
			case "rm_bedroom-drawer-overuse":
				scr_text("Gracias por poner tus manitas sucias en todo.");
				break;
				
		case "rm_bedroom-tv":
			scr_text("La TV está apagada. ¿La enciendo?");
			scr_option("Sí", "rm_bedroom-tv - yes");
			scr_option("No", "rm_bedroom-tv - no");
			break;
			case("rm_bedroom-tv - yes"):
				scr_text("No tienes el control remoto.");
				break;
			case("rm_bedroom-tv - no"):
				scr_text("De todas formas no tenías el control remoto.");
				break;
				
		case "rm_bedroom-corner":
			scr_text("Es una esquina.");
			break;
			case "rm_bedroom-corner-still":
				scr_text("Sigue siendo una esquina.");
				break;
			case "rm_bedroom-corner-pleaseForTheLoveOfGodGoOutsideAndTouchSomeGrass":
				scr_text("SIGUE SIENDO UNA MALDITA ESQUINA");
				break;
				
		case "rm_livingroom-drawer":
			scr_text("Son solo unos cajones.");
			break;
			
		case "rm_livingroom-painting1":
			scr_text("Es una imagen de un hombre con el subtítulo \"¿Qué?\".");
			break;
		case "rm_livingroom-painting2":
			scr_text("Es una pintura de un cráneo con llamas pixeladas.");
			break;
			
		case "rm_livingroom-stair-creaky":
			scr_text("Este escalón cruje.");
			break;
		
		case "rm_livingroom-tv":
			scr_text("Es una TV.");
			break;
		
		default:
			break;
	}
}
