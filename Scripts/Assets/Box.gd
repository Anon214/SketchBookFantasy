class_name Box
extends Area2D

var area_index : int = 0
var r : int = 0
var c : int = 0
@onready var grid_container = %GridContainer

func _on_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	area_index = area_shape_index
	calculate_matrix()
	grid_container.set_boxes(self)
	
func calculate_matrix():
	r = int(area_index / 6)
	c = area_index % 6

func check_valid():
	pass


func _on_left_body_entered(body):
	if body is Player:
		pass


func _on_top_body_entered(body):
	if body is Player:
		pass


func _on_right_body_entered(body):
	if body is Player:
		pass


func _on_down_body_entered(body):
	if body is Player:
		pass
