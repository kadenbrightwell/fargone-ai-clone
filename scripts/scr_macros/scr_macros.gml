//MOVEMENT DIRECTIONS
#macro RIGHT 0
#macro UP 1
#macro LEFT 2
#macro DOWN 3

//INIT
#macro DEPTH -bbox_bottom
		#macro TEXTBOX_DEPTH -9997
		#macro SETTINGS_DEPTH -12345
#macro GLOBAL obj_settings
#macro FPS 60
#macro FONT global.font_main
	#macro FONT_EN global.font_en
	#macro FONT_ASIAN global.font_asian
	#macro FONT_FARSI global.font_farsi
#macro CAMCON obj_cameracontrol
	#macro CAMZOOM CAMCON.zoom_current

//VOLUME
#macro VOL global.vol
	#macro MUSIC_VOL global.mvol
		#macro MVOL MUSIC_VOL*VOL
	#macro CHAR_VOL global.cvol
		#macro CVOL CHAR_VOL*VOL
	#macro SFX_VOL global.svol
		#macro SVOL SFX_VOL*VOL
	
	#macro GAME_MUSIC_VOL global.gmvol
		#macro GMVOL GAME_MUSIC_VOL*MVOL
	#macro RADIO_VOL global.rvol
		#macro RVOL RADIO_VOL*MVOL
				#macro RADIO_VOL_CW global.rvol_cw
					#macro RVOL_CW RADIO_VOL_CW*RVOL
				#macro RADIO_VOL_UT global.rvol_ut
					#macro RVOL_UT RADIO_VOL_UT*RVOL
	#macro M_GMP global.game_music_playing
	#macro M_RMP global.radio_music_playing
		#macro M_RTP global.radio_track_position
		
	#macro M_RMP_CW global.radio_cw_music_playing
		#macro M_RTP_CW global.radio_cw_track_position
	#macro M_RMP_UT global.radio_ut_music_playing
		#macro M_RTP_UT global.radio_ut_track_position
	
	#macro RADIO_PLAYING global.radio_playing
	#macro RADIO_PLAYING_CHANNEL global.radio_playing_channel
		#macro CHANNEL_CURSEWORDS 0
			#macro CW_SONGS obj_musichandler.arr_radio_cursewords
			#macro CW_INDEX obj_musichandler.index_radio_cursewords
		#macro CHANNEL_UNDERTALE 1
			#macro UT_SONGS obj_musichandler.arr_radio_undertale
			#macro UT_INDEX obj_musichandler.index_radio_undertale

#macro EMPTYSOUND snd_empty
#macro EMPTYARRAY []
#macro EMPTYSPRITE spr_empty

//PLAYER
#macro PLAYER obj_SASFS
#macro PLAYERNAME PLAYER.name
#macro PLAYERCOLOR #00DDAA
#macro PLAYERINV obj_itemmanager.inv
	#macro PLAYERINVCOUNT obj_itemmanager.inv_count
	#macro PLAYERINVMAX obj_itemmanager.inv_max
#macro PLAYERHP PLAYER.hp
	#macro PLAYERHPM PLAYER.hp_max
#macro PLAYERRES PLAYER.res
	#macro PLAYERRESM PLAYER.res_max
	#macro PLAYERRESP (PLAYERRES/PLAYERRESM)
#macro PLAYERDIR PLAYER.facing
#macro PLAYERBAL PLAYER.balance
	//player keys
	#macro PLAYER_UP ( keyboard_check(ord("W")) || keyboard_check(vk_up) )
		#macro UP_KEY ( keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up) )
	#macro PLAYER_LEFT ( keyboard_check(ord("A")) || keyboard_check(vk_left) )
		#macro LEFT_KEY ( keyboard_check_pressed(ord("A")) || keyboard_check_pressed(vk_left) )
	#macro PLAYER_DOWN ( keyboard_check(ord("S")) || keyboard_check(vk_down) )
		#macro DOWN_KEY ( keyboard_check_pressed(ord("S")) || keyboard_check_pressed(vk_down) )
	#macro PLAYER_RIGHT ( keyboard_check(ord("D")) || keyboard_check(vk_right) )
		#macro RIGHT_KEY ( keyboard_check_pressed(ord("D")) || keyboard_check_pressed(vk_right) )
	#macro PLAYER_SPRINT ( keyboard_check(vk_lcontrol) || keyboard_check(ord("B")) )
		#macro PLAYER_SUPER_SPRINT ( keyboard_check(vk_lshift) || keyboard_check(ord("N")) )
	#macro PLAYER_INTERACT ( keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("E")) )
		#macro INTERACT_KEY PLAYER_INTERACT // ( keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("G")) )
		#macro BACK_KEY ( keyboard_check_pressed(vk_backspace) || keyboard_check_pressed(ord("R")) )
	#macro KEY_MENU keyboard_check(vk_escape)
		#macro KEY_MENU_RELEASED keyboard_check_released(vk_escape)

