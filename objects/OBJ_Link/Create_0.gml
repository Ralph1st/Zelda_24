 sprite_index = tile000;
image_speed = 0;
image_xscale = 1;
last_position = array_create(2, x);
last_position[0] = x;
last_position[1] = y;

dy = 1; //acceleration speed  basicly
dx = 0; //x movement rigth left switch  basicly

//mv_speed = 1 //character's movement speed (pixels ig)
grav = 1; //stage gravity (change for space or water levels ;D )
//jump_prog = 16 //unimplemented
jump_speed = 9; //the  speed of the jump

//knockback_fr = .9;

enum PLAYER_STATE {
	in_control_platformer, //2D sideview physics
	in_control_top_down, //top-down view physics
	top_down_attacking, //must stop player in top down when attacking
	top_down_falling, //hole top-down -till reset
	HURT_top_down,
	HURT_platformer,
	//knockback unimplemented
	/*inv_frames, //future implementation maybe idk*/
	
}
state = PLAYER_STATE.in_control_top_down;

enum PLAYER_DIRECTION {
	up,
	down,
	left,
	right,
}
player_direction = PLAYER_DIRECTION.right;


canjump = false;

/*function bounce(){
	dy = jump_speed;
}*/ //old code