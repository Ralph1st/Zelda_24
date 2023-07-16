{ 
	var CAMERA_PAN_SPEED = 3;  /// maybe edit later, or make room dependent
	var camera = view_get_camera(0); // takes viewport 0 i think
	
	
	var desired_x1 = floor((OBJ_Link.x)/256)*256;
	var desired_y1 = floor((OBJ_Link.y-8)/224)*224;
	
	var current_x = camera_get_view_x(camera);
	var current_y = camera_get_view_y(camera);
	
	
	if((desired_x1 != current_x) || (desired_y1 != current_y))
	{
	CamIsMoving = true; 
	var dx = clamp(desired_x1 - current_x, -CAMERA_PAN_SPEED, +CAMERA_PAN_SPEED);
	var dy = clamp(desired_y1 - current_y, -CAMERA_PAN_SPEED, +CAMERA_PAN_SPEED);
	camera_set_view_pos(camera, current_x + dx, current_y + dy );
	}
	else
	{
	CamIsMoving = false;
	}
	
	// snap cam code here
	//camera_set_view_pos(camera, desired_x, desired_y);
	
}	