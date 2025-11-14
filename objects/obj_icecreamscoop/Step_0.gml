if(c==0){
	angle = point_direction(start_x, start_y, target_x, target_y);
	angle_r = angle*pi/180;
	x_spd=spd*cos(angle_r); 
	y_spd=-spd*sin(angle_r);
}

x+=x_spd;
y+=y_spd;
	
if(distance_to_object(BATTLE_PLAYER)>400){ instance_destroy(); }

sprite=spr_battle_icecream_scoop;
if(type=1){sprite=spr_battle_icecrean_scoop_glitch;}

c++;