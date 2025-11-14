sprite_index = item.sprite;

if(place_meeting(x, y, PLAYER) && PLAYER_INTERACT){
	if(inv_add(item)){
		instance_destroy();
	}
}