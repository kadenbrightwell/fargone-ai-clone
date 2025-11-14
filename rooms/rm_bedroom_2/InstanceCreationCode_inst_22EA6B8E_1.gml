_c_i_c = -1; //corner interaction counter (resets when room exited)

//lower the number closer to 10-20
_cicr = round(random_range(100,200));

set_interaction(false, false, true, true, 
function(){
	if(!instance_exists(obj_textbox)){
		_c_i_c++;
		
		switch(_c_i_c){
			default: create_textbox("rm_bedroom-corner-still"); break;
			
			case 0: create_textbox("rm_bedroom-corner"); break;
			
			case _cicr: create_textbox("rm_bedroom-corner-pleaseForTheLoveOfGodGoOutsideAndTouchSomeGrass"); break;
		}
	}
});