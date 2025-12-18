/// @description Insert description here
// You can write your code in this editor


move_direction = oLever.is_switched ? -1 : 1

y += move_direction * 2

while (place_meeting(x, y, oReverse)) {
	y -= move_direction * 0.1
}

if (place_meeting(x, y-1, oMain2)) {
	oMain2.y += move_direction * 2
}