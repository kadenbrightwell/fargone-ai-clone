/// @description cone_attack

show_debug_message("Cone " + string(cone_count) + " Launched");

var _data = cone_data[0];

array_delete(cone_data, 0, 1);

var _s=_data[0]; var _g=_data[1];
if(_g==2){ _g=round(irandom(1)); }

var _inst = instance_create_depth(0, 0, DEPTH, obj_icecreamcone);
	_inst.spd = _s; _inst.type = _g;
	_inst.target_x = BATTLE_PLAYER.x; _inst.target_y = BATTLE_PLAYER.y;

if(cone_count>0){
	cone_count--;
	alarm_set(0,cone_time*FPS);
}