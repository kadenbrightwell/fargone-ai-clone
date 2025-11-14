if(countdown_done){
	draw_rectangle_color(0,0,room_w,room_h,c_navy,c_navy,c_navy,c_navy,false);
	draw_rectangle_color(0,room_hh-lane_padding,room_w,room_hh,c_silver,c_silver,c_silver,c_silver,false);
	
	for(var _l = 0; _l < lane_count; _l++){
		var _cols = [c_red,c_yellow,c_blue,c_green];
		if(lane_count>4){ _cols = [c_red,c_orange,c_yellow,c_olive,c_green,c_teal,c_blue,c_aqua,c_fuchsia,c_purple,c_silver]; }
		var _l_col = _cols[_l];
		
		var _xl = (lane_width*_l + (lane_padding*(_l+1)));
		var _xr = _xl+lane_width;
		
		var _yt = 0+lane_padding;
		var _yb = lane_height;
		
		draw_rectangle_color( _xl , _yt , _xr , _yb ,_l_col,_l_col,_l_col,_l_col,false);
		
		var _or = [_l, _xl, _xr, _yt, _yb];
	}
}