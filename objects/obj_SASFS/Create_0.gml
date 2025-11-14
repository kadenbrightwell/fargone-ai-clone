//initilize movement variables
xspd = 0;
yspd = 0;

//default movement speed
move_spd = 1;//.2;

name = "SASFS";

//set directional sprites
sprite[RIGHT] = spr_SASFS_right;
sprite[UP] = spr_SASFS_up; 
sprite[LEFT] = spr_SASFS_left;
sprite[DOWN] = spr_SASFS_down;

//default sprite direction
facing = DOWN;

//initialize other vars
hp = 20;
hp_max = 20;
res = 5;
res_max = 40;

in_room = rm_titleroom;

balance = 35;