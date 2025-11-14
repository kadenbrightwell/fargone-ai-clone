/// @description first attack

show_debug_message("cone attack triggered");

var _t=0;

cone_attack(4, 1.2, 1.4, 0);

_t+=6;
execute after  _t seconds
	cone_attack(8, 1.0, 1.6, 0);
done

_t+=8;
execute after _t seconds
	cone_attack(12, 0.9, 1.6, 0);
done