//movement calulations
var _movement = scr_calculate_movement(move_spd);
xspd = _movement[0];
yspd = _movement[1];

//warp fixes; stop player movement and direction fix
if(instance_exists(PAUSER)){
	xspd = 0;
	yspd = 0;
}

mask_index = sprite_index;
if(!hit){
	//battle collisions
	if(place_meeting(x, y, BATTLEATTACK) == true){ hit = true; }
}

if(hit){ 
	player_hit();
	
	sprite[RIGHT] = spr_battleplayer_right_hit;
	sprite[UP] = spr_battleplayer_up_hit; 
	sprite[LEFT] = spr_battleplayer_left_hit;
	sprite[DOWN] = spr_battleplayer_down_hit;
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
facing = scr_update_facing(xspd, yspd, facing);

//collisions
var _collision = scr_check_wall_collisions(xspd, yspd, x, y);
xspd = _collision[0];
yspd = _collision[1];

//interactions
scr_handle_interactions(BATTLE_PLAYER.x, BATTLE_PLAYER.y);

//movement implementation
x += xspd;
y += yspd;

//set sprite
sprite_index = sprite[facing];

//animate
if(xspd==0&&yspd==0){image_index=0;}

//depth
depth = DEPTH;