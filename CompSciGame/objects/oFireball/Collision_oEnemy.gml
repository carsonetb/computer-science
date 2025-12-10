/// @description Insert description here
// You can write your code in this editor
global.enemies_killed += 1

if (global.enemies_killed >= 2) {
	instance_create_layer(other.x, other.y, "Instances", oKey)
}


instance_destroy(other)
instance_destroy(self)