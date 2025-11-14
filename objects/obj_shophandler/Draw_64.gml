//draw_roundrect_color_ext(outer_padding,outer_padding,view_wport-outer_padding,view_hport-outer_padding,corner_rounding,corner_rounding,c_gray,c_gray,true);
draw_sprite_ext(shop_data.background, current_tab, 0, 0, 4, 4, 0, c_white, 1);

	//draw animated background parts
	var _shopkeeper  = shop_data.owner[1];
	if(in_dialogue){
		if(item_option<0) item_option=0;
		var _temp_shopkeeper = dialogue_temp_array[item_option].sprite;
		
		if(_temp_shopkeeper!=_shopkeeper && _temp_shopkeeper!=undefined){ _shopkeeper = _temp_shopkeeper; }
	}
	

	image_speed = 0;
	var _shopkeeper_subimg = 0;
	if(current_tab==2){ _shopkeeper_subimg = 1; }
	draw_sprite_ext(_shopkeeper, _shopkeeper_subimg, 144*draw_scale, 145*draw_scale, draw_scale, draw_scale, 0, c_white, 1);

	image_speed = 0.15;
	draw_sprite_ext(spr_candel_flicker, -1, 281*draw_scale - 80, 89*draw_scale, draw_scale, draw_scale, 0, c_white, 1);
	draw_sprite_ext(spr_potions_bubbling, -1, 248*draw_scale - 0, 66*draw_scale, draw_scale, draw_scale, 0, c_white, 1);
	draw_sprite_ext(spr_cat_and_fishbowl, -1, 246*draw_scale - 0, 31*draw_scale, draw_scale, draw_scale, 0, c_white, 1);
	
	var _recordplayer_sprite = spr_recordplayer_music;
	if(current_tab==3){ _recordplayer_sprite = spr_recordplayer_music_part; }
	draw_sprite_ext(_recordplayer_sprite, -1, 202*draw_scale - 0, 109*draw_scale, draw_scale, draw_scale, 0, c_white, 1);
	

var _purchaseables_text = function(){
	
	var __r = view_wport;
	var __rb = __r-(outer_padding*draw_scale);
	var __l = 216*draw_scale;
	var __lb = __l+(outer_padding*draw_scale);
	var __dtw = __rb-__lb;
	var __dy = (shop_text_upper_y+outer_padding)*draw_scale;
	var __ds = 2;
			
	var __by = view_hport-(outer_padding*2*draw_scale);
	
	
	for(var _p = /*(item_page*4)*/0; _p<array_length(items_temp_array); _p++){
			
			var __x = (outer_padding*1.5)*draw_scale;
			var __y = (shop_text_upper_y+outer_padding+(inner_padding*_p))*draw_scale;
			var __s = items_temp_array[_p].item.name;
			var __w = view_wport-(outer_padding*2);
			var __sw = string_width_ext(__s, 2, __w)*text_scale;
			
			draw_text_ext_transformed_color(__x, __y, __s, 2, __w, text_scale, text_scale, 0, items_temp_array[_p].color, items_temp_array[_p].color, items_temp_array[_p].color, items_temp_array[_p].color, 1);
			
			item_option_x[_p] = __x+__sw+(2*outer_padding);
			item_option_y[_p] = __y+8;
			
			
			
			
			
			if(_p == item_option){
				//draw arrow
				draw_sprite_ext(spr_shop_pointer, 0, item_option_x[_p], item_option_y[_p], text_scale, text_scale, 0, arrow_color, 1);
				
				//draw description
				draw_text_ext_transformed_color(__lb, __dy, items_temp_array[_p].item.description, 4*text_scale, (__dtw/__ds)+(outer_padding*2), __ds, __ds, 0, items_temp_array[_p].color, items_temp_array[_p].color, items_temp_array[_p].color, items_temp_array[_p].color, 1);
				
				//draw cost
				var _ps = "";
				if(current_tab==0){
					current_item_price = items_temp_array[_p].buy_price;
					_ps = "Price: "+string(current_item_price);
				}else if(current_tab==1){
					current_item_price = items_temp_array[_p].sell_price;
					_ps = "Income: "+string(current_item_price);
				}
				draw_text_ext_transformed_color(__lb, __by, _ps, 2,__dtw, __ds, __ds, 0, arrow_color, arrow_color, arrow_color, arrow_color, 1);
			}
			
			
		}
		
		var __bs = "Purse: " + string(PLAYERBAL);
		var __btw = string_width(__bs);
				
		draw_text_ext_transformed_color(__rb-((__btw+2)*__ds), __by, __bs, 2, __btw, __ds, __ds, 0, arrow_color, arrow_color, arrow_color, arrow_color, 1);
}

/*---------------------------TABS----------------------------*/

switch(current_tab){
	
	case 0:
		_purchaseables_text();
		break;
	
	case 1:
		_purchaseables_text();
		break;
		
	case 2: 
		draw_text_ext_transformed_color((outer_padding*draw_scale), /*(shop_text_upper_y+outer_padding)*draw_scale*/  (((shop_text_upper_y+shop_text_lower_y)/2)-(outer_padding*2))*draw_scale, shop_data.welcome_msg, 2, (view_wport-(outer_padding*2))/4, text_scale, text_scale, 0, shop_data.text_color, shop_data.text_color, shop_data.text_color, shop_data.text_color, 1);
		break;
		
	case 3:
	
		for(var _p = 0; _p<array_length(dialogue_temp_array); _p++){
			var __x = (outer_padding*1.5)*draw_scale;
			var __y = (shop_text_upper_y+outer_padding+(inner_padding*_p))*draw_scale;
			var __s = dialogue_temp_array[_p].title;
			var __w = view_wport-(outer_padding*2);
			var __sw = string_width_ext(__s, 2, __w)*text_scale;
			var _c = shop_data.text_color;
			
			if(!in_dialogue){
				draw_text_ext_transformed_color(__x, __y, __s, 2, __w, text_scale, text_scale, 0, _c, _c, _c, _c, 1);
			
				item_option_x[_p] = __x+__sw+(2*outer_padding);
				item_option_y[_p] = __y+8;
			
				if(_p == item_option){
					//draw arrow
					draw_sprite_ext(spr_shop_pointer, 0, item_option_x[_p], item_option_y[_p], text_scale, text_scale, 0, arrow_color, 1);
				}
			} else {
				__y = (shop_text_upper_y+outer_padding)*draw_scale;
				__s = dialogue_temp_array[item_option].msg;
				
				draw_text_ext_transformed_color(__x, __y, __s, 2*text_scale, __w/text_scale, text_scale, text_scale, 0, _c, _c, _c, _c, 1);
			}
		}
			
		break;
		
	case 4:
		draw_text_ext_transformed_color((outer_padding*draw_scale), /*(shop_text_upper_y+outer_padding)*draw_scale*/  (((shop_text_upper_y+shop_text_lower_y)/2)-(outer_padding*2))*draw_scale, "* Bye bye now. Come again!", 2, (view_wport-(outer_padding*2))/4, text_scale, text_scale, 0, shop_data.text_color, shop_data.text_color, shop_data.text_color, shop_data.text_color, 1);
		break;
}