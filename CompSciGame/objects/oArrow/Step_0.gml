/// @description Insert description here
// You can write your code in this editor

x += velocity

if (x < 0 or y < 0 or x > room_width or y > room_height) {
	instance_destroy()
}