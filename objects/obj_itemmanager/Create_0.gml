/// @description 

depth = -9998;

//init
item_bord = 8;
item_sep = 16;
text_space = 12;
text_sep = 12;

//functions
/* another way: bi_done = false;*/

//item constructor
/// @description Create an Item Using the Provided Parameters
/// @param {String} name
/// @param {String} description
/// @param {Asset.GMSprite} sprite
/// @param {Bool} droppable?
/// @param {Function} effect
function create_item(_n, _d, _s, _dr, _e) constructor { 
	name = _n; 
	description = _d; 
	sprite = _s; 
	droppable = _dr;
	effect = _e; 
}

//create the items
global.item_list = {
	burger: new create_item("Burger", "This is a BURGER. Recovers 10HP. Increases Max HP +1.", spr_burger, true,
		function(){
			PLAYER.hp += 10;
			PLAYER.hp_max += 1;
			array_delete(inv, selected_item, 1);
		}
	),
	bomb: new create_item("Bomb", "Bomb go big boom! Damages 5HP. Decreases Max HP -2.", spr_bomb, true,
		function(){
			PLAYER.hp -= 5;
			PLAYER.hp_max -= 2;
			array_delete(inv, selected_item, 1);
		}
	),
	biburger: new create_item("BiBurger", "This is a BiBURGER. Recovers 5HP Twiceforth. Twiceforth usable. Increases Max HP +1 Twiceforth.", spr_burger, true,
		function(){
			PLAYER.hp += 5;
			PLAYER.hp_max += 1;
			/* another way: if(bi_done){ array_delete(inv, selected_item, 1); exit; } bi_done = true; inv[selected_item].sprite = spr_biburger; */
			array_insert(inv, selected_item, global.item_list.biburgerhalf);
			array_delete(inv, selected_item+1, 1);
		}
	),
			biburgerhalf: new create_item("BiBurgerHalf", "This is a BiBURGERhalf. Recovers 5HP Twiceforth. Oncemorth usable. Increases Max HP +1 Onceforth (now).", spr_biburger, true,
				function(){
					PLAYER.hp += 5;
					PLAYER.hp_max += 1;
					array_delete(inv, selected_item, 1);
				}
			),
	bomb: new create_item("Bomb", "Bomb go big boom! Damages 5HP. Decreases Max HP -2.", spr_bomb, true,
		function(){
			PLAYER.hp -= 5;
			PLAYER.hp_max -= 2;
			array_delete(inv, selected_item, 1);
		}
	),
	redkey: new create_item("Red Key", "Opens red doors (Single use).", spr_redkey, false,
		function(){
			if(instance_exists(obj_red_door)){
				var _u = false;
				with(obj_red_door){
					if(distance_to_object(PLAYER) < 20){ 
						instance_destroy(); 
						_u=true;
					}
				}
				if(_u) { array_delete(inv, selected_item, 1); } 
			}
		}
	),
	
	beer: new create_item("rootBEER", "Yummy yum yum!", spr_spk_beer, false,
		function(){
			PLAYER.hp += 2;
			PLAYER.hp_max -= 1;
			array_delete(inv, selected_item, 1);
		}
	),
	water: new create_item("water...", "Ew, no.", spr_spk_water, false,
		function(){
			PLAYER.hp += 1;
			PLAYER.hp_max += 1;
			array_delete(inv, selected_item, 1);
		}
	),
}

//create the inventory
inv = array_create(0);

inv_count = 0;
inv_max = 8;

selected_item = -1;