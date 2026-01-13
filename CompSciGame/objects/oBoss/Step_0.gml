/// @description Insert description here
// You can write your code in this editor

line1_x1 = x - 15
line1_y1 = y - 15
line2_x1 = x + 15
line2_y1 = y - 23

if (!drawing_lines) {
	if (laser_cooldown <= 0) {
		drawing_lines = true
		laser_timer = 60
	}
	else {
		laser_cooldown -= 1 
	}
	
	if (laser_cooldown == 30) {
		locked_position_x = oMain2.x
		locked_position_y = oMain2.y 
		lines_target_x = locked_position_x
		lines_target_y = locked_position_y
	}
	
	if (laser_cooldown < 90 && laser_cooldown > 30) {
		faint_drawing = true
		follow_player = true
		lines_target_x = oMain2.x
		lines_target_y = oMain2.y
	}
	else if (laser_cooldown < 30) {
		faint_drawing = true
		follow_player = false
	}
}
else {
	if (laser_timer <= 0) {
		drawing_lines = false
		laser_cooldown = 240
	}
	else {
		laser_timer -= 1
		drawing_lines = true
		faint_drawing = false
		follow_player = false
	}
}

if (jump_timer <= 0 && !jumping) {
	jumping = true
	jump_end_x = oMain2.x
	jump_vel_y = -15
}
else {
	jump_timer -= 1
}

if (jumping) {
	if (x > jump_end_x) {
		x -= 5
	}
	if (x < jump_end_x) {
		x += 5
	}
	y += jump_vel_y
	jump_vel_y += 0.4
	
	if (place_meeting(x, y + 1, oBossLand)) {
		jumping = false
		jump_timer = 60 * 10
	}
}

if (this_health <= 0) {
	instance_destroy(oLock2)
	instance_destroy(self)
	global.is_boss = false
}