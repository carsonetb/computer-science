/// @description Insert description here
// You can write your code in this editor


if (oLever.is_switched and !has_fallen) {
	has_fallen = true 
}

if (has_fallen) {
	yVel += 0.5
	y += yVel
}