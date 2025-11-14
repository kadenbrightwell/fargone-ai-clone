_h_i_c = -1; // house interaction counter; resets on room exit

set_interaction(false, true, false, false, 
function(){
	if(!instance_exists(obj_textbox)){
		_h_i_c++;
		
		switch(_h_i_c){ 
			case 0: create_textbox("rm_tutorialmain-house_locked"); break;
			case 1: create_textbox("rm_tutorialmain-house_locked"); break;
			case 2: create_textbox("rm_tutorialmain-house_locked"); break;
			case 3: create_textbox("rm_tutorialmain-house_locked"); break;
			
			case 4: create_textbox("rm_tutorialmain-house_locked-4"); break;
			case 5: create_textbox("rm_tutorialmain-house_locked-5"); break;
			case 6: create_textbox("rm_tutorialmain-house_locked-6"); break;
			case 7: create_textbox("rm_tutorialmain-house_locked-7"); break;
			case 8: create_textbox("rm_tutorialmain-house_locked-8"); break;
			case 9: create_textbox("rm_tutorialmain-house_locked-9"); break;
			case 10: create_textbox("rm_tutorialmain-house_locked-10"); break;
			case 11: create_textbox("rm_tutorialmain-house_locked-11"); break;
			case 12: create_textbox("rm_tutorialmain-house_locked-12"); break;
			case 13: create_textbox("rm_tutorialmain-house_locked-13"); break;
			case 14: create_textbox("rm_tutorialmain-house_locked-14"); break;
			case 15: create_textbox("rm_tutorialmain-house_locked-15"); break;
			case 16: create_textbox("rm_tutorialmain-house_locked-16"); break;
			case 17: create_textbox("rm_tutorialmain-house_locked-17"); break;
			case 18: create_textbox("rm_tutorialmain-house_locked-18"); break;
			case 19: create_textbox("rm_tutorialmain-house_locked-19"); break;
			
			default: create_textbox("rm_tutorialmain-house_locked-20"); break;
		}
	}
}, 4);