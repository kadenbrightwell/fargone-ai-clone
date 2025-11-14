///@param {String} battle_id
function battle(_id){
	BATTLING = true;
	BATTLER=-1;
	room_goto(rm_battle);
	
	switch(_id){
		case "test-battle-1": 
			ENEMIES = ["ice cream man"];  
			//instance_create_depth(0, 0, -bbox_bottom, obj_icecreambattle);
			BATTLER=room_instance_add(rm_battle, 0, 0, obj_icecreambattle);
			break;
		
		default: ENEMIES = [PLAYER]; break;
	}
}

function reset_battle_trigger(){B_TRIGGER=-1;}
function reset_battle_draw_trigger(){B_DTRIGGER=-1;}
function reset_battle_trigger_data(){B_TRIGGER_D=[];}