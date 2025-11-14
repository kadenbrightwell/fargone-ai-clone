//set default font
draw_set_font(FONT);

//draw_rectangle_color(0, 0, 200, 200, c_red, c_yellow, c_green, c_blue, false);

var _bg_num = sprite_get_number(spr_battlemenu)-2;
var _bg_subimg = 0;

if(o_transition){
	image_speed = 32;
	_bg_subimg = -1;
}else if(optionable){
	_bg_subimg=_bg_num+1;
}
draw_sprite(spr_battlemenu, _bg_subimg, 0, 0);

if(!array_equals(enemies,EMPTYARRAY)){
	var _enemy_sprite = enemies[0][1];
	var _animating_count = sprite_get_number(enemies[0][6]);

	if(animating && enemy_subimg<_animating_count-1){
		if(anim_frame=-1){
			enemy_subimg = 0;
			anim_frame = 0;
			anim_count++;
			anim_finished=true;
			anim_pauser = instance_create_depth(-800, -800, 800, obj_pauser);
		}
		_enemy_sprite = enemies[0][6];
	
		enemy_subimg=anim_frame;
	
		anim_frame+=enemies[0][7]/FPS;
	} else { 
		animating=false;
		anim_frame=-1;
		if(anim_finished){
			if((anim_count%2)==1){
				enemies[0] = get_battle_enemy(string_lower(string(enemies[0][0])+" - morph"));
			} else {
				enemies[0] = get_battle_enemy(string_lower(string_copy(enemies[0][0],string_length(enemies[0][0]),string_length(" - morph"))));
			}
		
			_enemy_sprite = enemies[0][1];
			enemy_subimg = 0;
		
			instance_destroy(anim_pauser);
			anim_pauser=-1;
			anim_finished=false;
		}
	}

	draw_sprite_ext(_enemy_sprite, enemy_subimg, 144, 96, 1, 1, 0, c_white, 1);
}

if(optionable){
	BATTLE_PLAYER.visible=false;
	
	var _text_scale = 1.1;
	
	var _text_color = [c_white, c_white, c_white, c_white];
	
	if(selected_page!=-1){ _text_color[selected_page] = c_yellow; }
	else { _text_color[page_option] = c_yellow; }
	
	for(var _p = 0; _p<page_length; _p++){
		draw_text_ext_transformed_color(page_x[_p], page_y[_p], pages[_p], page_text_sep, page_text_width, _text_scale, _text_scale, 0, _text_color[_p], _text_color[_p], _text_color[_p], _text_color[_p], 1);
	}
	
	//draw_text_ext_transformed_color(35, 202, "ATTACK", 2, 50, _text_scale, _text_scale, 0, _text_color[0],  _text_color[0], _text_color[0], _text_color[0], 1);
	//draw_text_ext_transformed_color(91, 202, "SPEAK", 2, 50, _text_scale, _text_scale, 0, _text_color[1],  _text_color[1], _text_color[1], _text_color[1], 1);
	//draw_text_ext_transformed_color(147, 202, "ITEMS", 2, 50, _text_scale, _text_scale, 0, _text_color[2],  _text_color[2], _text_color[2], _text_color[2], 1);
	//draw_text_ext_transformed_color(203, 202, "ESCAPE", 2, 50, _text_scale, _text_scale, 0, _text_color[3],  _text_color[3], _text_color[3], _text_color[3], 1);
	
}else{
	BATTLE_PLAYER.visible=true;
}