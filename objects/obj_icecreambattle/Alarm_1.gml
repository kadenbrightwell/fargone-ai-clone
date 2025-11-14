/// @description scoop_attack

show_debug_message("Scoop " + string(scoop_count) + " Launched");

var _data = scoop_data[0];

array_delete(scoop_data, 0, 1);

var _s=_data[0]; var _g=_data[1]; var _a=_data[2];
if(_g==2){ _g=round(irandom(1)); }

var _inst = instance_create_depth(0, 0, DEPTH, obj_icecreamscoop);
	_inst.spd = _s; _inst.type = _g; _inst.anim_spd = _a;
	_inst.target_x = BATTLE_PLAYER.x; _inst.target_y = BATTLE_PLAYER.y;

if(scoop_count>0){
	scoop_count--;
	alarm_set(1,scoop_time*FPS);
}