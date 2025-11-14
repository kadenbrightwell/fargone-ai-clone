if(place_meeting(x, y, PLAYER) && !instance_exists(obj_warp)){
	var _warp = instance_create_depth(0, 0, -9990, obj_warp);
	_warp.target_rm = target_rm;
	_warp.target_x = target_x;
	_warp.target_y = target_y;
	_warp.target_dir = target_dir;
	
	_warp.room_color = room_color;
	_warp.target_color = target_color;
	_warp.t_color = room_color;
}