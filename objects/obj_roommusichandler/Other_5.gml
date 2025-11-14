var _stop_music = function(_element, _index){ audio_stop_sound(patswre[_index]); }
array_foreach(patswre, _stop_music);
array_delete(patswre, 0, array_length(patswre));