_b_i_c = -1; //bed interaction counter (resets when room exited)

set_interaction(true, true, false, false, 
function(){
	if(!instance_exists(obj_textbox)){
		_b_i_c++;
		
		switch(_b_i_c){
			default: create_textbox("rm_bedroom-bed"); break;
			
			case 4: create_textbox("rm_bedroom-bed-overuse"); break;
			case 5: create_textbox("rm_bedroom-bed-overuse1"); break;
			case 6: create_textbox("rm_bedroom-bed-overuse2"); break;
			case 7: create_textbox("rm_bedroom-bed-overuse3"); break;
		
			case 8: _b_i_c=0; create_textbox("rm_bedroom-bed"); break;
		}
	}
});