//picking up items
/// @description Function for player item pickup.
/// @param {Struct} item
function inv_add(_i){ 
	var _a = false;
	if(array_length(obj_itemmanager.inv)<obj_itemmanager.inv_max){
		array_push(obj_itemmanager.inv, _i); 
		_a = !_a;
	}
	return _a;
}