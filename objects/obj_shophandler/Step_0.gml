var _pct = current_tab;

//tab switching with cooldown
if(navigation_cooldown <= 0){
	if(LEFT_KEY && current_tab>0){
		current_tab--;
		navigation_cooldown = 10;
	}
	if(RIGHT_KEY && current_tab<4){
		current_tab++;
		navigation_cooldown = 10;
	}
	//shoulder button tab switching
	if(SHOP_TAB_PREV && current_tab>0){
		current_tab--;
		navigation_cooldown = 10;
	}
	if(SHOP_TAB_NEXT && current_tab<4){
		current_tab++;
		navigation_cooldown = 10;
	}
} else {
	navigation_cooldown--;
}

if(_pct != current_tab) {
	item_option = 0;
	item_page = 0;
	in_dialogue = false;
}

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
	
	for(var _ai = array_length(_temp_items_array)-1; _ai>=0; _ai--){
		var _si = _temp_items_array[_ai];
		
		for(var _ii = 0; _ii < PLAYERINVCOUNT; _ii++){
			var _inv_i = PLAYERINV[_ii];
			
			if(_inv_i==_si){
				array_push(_temp_temp_items_array, _si);
				break;
			}
		}
	}
	
	_temp_items_array = _temp_temp_items_array;
}

if(current_tab==3){
	_temp_items_array = shop_data.dialogue;
	
	array_delete(dialogue_temp_array, 0, array_length(dialogue_temp_array));
	array_copy(dialogue_temp_array, 0, shop_data.dialogue, item_page*4, min(4,array_length(shop_data.dialogue)-(item_page*4)));
	
	if(!in_dialogue && navigation_cooldown <= 0){
		var _array_len = array_length(dialogue_temp_array);
		if(_array_len > 0){
			if(UP_KEY){
				item_option = (item_option - 1 + _array_len) % _array_len;
				navigation_cooldown = 10;
			}
			if(DOWN_KEY){
				item_option = (item_option + 1) % _array_len;
				navigation_cooldown = 10;
			}
		}
	}
	
	while(item_option>array_length(dialogue_temp_array)-1) { item_option--; }
} else {
	array_delete(items_temp_array, 0, array_length(items_temp_array));
	array_copy(items_temp_array, 0, _temp_items_array, item_page*4, min(4,array_length(_temp_items_array)-(item_page*4)));
	
	if(!in_dialogue && navigation_cooldown <= 0){
		var _array_len = array_length(items_temp_array);
		if(_array_len > 0){
			if(UP_KEY){
				item_option = (item_option - 1 + _array_len) % _array_len;
				navigation_cooldown = 10;
			}
			if(DOWN_KEY){
				item_option = (item_option + 1) % _array_len;
				navigation_cooldown = 10;
			}
		}
	}
	
	while(item_option>array_length(items_temp_array)-1) { item_option--; }
}

last_item_page = ceil(array_length(_temp_items_array)/4)-1;
if(KEY_DEBUG_SHOP_PREV && item_page>0) item_page--;
if(KEY_DEBUG_SHOP_NEXT && item_page<last_item_page) item_page++;


var _item_transaction = function(_t){
	if(array_length(items_temp_array) == 0 || item_option < 0 || item_option >= array_length(items_temp_array)){
		return;
	}
	
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
		var _inv_index = item_option+(item_page*4);
		if(_inv_index >= 0 && _inv_index < PLAYERINVCOUNT){
			array_delete(PLAYERINV, _inv_index, 1);
			PLAYERBAL+=_profit;
		}
	}
};


var _pick_dialogue = function(){
	if(in_dialogue){
		in_dialogue=false;
		
	}else{
		in_dialogue=true;
		
	}
};


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