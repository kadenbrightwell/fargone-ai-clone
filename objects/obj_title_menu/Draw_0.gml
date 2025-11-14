//set default font
draw_set_font(FONT);

//dynamically get 'w' and 'h' of menu
width = op_border*2 + array_max(array_map(option[menu_level], string_width));
height = op_border*2 + string_height(option[0, 0]) + (op_length-1)*op_space;

//center menu
x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2 - width/2;
y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/2 - height/2;

//draw menu background
draw_sprite_ext(sprite_index, image_index, x, y, width/sprite_height, height/sprite_height, 0, c_white, 1);

//set option defaults
draw_set_valign(fa_top);
draw_set_halign(fa_left);

//draw an icon (if there is one)
if(icon){
	for(var _i = 0; _i < op_length-1; _i++){
		icon_index=0;
		if(selection[menu_level]==_i){icon_index=1;}
		draw_sprite_ext(icon_spr[icon_index], 0, x+op_border+icon_margin, y+op_border+icon_spread + op_space*_i, 1, 1, 0, c_white, 1);
	}
}

//draw the options
for(var _o = 0; _o < op_length; _o++){
	var _c = c_black;
	if(pos==_o){ _c = #8E5300; }
	draw_text_ext_color(x+op_border+icon_shift, y+op_border+icon_spread + op_space*_o, option[menu_level, _o], 2, string_width(option[menu_level, _o]), _c, _c, _c, _c, 1);
}