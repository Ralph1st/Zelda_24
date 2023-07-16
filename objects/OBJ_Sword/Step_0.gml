x = OBJ_Link.x;
y = OBJ_Link.y - 8;
direction = OBJ_Link.direction;


/////_Link following script


image_xscale = 1;
if(OBJ_Link.player_direction == PLAYER_DIRECTION.right){ 
	image_angle = 0;
}else if(OBJ_Link.player_direction == PLAYER_DIRECTION.left){
	image_xscale =-1;
	image_angle = 0
}else if(OBJ_Link.player_direction == PLAYER_DIRECTION.up){
	image_angle = 90;
}else if(OBJ_Link.player_direction == PLAYER_DIRECTION.down){
	image_angle =-90;
}


/////_Attack code

//temp variables
var timequintet = 1;//time decremnt value (frames)


// attack input
if((keyboard_check_pressed(vk_backspace) || (keyboard_check_pressed(ord("K")))) and isNotAttacking ){
	isNotAttacking = false;  // Flag to indicate if the attack is active
	attackTimer = attackDuration;
	visible = true;
}

if(!(isNotAttacking))
{
	visible = true;
	attackTimer -= timequintet;
	if attackTimer <= 0
    {
        // Deactivate the attack
		visible = false;
        isNotAttacking = true;
		
    }
}