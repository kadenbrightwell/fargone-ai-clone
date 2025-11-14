if (room == target_rm && image_index < 1) {
    instance_destroy();
}

// Handle color transition
if (t_active) {
    t_counter += 1;
    var _t = t_counter / t_time;

    // Interpolate between the colors
    if (t_dir == 1) {
        // Forward transition (room_color to halfway)
        t_color = merge_color(room_color, merge_color(room_color, target_color, 0.5), _t);
    } else {
        // Reverse transition (halfway to target_color)
        t_color = merge_color(merge_color(room_color, target_color, 0.5), target_color, _t);
    }

    // Check if transition is complete
    if (t_counter >= t_time) {
        t_active = false;
        if (t_dir == -1) {
            // Reverse transition complete, reset image speed for animation
            image_speed = 1;
        }
    }
}