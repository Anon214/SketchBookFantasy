class_name GContainer
extends Area2D

@onready var children = get_children()
@onready var collision_matrix = create_empty_collision_matrix()
@onready var box_matrix = create_empty_box_matrix()

func create_empty_collision_matrix():
	var matrix = []
	var c = 0
	for i in range(6):
		var array = [0, 0, 0, 0, 0, 0]
		for j in range(6):
			array[j] = children[c]
			c += 1
		matrix.append(array)
	
	return matrix
		
func create_empty_box_matrix():
	var matrix = []
	for i in range(6):
		var array = [0, 0, 0, 0, 0, 0]
		matrix.append(array)
	return matrix
		
func set_boxes(box: Box):
	var r = box.r
	var c = box.c
	box_matrix[r][c] = box
	print(r, c)
	
	var pos = collision_matrix[r][c].position
	pos.x -= 56
	pos.y -= 16
	
	box.position = pos
