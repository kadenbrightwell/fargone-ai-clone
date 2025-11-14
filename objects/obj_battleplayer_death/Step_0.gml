if(spinning){
	//rot = abs(sin((sqr(time))/(sqr(FPS))));
	//rot = -power(time, ((11/4)*(9/7)))/power(FPS, 4);
	//rot = ((4/5)*power((FPS*time), 3))/power(240, 2);
	if(time<120){
		rot = -(1*power(time, 7.547))/(1*(power(FPS, 8)));
	} else {
		rot = -time / 4;
	}
	rot_d = 360*rot;
	
	#region defaults
	x = 144;
	y = 144;
	#endregion defaults

	show_debug_message("x: " + string(x));
	show_debug_message("y: " + string(y));

	show_debug_message("time: " + string(time))

	show_debug_message("rot: " + string(rot));
	show_debug_message("rot_d: " + string(rot_d));

	time++;
}