/// @description  
B_TRIGGER=-1;
	t_r = false;
B_DTRIGGER=-1;
	dt_r = false;
B_PHASE=-1;
_bpc=0;

o_alarm=false;
option_phase=true;
menu_level=0;
tab_option=0;
	page_option = 0;
	selected_page = -1;
tabs = [];
	tab_length=0;
	selected_tab = -1;

cone_count=0;
cone_time=0;
cone_data=[];

scoop_count=0;
scoop_time=0;
scoop_data=[];

show_debug_message("icecream battle created");


/// @param {Real} count
/// @param {Real} time_sep (s)
/// @param {Real} move_spd
/// @param {Real} cone_type (0 = regular, 1 = glitched, 2 = mixed)
function cone_attack(_c, _t=0.1, _s=2, _g=0){
	cone_count=_c;
	cone_time=_t;
	array_delete(cone_data,0,array_length(cone_data));
	var _ta = [_s, _g];
	for(var _ta_cc = cone_count; _ta_cc>0; _ta_cc--){ array_push(cone_data,_ta); }
	if(cone_count>0){
		cone_count--;
		alarm_set(0,cone_time*FPS);
	}
}

/// @param {Real} count
/// @param {Real} time_sep (s)
/// @param {Real} move_spd
/// @param {Real} cone_type (0 = regular, 1 = glitched, 2 = mixed)
/// @param {Real} animation_speed (default: 8)
function scoop_attack(_c, _t=0.1, _s=2, _g=0, _a=8){
	scoop_count=_c;
	scoop_time=_t;
	array_delete(scoop_data,0,array_length(scoop_data));
	var _ta = [_s, _g, _a];
	for(var _ta_cc = scoop_count; _ta_cc>0; _ta_cc--){ array_push(scoop_data,_ta); }
	if(scoop_count>0){
		scoop_count--;
		alarm_set(1,scoop_time*FPS);
	}
}

/// @description hides the battle player
function hide_battler(){ BATTLE_PLAYER.visible=false; }

/// @description show the battle player
function show_battler(){ BATTLE_PLAYER.visible=true; }

/// @description resets the o_alarm
function reset_o_alarm(){ o_alarm=false; }

B_TRIGGER=0;

c=0;