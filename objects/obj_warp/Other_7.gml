// Capture the last color before changing rooms
var _last_color = t_color;

// Switch the room after capturing the last color
room_interactions_reset();
room_goto(target_rm);
PLAYER.x = target_x;
PLAYER.y = target_y;
PLAYERDIR = target_dir;

image_speed = -1; // Reverse the animation speed
t_dir = -1; // Set direction for reverse transition
t_counter = 0; // Reset the transition counter
t_active = true; // Activate reverse transition

// Restore the last color after changing rooms to prevent flash
t_color = _last_color;