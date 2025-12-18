/// @description Insert description here
// You can write your code in this editor

if (variable_global_exists("y_position") and global.y_position != 0) {
	y = global.y_position
}

global.enemies_killed = 0

invinsible = false
invinsible_timer = 0

fireball_timer = 0

vel_y = 0

on_ground = false
jumps = 2
