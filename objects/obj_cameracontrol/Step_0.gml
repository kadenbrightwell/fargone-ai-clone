// Check if the player is in the specific room
switch(room){
	case rm_death:
		zoom_current = 1;
		break;
	case rm_forest:
		// Smoothly transition to the target zoom level
		zoom_current = lerp(zoom_current, zoom_target, zoom_speed);
		break;
		
	case rm_tutorialmain:
		// Smoothly transition to the target zoom level
		zoom_current = lerp(zoom_current, zoom_target, zoom_speed);
		break;
		
	case rm_pianotiles:
		// Instant reset to the original zoom level if not in the specific room
		zoom_current = 1;
		
	case rm_battle:
		// Instant reset to the original zoom level if not in the specific room
		zoom_current = 1;
		
	default:
		// Lerp reset to the original zoom level if not in the specific room
		zoom_current = lerp(zoom_current, 1.0, zoom_speed);
		break;
}
show_debug_message("zoom_current: " + string(zoom_current));

// Apply the zoom to the camera
var _cam = view_camera[0]; // Assuming the camera is the default view camera
camera_set_view_size(_cam, 288 * zoom_current, 216 * zoom_current);

// Optionally, you may also need to adjust the camera's position to keep it centered on the player
var _cam_x = PLAYER.x - (camera_get_view_width(_cam) / 2);
var _cam_y = PLAYER.y - (camera_get_view_height(_cam) / 2);
camera_set_view_pos(_cam, _cam_x, _cam_y);