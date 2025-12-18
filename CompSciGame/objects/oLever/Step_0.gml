/// @description Insert description here
// You can write your code in this editor

if (place_meeting(x, y, oMain2) and keyboard_check_pressed(ord("X"))) {
	is_switched = !is_switched
}

if (is_switched) {
	image_index = 4
}
else {
	image_index = 0
}