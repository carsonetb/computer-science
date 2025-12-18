/// @description Insert description here
// You can write your code in this editor


if (!invinsible) {
	image_alpha = 0.2
	global.health -= 3
	invinsible = true
	invinsible_timer = 60
	instance_destroy(other)
}