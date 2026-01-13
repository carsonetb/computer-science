/// @description Insert description here
// You can write your code in this editor

	draw_self()
if (drawing_lines) {
	draw_line_width_color(line1_x1, line1_y1, locked_position_x, locked_position_y, 10, #FFFFFF, #FF0000)
	draw_line_width_color(line2_x1, line2_y1, locked_position_x, locked_position_y, 10, #FFFFFF, #FF0000)
}
if (faint_drawing) {
	draw_set_alpha(0.3)
	draw_line_width_color(line1_x1, line1_y1, lines_target_x, lines_target_y, 10, #888888, #880000)
	draw_line_width_color(line2_x1, line2_y1, lines_target_x, lines_target_y, 10, #888888, #880000)
	draw_set_alpha(1.0)
}
