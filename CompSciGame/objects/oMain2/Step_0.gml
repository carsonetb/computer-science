//Room 1 code: Basic Movement

var left = keyboard_check(vk_left) 
var right = keyboard_check(vk_right)
var up = keyboard_check(vk_up)
var down = keyboard_check(vk_down)
var boost = keyboard_check(vk_space) * 2
var shoot_fireball = keyboard_check_pressed(vk_lshift)
var jump = keyboard_check_pressed(vk_up)

if (global.health <= 0) {
	global.points = 0
	global.health = 5
	global.y_position = 0
	global.is_boss = false
	room_goto(Room08)
}

if (jump and jumps < 2) {
	jumps += 1
	vel_y = -8
}

global.y_position = y

fireball_timer -= 1
if (shoot_fireball and global.points > 0 and fireball_timer <= 0) {
	global.points -= 1
	fireball_timer = 20
	new_fireball = instance_create_layer(x, y, "Instances", oFireball2)
	if (sprite_index == asset_get_index("mc_walkright")) {
		if (image_xscale > 0) {
			new_fireball.xVelocity = 3
		}
		else if (image_xscale < 0) {
			new_fireball.xVelocity = -3
		}
	}
	if (sprite_index == asset_get_index("mc_walkdown")) {
		new_fireball.yVelocity = 3
	}
	if (sprite_index ==asset_get_index("mc_walkup") ) {
		new_fireball.yVelocity = -3
	}
}

if (global.enemies_killed >= 2) {
	locked = false 
}

var vel_x = right - left 
vel_y += 0.4

if (place_meeting(x, y, oVoid)) {
	global.points = 0
	global.health = 5
	global.y_position = 0
	global.is_boss = false
	room_goto(Room08)
}

sprite_index = asset_get_index("mc_walkright")

if (abs(vel_x) < 0.1) {
	image_index = 1
}
else if (abs(vel_x) > 0.1) {
	image_xscale = sign(vel_x)
}

var new_pos_x = x + vel_x * (1 + boost * 2)
var new_pos_y = y + vel_y
var collision = false
if (place_meeting(new_pos_x, y, oRock)) {
	on_ground = true
	jumps = 0
	new_pos_x = x
	while (!place_meeting(new_pos_x, y, oRock)) {
		new_pos_x += sign(vel_x) * 0.1
	}
	new_pos_x -= sign(vel_x) * 0.2
}
if (place_meeting(x, new_pos_y, oRock)) {
	on_ground = true
	jumps = 0
	new_pos_y = y
	while (!place_meeting(x, new_pos_y, oRock)) {
		new_pos_y += sign(vel_y) * 0.1
	}
	new_pos_y -= sign(vel_y) * 0.11
	vel_y = 0
}

if (vel_y != 0) {
	on_ground = false
}
x = new_pos_x
y = new_pos_y

if (invinsible) {
	invinsible_timer -= 1
	if (invinsible_timer % 2 == 0) {
		image_alpha = 0.2
	}
	else {
		image_alpha = 1
	}
	if (invinsible_timer <= 0) {
		image_alpha = 1
		invinsible_timer = 0
		invinsible = false
	}
}
	
show_debug_message(global.is_boss)
if (global.is_boss && oBoss.drawing_lines && collision_line(oBoss.line1_x1, oBoss.line1_y1, oBoss.lines_target_x, oBoss.lines_target_y, oMain2, true, false) && !invinsible) {
	image_alpha = 0.2
	global.health -= 1
	invinsible = true
	invinsible_timer = 60
}