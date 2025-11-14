_d_i_c = -1; //drawer interaction counter (resets when room exited)

set_interaction(true, true, false, false, 
function(){
	if(!instance_exists(obj_textbox)){
		_d_i_c++;
		
		switch(_d_i_c){
			default: create_textbox("rm_bedroom-drawer"); break;
			
			case 5: create_textbox("rm_bedroom-drawer-overuse-1"); break;
			case 6: create_textbox("rm_bedroom-drawer-overuse"); break;
		
			case 7: _d_i_c=0; create_textbox("rm_bedroom-drawer"); break;
		}
	}
});