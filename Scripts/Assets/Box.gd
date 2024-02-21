class_name Box
extends Area2D

var area_index : int = 0
var r : int = -1
var c : int = -1
@onready var grid_container = %GridContainer

func _on_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	if area.name == "Left" or area.name == "Right" or area.name == "Top" or area.name == "Bot":
		return
		
	area_index = area_shape_index
	if r == -1:
		calculate_matrix()
		grid_container.set_box(self)
	
func calculate_matrix():
	r = int(area_index / 6)
	c = area_index % 6

func _on_left_body_entered(body):
	grid_container.set_box_left(r, c)

func _on_right_body_entered(body):
	grid_container.set_box_right(r, c)

func _on_top_body_entered(body):
	grid_container.set_box_top(r, c)

func _on_bot_body_entered(body):
	grid_container.set_box_down(r, c)
