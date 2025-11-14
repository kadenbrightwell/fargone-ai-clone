//initilize movement variables
xspd = 0;
yspd = 0;

//default movement speed
move_spd = 1;

visible = false;

//set directional sprites
sprite[RIGHT] = spr_battleplayer_right;
sprite[UP] = spr_battleplayer_up; 
sprite[LEFT] = spr_battleplayer_left;
sprite[DOWN] = spr_battleplayer_down;

//default sprite direction
facing = DOWN;

//initialize other vars
hp = 20;
hp_max= 20;

x=144;
y=144;

hit = false;
hit_time = 2*FPS;
hit_timer = 0;
function player_hit(){ //change this to count down then check if hit time is zero to be allowed to be hit again. this is fixable
	if(hit_timer>=hit_time){ hit = false; hit_timer = 0; }
	if(hit_timer==1){  hp -= BATTLE.atk_dmg; }
	else { hit_timer++; }
}