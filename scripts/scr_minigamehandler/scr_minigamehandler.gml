///@param {String} minigame_id
function minigame(_id){
	MINIGAMING = true;
	
	switch(_id){
		case "pianotiles": room_goto(rm_pianotiles); break;
		
		default: break;
	}
}