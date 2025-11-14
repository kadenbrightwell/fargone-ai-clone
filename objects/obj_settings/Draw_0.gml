draw_set_font(FONT);

var _text_sep_x = 8;
var _text_sep_y = 8;

var _xx = camera_get_view_x(view_camera[0])+_text_sep_x;
var _yy = camera_get_view_y(view_camera[0])+_text_sep_y;
	
draw_text_ext_color(_xx, _yy, EXIT_STRING, 0, string_width(EXIT_STRING), c_white, c_white, c_white, c_white, EXIT_ALPHA);