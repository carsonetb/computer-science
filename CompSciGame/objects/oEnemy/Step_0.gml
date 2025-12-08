/// @description Insert description here
// You can write your code in this editor


if (distance_to_point(oMain.x, oMain.y) < 200) {
	var to_player_angle = point_direction(x, y, oMain.x, oMain.y)
	var dir_x = lengthdir_x(1, to_player_angle)
	var dir_y = lengthdir_y(1, to_player_angle)
	var vel_x = dir_x * walk_speed
	var vel_y = dir_y * walk_speed
	if (distance_to_point(oMain.x, oMain.y) > 2) {
	
		var new_pos_x = x + vel_x
		var new_pos_y = y + vel_y
		var collision = false
		if (place_meeting(new_pos_x, y, oTree)) {
			new_pos_x = x
			while (!place_meeting(new_pos_x, y, oTree)) {
				new_pos_x += sign(vel_x) * 0.1
			}
			new_pos_x -= sign(vel_x) * 0.2
		}
		if (place_meeting(x, new_pos_y, oTree)) {
			new_pos_y = y
			while (!place_meeting(x, new_pos_y, oTree)) {
				new_pos_y += sign(vel_y) * 0.1
			}
			new_pos_y -= sign(vel_y) * 0.2
		}
		x = new_pos_x
		y = new_pos_y
	}
	
	if (distance_to_point(oMain.x, oMain.y < 30)){
		if (vel_x< 0) {
			sprite_index = asset_get_index("SwordAttackLeft")
		}
		else {
			sprite_index = asset_get_index("SwordAttackRight")
		}
	}
	else {
		if (vel_x < 0) {
			sprite_index = asset_get_index("en_swordwalkleft")
		}
		else {
			sprite_index = asset_get_index("en_swordwalkright")
		}
	}
}
else {
	sprite_index = asset_get_index("en_swordwalkleft")
	image_index = 0
}

