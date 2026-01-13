/// @description Insert description here
// You can write your code in this editor

if (time_left <= 0) {
	time_left = random_range(10 * 60, 30 * 60)
	instance_create_layer(x, y, "Instances", oCrystal)
}
else {
	time_left -= 1
}