//tedxtbox
#macro TEXTBOX obj_textbox
	#macro TEXTBOX_ID global.textbox_id
	#macro TEXTBOX_CLOSED global.textbox_closed

//shops
#macro SHOPS obj_shophandler
#macro SHOPID global.shop_id

//battles
#macro BATTLING global.in_battle
#macro BATTLE obj_battlecontroller
	#macro BATTLER global.battler
#macro BATTLE_PLAYER obj_battleplayer
#macro ENEMIES global.enemies
	#macro B_TRIGGER global.battle_trigger
	#macro B_DTRIGGER global.battle_draw_trigger
	#macro B_PHASE global.battle_phase

//minigames
#macro MINIGAMING global.in_minigame
	#macro PIANOTILES obj_pianotiles_controller
		#macro PT_PLAYED global.pt_played
		#macro PT_TILE obj_pianotiles_tile

#macro KEY_MINIGAME_START keyboard_check_pressed(vk_space)
	#macro KEY_PT_0 keyboard_check(ord("0")) || keyboard_check(vk_numpad0)
	#macro KEY_PT_1 keyboard_check(ord("1")) || keyboard_check(vk_numpad1)
	#macro KEY_PT_2 keyboard_check(ord("2")) || keyboard_check(vk_numpad2)
	#macro KEY_PT_3 keyboard_check(ord("3")) || keyboard_check(vk_numpad3)
	#macro KEY_PT_4 keyboard_check(ord("4")) || keyboard_check(vk_numpad4)
	#macro KEY_PT_5 keyboard_check(ord("5")) || keyboard_check(vk_numpad5)
	#macro KEY_PT_6 keyboard_check(ord("6")) || keyboard_check(vk_numpad6)
	#macro KEY_PT_7 keyboard_check(ord("7")) || keyboard_check(vk_numpad7)
	#macro KEY_PT_8 keyboard_check(ord("8")) || keyboard_check(vk_numpad8)
	#macro KEY_PT_9 keyboard_check(ord("9")) || keyboard_check(vk_numpad9)

//exiting the game
#macro MENU_TIME global.menu_time
#macro EXIT_TIME global.exit_time
#macro EXIT_ALPHA global.exit_alpha
#macro EXIT_STRING get_exit_string()

//interactions
#macro RIN global.rin
#macro RID global.rid

//languages
#macro LANG global.language
	#macro LANG_ENGLISH 0
	#macro LANG_SPANISH 1
	#macro LANG_FRENCH 2
	#macro LANG_GERMAN 3
	#macro LANG_FARSI 4
	#macro LANG_CHINESE 5
	#macro LANG_JAPANESE 6

//ROOM NAMES AND COLORS
#macro PREINIT_NAME "rm_preinit"
#macro INIT_NAME "rm_init"
#macro TITLEROOM_NAME "rm_titleroom"
#macro DIATEST_NAME "rm_dia_test"
#macro INVENTORYTEST_NAME "rm_inventory_test"
#macro SAVETEST2_NAME "rm_save_test_2"

#macro BEDROOM_NAME "rm_bedroom"
	#macro BEDROOM_COLOR #1B0823
#macro LIVINGROOM_NAME "rm_livingroom"
	#macro LIVINGROOM_COLOR #1B0823
#macro FOREST_NAME "rm_forest"
	#macro FOREST_COLOR #111837
	
#macro TUTORIAL_NAME "rm_tutorialmain"
	#macro TUTORIAL_COLOR #0C281E
#macro SPEAKEASY_NAME "rm_tutorialmain"
	#macro SPEAKEASY_COLOR #33200D
	
#macro INVENTORYTEST_COLOR #471F66

//ITEMS
#macro ITEMS global.item_list

#macro BURGER ITEMS.burger
#macro BIBURGER ITEMS.biburger
#macro BIBURGERHALF ITEMS.biburgerhalf
#macro BOMB ITEMS.bomb
#macro REDKEY ITEMS.redkey

#macro BEER ITEMS.beer
#macro WATER ITEMS.water

//MUSIC & SOUNDS
#macro MUS_DEVILTOWN snd_mus_Deviltown