/// @description Insert description here
// You can write your code in this editor

if (oMain.x > x) {
	image_xscale = -1
}
else {
	image_xscale = 1
}

if (shoot_timer > 0) {
	shoot_timer -= 1
	if (shoot_timer <= 0) {
		shoot_timer = 0
	}
}

if (shoot_timer == 0) {
	if (animation_step_timer > 0) {
		animation_step_timer -= 1
		if (animation_step_timer <= 0) {
			animation_step_timer = 0
		}
	}
	if (animation_step_timer == 0) {
		if (persistant_index == 6) {
			new_arrow = instance_create_layer(x, y, "Instances", oArrow)
			new_arrow.velocity = oMain.x > x ? 5 : -5
		}
		if (persistant_index == 8) {
			persistant_index = 0
			shoot_timer = 120
		}
		persistant_index += 1
	}
}

image_index = persistant_index;