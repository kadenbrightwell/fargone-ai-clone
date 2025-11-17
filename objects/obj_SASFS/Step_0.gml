//movement
move_spd = scr_calculate_move_speed(1.2);
var _movement = scr_calculate_movement(move_spd);
xspd = _movement[0];
yspd = _movement[1];

//warp fixes; stop player movement and direction fix
if(instance_exists(PAUSER)){ xspd = 0; yspd = 0; }

//other fixes
if(instance_number(PLAYER)>1){ instance_destroy() };

//clamp hp
hp = clamp(hp, 0, hp_max);
res = clamp(res, 0, res_max);

//set directional sprite
mask_index = sprite[DOWN];
facing = scr_update_facing(xspd, yspd, facing);

//collisions
var _collision = scr_check_wall_collisions(xspd, yspd, x, y);
xspd = _collision[0];
yspd = _collision[1];

//interactions
scr_handle_interactions(PLAYER.x, PLAYER.y);

//movement implementation
x += xspd;
y += yspd;

//set sprite
sprite_index = sprite[facing];

//animate
if(xspd==0&&yspd==0){image_index=0;}

in_room = room;

//depth
depth = DEPTH;