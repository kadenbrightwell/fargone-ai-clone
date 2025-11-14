#region defaults
PLAYER.visible=false;
visible=true;
#endregion defaults

image_angle = rot_d;
image_xscale = 0.1;
image_yscale = 0.1;
draw_self();

show_debug_message("visible: " + string(visible));
show_debug_message("depth: " + string(depth));

draw_set_font(fnt_madspixel);
var _s = "You died"; var _sw = string_width(_s);
draw_text_ext_transformed_color(32, 32, _s, 4, _sw, 4, 4, 0, c_white, c_white, c_white, c_white, 1);