if(c==0){
	angle = point_direction(start_x, start_y, target_x, target_y);
	angle_r = angle*pi/180;
	x_spd=spd*cos(angle_r); 
	y_spd=-spd*sin(angle_r);
}

x+=x_spd;
y+=y_spd;
	
	//show_debug_message("Image_Angle: " + string(image_angle));
	
	/*
#region logs
show_debug_message("X: " + string(x));
show_debug_message("Y: " + string(y));
show_debug_message("Angle: " + string(angle));

show_debug_message("spd: "+ string(spd));
show_debug_message("x_spd: "+ string(x_spd));
show_debug_message("y_spd: "+ string(y_spd));
show_debug_message("spd (py): " + string(sqrt(sqr(x_spd)+sqr(y_spd))));
	
show_debug_message("Point Direction: " + string(point_direction(start_x, start_y, target_x, target_y)));
	
#region current angle
var _q = 0;
if (BATTLE_PLAYER.x > x && BATTLE_PLAYER.y > y){}
else if (BATTLE_PLAYER.x < x && BATTLE_PLAYER.y > y){_q = 90;}
else if (BATTLE_PLAYER.x < x && BATTLE_PLAYER.y < y){_q = 180;}
else if (BATTLE_PLAYER.x > x && BATTLE_PLAYER.y < y){_q = 270;}
var _angle = abs(arctan( (BATTLE_PLAYER.y-start_y)/(BATTLE_PLAYER.x-start_x) )) + _q;
show_debug_message("Current Angle: " + string(_angle));
	
show_debug_message("Current Point Direction: " + string(point_direction(x, y, BATTLE_PLAYER.x, BATTLE_PLAYER.y)));
#endregion
	
show_debug_message("");
#endregion
	*/
	
if(distance_to_object(BATTLE_PLAYER)>400){ instance_destroy(); }

c++;