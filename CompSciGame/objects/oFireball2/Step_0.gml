/// @description Insert description here
// You can write your code in this editor

x += xVelocity
y += yVelocity
image_angle = point_direction(0, 0, xVelocity, yVelocity)

if (x < -20 or y < -20 or x > room_width + 20 or y > room_height + 20) {
	instance_destroy()
}