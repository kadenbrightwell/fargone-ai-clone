function room_interactions_reset(){
	RIN = 0;
	RID = [];
}

/// @description (facing) Right, Up, Left, Down, Result Function, Max DTP(px)
/// @param {Bool} right
/// @param {Bool} up
/// @param {Bool} left
/// @param {Bool} down
function set_interaction(_r, _u, _l, _d){
	obj_interact.pfs[RIN]=[_r,_u,_l,_d];
	obj_interact.result[RIN] = obj_interact.default_result;
	obj_interact.maxdtp[RIN] = obj_interact.default_maxdtp;
	
	RID[RIN] = real(other.id);
	
	if(argument_count > 4){
		obj_interact.result[RIN] = argument[4];
	}
	if(argument_count > 5){
		obj_interact.maxdtp[RIN] = argument[5];
	}
	
	RIN++;
}

/// @param {Real} id
function get_interaction_pos(_id){
	for(var _i = 0; _i < array_length(RID); _i++){
		if(RID[_i]==_id){ return _i; }
	}
	return -1;
}