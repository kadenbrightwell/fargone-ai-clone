/*tile_w = 20;
tile_h_def = 20;
tile_h = tile_h_def;*/

tile_w = 20; // Base size, will be scaled
tile_h = 20;
scale = 1;

// Keyboard handling in Step Event
var _key = -1;
for(var i = 0; i < obj_pianotiles_controller.lane_count; i++) {
    if(keyboard_check_pressed(ord(string(i+1))) || 
      (i == 9 && keyboard_check_pressed(vk_numpad0))) {
        _key = i;
        break;
    }
}

if(_key != -1 && position_meeting(mouse_x, mouse_y, self)) {
    audio_play_sound(snd_radio_static, 0, false, SVOL);
    instance_destroy();
}