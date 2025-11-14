draw_set_font(FONT);

/*
for(var _i = 0; _i < array_length(inv); _i++){
	var _xx = camera_get_view_x(view_camera[0])+item_bord;
	var _yy = camera_get_view_y(view_camera[0])+item_bord+(item_sep*_i);
	var _col = c_white;
	
	//icon
	draw_sprite(inv[_i].sprite, 0, _xx, _yy);
	
	//get "selected" color
	if(selected_item==_i){ _col = c_yellow; }
	draw_set_color(_col);
	
	//name
	draw_text(_xx + text_space, _yy, inv[_i].name);
	
	//description
	if(selected_item == _i){ draw_text_ext(_xx, _yy - (item_sep*_i) + (item_sep*array_length(inv)), inv[_i].description, text_sep, 80); }
	
	//reset color to white
	draw_set_color(c_white);
}
*/