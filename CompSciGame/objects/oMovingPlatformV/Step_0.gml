/// @description Insert description here
// You can write your code in this editor


if (place_meeting(x, y, oReverse)) {
	move_direction = -move_direction
}

y += move_direction * 2

if (place_meeting(x, y-1, oMain2)) {
	oMain2.y += move_direction * 2
}