/*
//get selected item
selected_item = -1;
for(var _ii = 0; _ii < array_length(inv); _ii++){
	var _xx = camera_get_view_x(view_camera[0])+item_bord;
	var _yy = camera_get_view_y(view_camera[0])+item_bord+(item_sep*_ii);
	
	if((mouse_x>_xx && mouse_x<(_xx+sprite_get_width(inv[_ii].sprite)))&& (mouse_y>_yy && mouse_y<(_yy + sprite_get_height(inv[_ii].sprite)))){
		selected_item = _ii;
	}
}

if(selected_item!=-1){
	//use an item
	if(mouse_check_button_pressed(mb_left)){
		inv[selected_item].effect();
	}
	
	//drop an item
	if(mouse_check_button_pressed(mb_right)){
		if(inv[selected_item].droppable){
			//get rid of item
			array_delete(inv, selected_item, 1);
		}
	}
}
*/

inv_count = array_length(PLAYERINV);