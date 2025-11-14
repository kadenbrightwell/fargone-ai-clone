///@description

//time = 0;
//time_s = 0;
//time_ms = 0;

//time_to_end = -1;

//song_len = 0;

//countdown_s = 5;
//countdown = countdown_s*FPS;
//countdown_done = false;

//lane = 0;
//lane_count = 0; 2d variable for different lane sizes and x
//lane_x = [8, 32, 56, 80, 104, 128, 152, 176, 200, 224];

//tiles = [];

/*
if(!MINIGAMING){
	room_goto_next();
} // THIS COULD BE A BIG ISSUE FIGURE THIS SHIT OUT

function start_song(_song_id){
	switch(_song_id){
		case "Deviltown": 
			init_minigame_player();
			create_textbox("pianotiles - start");
			break;
		
		default: break;
	}
}

function init_minigame_player(){
	// Feather ignore GM2017 once
	PLAYER.visible = false;
}

start_song("Deviltown");

/// @param {String} SequenceID
	// Feather ignore GM1042 once
function scr_pianotiles_sequences(_seq_id){
	switch(_seq_id){
		case "Deviltown": 
			
			// Feather ignore GM2017 once
			song_len = audio_sound_length(MUS_DEVILTOWN);
			time_to_end = song_len;
			
			break;
		
		default: break;
	}
} 

*/

time = 0;
current_song = undefined;
song_data = [];
tiles = [];
lane_count = 4;
lane_width = 0;
lane_height = 0;
lane_padding = 0;

room_h = 256;
room_hh = camera_get_view_height(view_camera[0]);
room_w = 256;

lane_x = [];

playing_sound = undefined;
dt_start = -1;
dt_time = 0;

countdown = 999999;
countdown_done = false;

// Initialize empty tile pool
for(var i = 0; i < 100; i++) { // Pre-create tiles for pooling
	layer_create(-9992,"PianoTiles");
    instance_create_layer(-100, -100, "PianoTiles", PT_TILE);
	
}

function start_song(_song_id) {
    var _songs = pianotiles_songs();
    current_song = _songs[$ _song_id];
    
    // Calculate lane positions
    lane_count = current_song.lanes;
	lane_padding = 12-lane_count;
	lane_width = (room_w-(lane_count+1)*(lane_padding))/lane_count;
	lane_height = room_hh-lane_padding;
    lane_x = array_create(lane_count);
    for(var _i = 0; _i < lane_count; _i++) {
        //lane_x[_i] = ((lane_width*_i + (lane_padding*(_i+1))) + (lane_width/2)-lane_padding);
		lane_x[_i] = _i*(1.01)*(lane_width + lane_padding) + lane_width - PT_TILE.tile_w*1.5;
    }
	
    // Initialize song data
    song_data = current_song.beats;
    time_to_end = audio_sound_length(current_song.audio);
    countdown = 5 * FPS; // 5 second countdown
    countdown_done = false;
	
	update_tile_scale();
}


function update_tile_scale() {
    var _scale = lane_count*(lane_width - 4) / PT_TILE.tile_w; // -4 for padding
    with(PT_TILE) {
        tile_w*=_scale;
        tile_h*=_scale;
        scale = _scale;
    }
}


function init_minigame_player(){
	// Feather ignore GM2017 once
	PLAYER.visible = false;
}



function pt_play(_song_id){
	switch(_song_id){
		case "Deviltown": 
			init_minigame_player();
			create_textbox("pianotiles - start");
			break;
		
		default: break;
	}
}


pt_play("Deviltown");