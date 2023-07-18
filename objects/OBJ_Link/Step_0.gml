 ////_Mov
if(OBJ_Camera.CamIsMoving == false)
{
	
	if(keyboard_check_pressed(vk_space) or (keyboard_check_pressed(ord("L"))))
	{
	if(state == PLAYER_STATE.in_control_platformer )
	{
		state = PLAYER_STATE.in_control_top_down;
		sprite_index = tile006;
	}
	else if(state == PLAYER_STATE.in_control_top_down )
	{
		state = PLAYER_STATE.in_control_platformer;
		sprite_index = link_dark_2d;
	}
	}
	
////_Movement (platformer)
	switch(state){
		
	case PLAYER_STATE.in_control_platformer:
	image_speed = 0;
	var SPEED = 2;
	//input
	sprite_index = link_dark_2d;
	
	if (keyboard_check_pressed(vk_right) or (keyboard_check_pressed(vk_left) )or (keyboard_check_pressed(ord("Q") or (keyboard_check_pressed(ord("D"))))) )
	{
		SPEED = 1;
	}
	
	if gamepad_is_connected(4){
		dx = ( (keyboard_check(vk_right) or gamepad_axis_value(4, gp_axislh) > .5 ) - (keyboard_check(vk_left) or gamepad_axis_value(4, gp_axislh) < -.5) );
	}else if gamepad_is_connected(0){
		dx = ( (keyboard_check(vk_right) or gamepad_axis_value(0, gp_axislh) > .5 or gamepad_button_check(0, gp_padr)) - (keyboard_check(vk_left) or gamepad_axis_value(0, gp_axislh) < -.5 or gamepad_button_check(0, gp_padl)) );
	}else{
		dx = (keyboard_check(vk_right) or (keyboard_check(ord("D")))) - (keyboard_check(vk_left)or (keyboard_check(ord("Q"))));
	}
	
	if(dx < 0  and !(keyboard_check(vk_space)or (keyboard_check_pressed(ord("U")))))
	{
	move_contact_solid(180,SPEED);
	}
	if(dx > 0  and !(keyboard_check(vk_space)or (keyboard_check_pressed(ord("U")))))
	{
	move_contact_solid(0,SPEED);
	}
	
	//facing
	if(dx != 0) //returns 1;0or -1.
	{
	image_xscale = sign(dx); //returns 1; or -1.
	if sign(dx == 1){
		player_direction = PLAYER_DIRECTION.right;
	}else{
		player_direction = PLAYER_DIRECTION.left;
	}
	}
	
	
	 
	{//////vertical physics////
	//gravity
	
	
	dy += grav;
	             /// Jumping
	if canjump {
	
	canjump = false
 	if( (  keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("J"))  or keyboard_check_pressed(ord("Z"))  || gamepad_button_check_pressed(0, gp_face4) || gamepad_button_check_pressed(4, gp_face1) )   && (place_free(x, y+8) != true and !keyboard_check(vk_space))   ){
		dy -= jump_speed;
			canjump = false
	}
	}
	
	//collision
	if(! place_free(x, y+dy)){ 
		move_contact_solid((dy < 0 )? 90 : 270, abs(dy))
		canjump = true
		
		dy = 0;
	}
	else
	{
	y += dy;
	}
	//apply dy (ground touch maybe)

	
}
	
	
	break;
		
		
	case PLAYER_STATE.in_control_top_down:
	
	//check_falls
	if(place_meeting(x, y, OBJ_Hole)){
		state = PLAYER_STATE.top_down_falling;
		break;
	}else{
		last_position[0] = x;
		last_position[1] = y;
		last_position[2] = image_xscale;

	}
		
		
	
	///movement (top-down)
	
	image_speed = 0.15;
	var SPEED = 1;
	
	if( !keyboard_check(vk_space) or (keyboard_check_pressed(ord("I"))))
	{
	if (keyboard_check(vk_up) == true or (keyboard_check(ord("Z"))) || gamepad_button_check(0, gp_padu) || gamepad_axis_value(0, gp_axislv)*(-1) and !keyboard_check(vk_space))
	{
		move_contact_solid(90,SPEED);
		sprite_index = tile004;
		player_direction = PLAYER_DIRECTION.up;
	}
	if (keyboard_check(vk_down) == true or (keyboard_check(ord("S"))) || gamepad_button_check(0, gp_padu) || gamepad_axis_value(0, gp_axislv) and !keyboard_check(vk_space))
	{
		move_contact_solid(270,SPEED);
		sprite_index = tile000;
		player_direction = PLAYER_DIRECTION.down;
	}
	if (keyboard_check(vk_left) == true or (keyboard_check(ord("Q"))) || gamepad_button_check(0, gp_padu) || gamepad_axis_value(0, gp_axislh)*(-1) and !keyboard_check(vk_space))
	{
		move_contact_solid(180,SPEED);
		sprite_index = tile006 ;
		image_xscale = -1;
		player_direction = PLAYER_DIRECTION.left;
	}
	if (keyboard_check(vk_right) == true or (keyboard_check(ord("D"))) || gamepad_button_check(0, gp_padu) || gamepad_axis_value(0, gp_axislh) and !keyboard_check(vk_space))
	{
		move_contact_solid(0,SPEED);
		sprite_index = tile006;
		image_xscale = 1;
		player_direction = PLAYER_DIRECTION.right;
	}
	else
	{
		image_index = 0;
		image_speed = 0;
		//image_xscale = 1; old
	}
	}
	break;
	
	case PLAYER_STATE.top_down_falling :
	
	show_debug_message("fall_start")
	var Link_lerp_SPEED = 0.2;  /// maybe edit later	
	
	var _hole_instance_id_read = instance_place(x, y, OBJ_Hole) ;
	var _actual_hole = instance_find(OBJ_Hole, _hole_instance_id_read);
	
	var desired_x1 = floor(_hole_instance_id_read.x);
	var	desired_y1 = floor(_hole_instance_id_read.y);
	
	
	
	
	if(_hole_instance_id_read.x/x == 1 and _hole_instance_id_read.y/y == 1){ //I think this may break depending on processor, I have to check :/
		visible = false;
		show_debug_message(string(x) + "," + string(_hole_instance_id_read.x));
		x = last_position[0]; //reset position (before hole)
		y = last_position[1];
		image_xscale = last_position[2];
		

	} else {
		var fall_dx = lerp(x, desired_x1, Link_lerp_SPEED); //move_towards_point
		var fall_dy = lerp(y, desired_y1, Link_lerp_SPEED);
		x = fall_dx;
		y = fall_dy;
		
	}
	state = PLAYER_STATE.in_control_top_down;
	show_debug_message("fall end");
	visible = true;
	break;
	
	
	default :
	    throw ("ERROR : invalid PLAYER state ; plz add code ;p");
	}
}