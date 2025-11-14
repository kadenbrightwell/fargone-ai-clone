/// @description 

audio_play_sound(snd_shop, 1, true, MVOL*0.5);

current_tab = 2;
outer_padding = 4;
inner_padding = 10;
text_scale = 4;

draw_scale = 4;

item_page = 0;
last_item_page = 0;
items_temp_array = [];
	items_temp_buy_array = [];
	items_temp_sell_array = [];

shop_text_upper_y = 0;
shop_text_lower_y = 9999;

item_option = 0;
item_option_x[0] = 0;
item_option_y[0] = 0;
current_item_price = 9999;
arrow_color = #B29B7C;

st_page = 0;
shop_text[0] = "";
shop_text_setup = false;
text_page_number = 0;
shop_text_length[0] = string_length(shop_text[0]);

st_char[0,0]="";
st_char_x[0, 0] = 0;
st_char_y[0, 0] = 0;
st_draw_char = 0;
st_text_spd = 1;

st_last_free_space = 0;
st_border = 8;
st_line_sep = 12;

st_text_pause_timer = 0;
st_text_pause_time = 32;

st_option[0] = "";
st_option_linkid[0] = -2;
st_option_pos = 0;
st_option_number = 0;

dialogue_temp_array = [];
in_dialogue = false;



shop_text_setup = false;

shop_data = [];

/// @description Create a Shop Using the Provided Parameters
/// @param {String} shop_name
/// @param {Array} shop_owner ("Name",Sprite)
/// @param {String} welcome_msg
/// @param {Array} dialogue
/// @param {Array} items
/// @param {Array} sell_items
/// @param {Asset.GMSprite} background
/// @param {Constant.Colour} color
function create_shop(_n="Sloppy Shoppy", _o=["Sleazy Slopper",spr_shopkeeper], _w="Wiggity Wackity Welcome!", _d=[], _b=[], _s=[], _bg=spr_shopmenu, _col=#99713D) constructor {
	name = _n;
	owner = _o;
	welcome_msg = _w;
	dialogue = _d;
	items = _b;
	sell_items = _s;
	background = _bg;
	text_color = _col;
}

/// @description Turns an item to and from a shop item
/// @param {Struct} item
/// @param {Real} buy_price
/// @param {Real} sell_price
/// @param {Bool} buyable
/// @param {Bool} sellable
function create_shop_item(_i, _b=9999, _s=1, _bb=true, _ss=false, _c = #99713D) constructor { 
	item = _i;
	buy_price = _b;
	sell_price = _s;
	buyable = _bb;
	sellable = _ss;
	color = _c;
}

/// @description Turns a string to a shop dialogue
/// @param {String} title
/// @param {String} message
/// @param {Asset.GMSprite} sprite
function create_shop_dialogue(_title, _dia, _spr=undefined) constructor {
	title = _title;
	msg = _dia;
	sprite = _spr;
}

//shop data
switch(SHOPID){
	case "tutorial_shop":
		shop_data = new create_shop(
			"Tutorial Shop",
			["Tutorial Shopkeeper",spr_shopkeeper],
			"* Welcome to The Hoppity Hut! Please, take a look around.",
			[
				new create_shop_dialogue("Hi?...", "Well hey there little one! Welcome to Hoppity's Hut!"),
				new create_shop_dialogue("Where am I?", "Why on Osaria of course! Are you okay little one?.", spr_shopkeeper_shocked),
				new create_shop_dialogue("Who are you?", "I'm JJ Hopps, the owner of this shop. Besides being a shopkeeper, I like doing little paws-on construction projects."),
				new create_shop_dialogue("Where should I go?","I mostly hang out here or at The Whisper. If you haven't been there yet you really should go, it's incredible!"),
			],
			[
				new create_shop_item(BURGER, 30, 15, true, true),
				new create_shop_item(BIBURGER, 45, 15, true, true),
				new create_shop_item(REDKEY, 65, 15, true, true),
			],
			[],
			spr_shopmenu
		);
		shop_text_upper_y = 167;
		shop_text_lower_y = 215;
		break;
		
	default:
		shop_data = new create_shop();
		break;
}

PLAYER.visible = false;