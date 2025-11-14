var _pct = current_tab;

if(LEFT_KEY && current_tab>0) current_tab--;
if(RIGHT_KEY && current_tab<4) current_tab++;

if(_pct != current_tab) {
	show_debug_message("Current Tab: "+string(current_tab));
	
	item_option = 0;
	item_page = 0;
	in_dialogue = false;
}


/*
for(var _p = 0; _p<array_length(items_temp_array); _p++){
	var __x1 = outer_padding
	var __y1 = shop_text_upper_y+outer_padding+(inner_padding*_p);
	var __is = items_temp_array[_p].item.name;
	var __tw = view_wport-(outer_padding*2);
	
	draw_text_ext(__x1, __y1, __is, 2, __tw);
}
*/




/*-------------------ITEMS---------------*/

	_temp_buyable_array = [];
	_temp_sellable_array = [];

var _sort_elements = function(_element, _index){
	if(_element.buyable == true){
		array_push(_temp_buyable_array, _element);
	}
	if(_element.sellable == true){
		array_push(_temp_sellable_array, _element);
	}
}

array_foreach(shop_data.items, _sort_elements);

items_temp_buy_array = _temp_buyable_array;
items_temp_sell_array = _temp_sellable_array;

var _temp_items_array = [];

if(current_tab==0){
	_temp_items_array = items_temp_buy_array;
}else if(current_tab==1){
	_temp_items_array = items_temp_sell_array;
	var _temp_temp_items_array = [];
	
	for(var _ai = array_length(_temp_items_array)-1; _ai>0; _ai--){
		var _si = _temp_items_array[_ai];
		
		show_debug_message("_ai: " + string(_ai));
		show_debug_message("_si: " + string(_si));
		
		for(var _ii = 0; _ii < PLAYERINVCOUNT; _ii++){
			var _inv_i = PLAYERINV[_ii];
			
			show_debug_message("_ii: " + string(_ii));
			show_debug_message("_inv_i: " + string(_inv_i));
			
			if(_inv_i==_si){
				array_push(_temp_temp_items_array, _si);
			}
		}
	}
	
	_temp_items_array = _temp_temp_items_array;
	
	show_debug_message("_temp_temp_items_array: " + string(_temp_items_array));
	show_debug_message("_temp_items_array: " + string(_temp_items_array));
}

if(current_tab==3){
	_temp_items_array = shop_data.dialogue;
	
	array_delete(dialogue_temp_array, 0, array_length(dialogue_temp_array));
	array_copy(dialogue_temp_array, 0, shop_data.dialogue, item_page*4, min(4,array_length(shop_data.dialogue)-(item_page*4)));
	
	if(!in_dialogue){
		if(UP_KEY && item_option>0) item_option--;
		if(DOWN_KEY && item_option<array_length(dialogue_temp_array)-1) item_option++;
	}
	
	while(item_option>array_length(dialogue_temp_array)-1) { item_option--; }
} else {
	array_delete(items_temp_array, 0, array_length(items_temp_array));
	array_copy(items_temp_array, 0, _temp_items_array, item_page*4, min(4,array_length(_temp_items_array)-(item_page*4)));
	
	if(!in_dialogue){
		if(UP_KEY && item_option>0) item_option--;
		if(DOWN_KEY && item_option<array_length(items_temp_array)-1) item_option++;
	}
	
	while(item_option>array_length(items_temp_array)-1) { item_option--; }
}

last_item_page = ceil(array_length(_temp_items_array)/4)-1;
show_debug_message("Page: " + string(item_page));
show_debug_message("Last Page: " + string(last_item_page));
if(keyboard_check_pressed(ord("J")) && item_page>0) item_page--;
if(keyboard_check_pressed(ord("K")) && item_page<last_item_page) item_page++;


var _item_transaction = function(_t){
	var _item = items_temp_array[item_option];
	var _cost = _item.buy_price;
	var _profit = _item.sell_price;
	
	if(_t==0){
		if(PLAYERINVCOUNT<PLAYERINVMAX && _cost<=PLAYERBAL){
			inv_add(_item);
			PLAYERBAL-=_cost;
		}
	}
	else if(_t==1){
		array_delete(PLAYERINV, item_option+(item_page*4), 1);
		PLAYERBAL+=_profit;
	}
};


var _pick_dialogue = function(){
	if(in_dialogue){
		in_dialogue=false;
		
	}else{
		in_dialogue=true;
		
	}
};

show_debug_message("Inv: " + string(PLAYERINV));

/*------------------------INTERACTION------------------------*/
if(PLAYER_INTERACT){
	switch(current_tab){
		case 0: _item_transaction(0); break;
	
		case 1: _item_transaction(1); break;
		
		case 2: 
			break;
		
		case 3:
			_pick_dialogue();
			break;
		
		case 4:
			//audio_stop_sound(snd_shop);
			PLAYER.x = 128;
			PLAYER.y = -16;
			PLAYERDIR = UP; 
			break;
	}
}