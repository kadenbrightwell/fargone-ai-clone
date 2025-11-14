depth=DEPTH;

x = 144; y = 96;
	target_x=x; 
	target_y=y;
	start_x=x; 
	start_y=y;
angle = point_direction(start_x, start_y, target_x, target_y);
angle_r = angle*pi/180;

spd=0;
	x_spd=spd*cos(angle); 
	y_spd=spd*sin(angle); 

type=0;

c=0;