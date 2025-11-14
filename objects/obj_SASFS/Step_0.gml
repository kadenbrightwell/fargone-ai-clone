//movement
move_spd = 1.2;
if(PLAYER_SPRINT){ move_spd=2.4; }
if(PLAYER_SUPER_SPRINT){ move_spd=4.0; }
if(PLAYER_SPRINT && PLAYER_SUPER_SPRINT){ move_spd=6.0; }

//movement calulations
xspd = (PLAYER_RIGHT - PLAYER_LEFT)*move_spd;
yspd = (PLAYER_DOWN - PLAYER_UP)*move_spd;

//warp fixes; stop player movement and direction fix
if(instance_exists(obj_pauser)){ xspd = 0; yspd = 0; }

//other fixes
if(instance_number(PLAYER)>1){ instance_destroy() };

//clamp hp
hp = clamp(hp, 0, hp_max);
res = clamp(res, 0, res_max);

//set directional sprite
mask_index = sprite[DOWN];
if(yspd==0){if(xspd>0){facing=RIGHT;}if(xspd<0){facing=LEFT;}}
	if(xspd>0&&facing==LEFT){facing=RIGHT;}
	if(xspd<0&&facing==RIGHT){facing=LEFT;}
if(xspd==0){if(yspd>0){facing=DOWN;}if(yspd<0){facing=UP;}}
	if(yspd>0&&facing==UP){facing=DOWN;}
	if(yspd<0&&facing==DOWN){facing=UP;}
	if(yspd<0&&facing==DOWN){facing=UP;}

//collisions
if(place_meeting(x + xspd, y, obj_wall) == true){ xspd = 0; }
if(place_meeting(x, y+yspd, obj_wall) == true){ yspd = 0; }

//interactions
if(PLAYER_INTERACT){
	with(instance_nearest(PLAYER.x, PLAYER.y, obj_interact)){
		var _pos = get_interaction_pos(real(id));
		if( ( distance_to_object(PLAYER) <= maxdtp[_pos] ) && ( pfs[_pos][PLAYERDIR] == 1 ) ){
			result[_pos]();
		}
	}
}

//FIX FIX FIX
 /*
var _xyspd = xspd+yspd;
if(xspd>yspd){
	
}*/

//movement implementation
x += xspd;
y += yspd;

//set sprite
sprite_index = sprite[facing];

//animate
if(xspd==0&&yspd=0){image_index=0;}

in_room = room;

//depth
depth = DEPTH;