function pianotiles_songs(){
	static Songs = {
		deviltown: new create_song(MUS_DEVILTOWN, 4 , [
			[0.50, 0], [0.80, 3], [1.20, 2], [1.50, 1], 
			[2.00, 0], [2.20, 3], [2.40, 2], [2.80, 1],
			[3.00, 0], [3.20, 3], [3.40, 2], [3.80, 1],
		]),
		de: new create_song(snd_cw_disgruntled_employee, 6 , [
			[0.5, 0], [0.8, 5], [1.2, 2], [1.5, 4],
		]),
		gem: new create_song(snd_cw_the_gem, 10 , [
			[0.5, 0], [0.8, 9], [1.2, 5], [1.5, 7],
		]),
	}
	return Songs;
}

/// @description Create a pianotiles song
/// @param {Asset.GMSound} audio
/// @param {Real} lanes
/// @param {Array} beats
function create_song(_a, _l, _b) constructor {
		audio = _a;
		lanes = _l;
		beats = _b;
}