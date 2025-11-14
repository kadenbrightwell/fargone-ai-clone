//movement keys
up_key = PLAYER_UP;
left_key = PLAYER_LEFT;
down_key = PLAYER_DOWN;
right_key = PLAYER_RIGHT;

//movement calulations
xspd = (right_key - left_key)*move_spd;
yspd = (down_key - up_key)*move_spd;

//warp fixes; stop player movement and direction fix
if(instance_exists(obj_pauser)){
	xspd = 0;
	yspd = 0;
}

mask_index = sprite_index;
if(!hit){
	//battle collisions
	if(place_meeting(x /*+ xspd*/, y, obj_battleattack) == true){ hit = true; show_debug_message("touching"); }
	//if(place_meeting(x, y+yspd, obj_battleattack) == true){ player_hit(); }
}

if(hit){ 
	player_hit();
	
	sprite[RIGHT] = spr_battleplayer_right_hit;
	sprite[UP] = spr_battleplayer_up_hit; 
	sprite[LEFT] = spr_battleplayer_left_hit;
	sprite[DOWN] = spr_battleplayer_down_hit;
	
	show_debug_message("HIT: " + string(hit));
} else {
	sprite[RIGHT] = spr_battleplayer_right;
	sprite[UP] = spr_battleplayer_up; 
	sprite[LEFT] = spr_battleplayer_left;
	sprite[DOWN] = spr_battleplayer_down;
}

//other fixes
if(instance_number(BATTLE_PLAYER)>1){ instance_destroy(); }

//clamp hp and ---- end battle?
if(hp<=0){ GLOBAL.player_death(); }

hp = clamp(hp, 0, hp_max);

//set directional sprite
mask_index = sprite[DOWN];
if(yspd==0){if(xspd>0){facing=RIGHT;}if(xspd<0){facing=LEFT;}}
	if(xspd>0&&facing==LEFT){facing=RIGHT;}
	if(xspd<0&&facing==RIGHT){facing=LEFT;}
if(xspd==0){if(yspd>0){facing=DOWN;}if(yspd<0){facing=UP;}}
	if(yspd>0&&facing==UP){facing=DOWN;}
	if(yspd<0&&facing==DOWN){facing=UP;}

//collisions
if(place_meeting(x + xspd, y, obj_wall) == true){
	xspd = 0;
}
if(place_meeting(x, y+yspd, obj_wall) == true){
	yspd = 0;
}

//interactions
if(PLAYER_INTERACT){
	with(instance_nearest(BATTLE_PLAYER.x, BATTLE_PLAYER.y, obj_interact)){
		var _pos = get_interaction_pos(real(id));
		if( ( distance_to_object(BATTLE_PLAYER) <= maxdtp[_pos] ) && ( pfs[_pos][PLAYERDIR] == 1 ) ){
			result[_pos]();
		}
	}
}

//movement implementation
x += xspd;
y += yspd;

//set sprite
sprite_index = sprite[facing];

//animate
//if(xspd==0&&yspd=0){image_index=0;}

//depth
depth = DEPTH;





show_debug_message("HP: " + string(hp));