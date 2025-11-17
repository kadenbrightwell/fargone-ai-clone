width = 128;
height = 208;

op_border = 24;
op_space = 16;

pos = 0;

op_length = 0;
menu_level = 0;
vol_choice = 0;

selection[0] = -1;

icon = false;
icon_spr = [];
icon_index = 0;
icon_shift = 0;
icon_spread = 0;
icon_margin = 1;

/// @param id
function select(_id){
	if(selection[menu_level]==_id){ selection[menu_level]=-1; }
	else{ selection[menu_level] = _id; }
}

/// @description Refreshes menu display state based on current menu_level
function refresh_menu_display(){
	if(menu_level == 4){
		icon = true;
		icon_spr = [spr_menu_button_yellow_off, spr_menu_button_yellow_on];
		icon_margin = 1;
		icon_shift = max(sprite_get_width(icon_spr[0]),sprite_get_width(icon_spr[1])) + 2*icon_margin;
		icon_spread = max(0, op_space-max(sprite_get_height(icon_spr[0]),sprite_get_height(icon_spr[1])) + 2*icon_margin);
	} else {
		icon = false;
	}
}

