if(keyboard_check_pressed(ord("B"))){
	animating=!animating;
	show_debug_message("Animating?: " + string(animating));
}

if(keyboard_check_pressed(ord("N"))){
	var _e01 = enemies[0][1];
	if(_e01=spr_rando2_battle){_e01=spr_rando2;}
	else if(_e01=spr_rando2){_e01=spr_rando2_battle;}
	enemies[0][1]=_e01;
	show_debug_message("battle sprite");
}

if(keyboard_check_pressed(ord("M"))){
	optionable=!optionable;
	show_debug_message("Optionable?: " + string(optionable));
}


if(o_transition&&o_t_timer<o_t_time){
	o_t_time++;
}else{
	o_transition=false;
	o_t_time=0;
}

if(!array_equals(enemies, EMPTYARRAY)){
	var _rdl = round((enemies[0][4]*enemies[0][5])/(2*(1+PLAYERRESP)));
	var _rdh = round((enemies[0][4]*enemies[0][5])/(4*(1+PLAYERRESP)));
	atk_dmg = irandom_range(_rdl, _rdh);
}

if(optionable){ 
	if(selected_page==-1){
		page_option += DOWN_KEY - UP_KEY;
		page_option = clamp(page_option, 0, 3);
	} else if(BACK_KEY){ page_option=selected_page; selected_page=-1; } 
	
	if(INTERACT_KEY){ selected_page = page_option; }
	
	
} else { page_option = 0; }



/*
#region Log Messages
show_debug_message("battle_player.x: " + string(BATTLE_PLAYER.x));
show_debug_message("battle_player.y: " + string(BATTLE_PLAYER.y));

show_debug_message("optionable: " + string(optionable));
show_debug_message("_optionable: " + string(_optionable));
show_debug_message("o_transition: " + string(o_transition));
show_debug_message("o_t_time: " + string(o_t_time));
show_debug_message("o_t_timer: " + string(o_t_timer));

show_debug_message("");
#endregion
*/