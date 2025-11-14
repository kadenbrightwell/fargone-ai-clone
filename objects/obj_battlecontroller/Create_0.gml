///@description 

if(!BATTLING){
	room_goto_next();
} 

enemies = [];
enemy_count = 0;
enemy_subimg = 0;

atk_dmg = 0;

//WORKING ON THIS AND TITLE MENU TO PRINT OPTIONS
width = 64;
height = 104;

op_border = 8;
op_space = 16;

pos = 0;

op_length = 0;
menu_level = 0;
vol_choice = 0;

pages = ["ATTACK","SPEAK","ITEMS","ESCAPE"];
	page_length = array_length(pages);
page_option = 0;
	selected_page = -1;
page_x = [35, 91, 147, 203];
page_y = [202, 202, 202, 202];
	page_text_sep = 2;
	page_text_width = 50;

animating = 0;
	anim_frame = -1;
	anim_finished = false;
	anim_count = 0;
	anim_pauser = -1;
optionable = 0;
	o_transition = false;
	o_t_time = 1200; //ms
	o_t_timer = 0;

///@param {Array} enemy_array
///@description Enter as Array of strings the identifiers of the enemies to fight
function start_battle(_enemy){
	show_debug_message("battle started 02");
	init_battle_vars(_enemy);
	
	init_battle_player();
}



///@param {Array} enemies
function init_battle_vars(_enemies){
	enemy_count = array_length(_enemies);
	show_debug_message("enemy_count: " + string(enemy_count));
	
	bh = PLAYER.hp; //battle hp
	bhm = PLAYER.hp_max; //battle hp max
	
	if((enemy_count<=0) || (array_equals(_enemies, EMPTYARRAY))){
		enemies[0] = ["Nobody1", EMPTYSPRITE, 1, 1];
	} else {
		for(var _e = 0; _e < enemy_count; _e++){
			enemies[_e] = get_battle_enemy(_enemies[_e]);
		}
	}
}



/// @param {String} enemy_string
/// @description name, sprite, hp, hp_max, level, strength_boost, anim_spr, anim_spd
function get_battle_enemy(_str_enemy){
	
	show_debug_message("STR_ENEMY: " + string(_str_enemy));
	var _e_ra = ["Nobody3", EMPTYSPRITE, 0, 0, 0, 0, EMPTYSPRITE, 0];
	
	show_debug_message("getting battle enemy");
	
	switch(_str_enemy){
		case "SASFS": _e_ra = ["SASFS?", spr_bed, 999999, 999999, 69, 0.69, spr_bed, 0]; break;
		
		case "cw organist":
			show_debug_message("piano man");
			_e_ra = ["Piano Man",spr_cw_organist,20,20, 10, 0.9, spr_cw_organist,0];
			break;
			
		case "ice cream man":
			show_debug_message("ice cream man");
			_e_ra = ["Ice Cream Man", spr_rando2, 100, 102, 8, 1, spr_rando2_morph, 8];
			break;
			
		case "ice cream man - morph":
			show_debug_message("ice cream man - morph");
			_e_ra = ["Ice Cream Man - Morph", spr_rando2_battle, 100, 102, 12, 1.05, spr_rando2_morph, -8];
			break;
		
		default: _e_ra = ["Nobody4", EMPTYSPRITE, 0, 0, 0, 0, EMPTYSPRITE, 0]; break;
	}
	
	return _e_ra;
}

function init_battle_player(){
	show_debug_message("initialized battle player");
	
	PLAYER.visible = false;
	//instance_create_layer(40, 40, "Instances", BATTLE_PLAYER);
	BATTLE_PLAYER.x = 144; BATTLE_PLAYER.y = 144;
	BATTLE_PLAYER.visible = true;
	BATTLE_PLAYER.hp = bh;
	BATTLE_PLAYER.hp_max = bhm;
}

show_debug_message("starting battle 01");