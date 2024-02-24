class_name GContainer
extends Area2D

@onready var children = get_children()
@onready var collision_matrix = create_empty_collision_matrix()
@onready var box_matrix = create_empty_box_matrix()
var total : int = 0
var rowToCol = {0:[], 1:[2, 3], 2:[1, 4], 3:[1, 2, 3, 4], 4:[1, 4], 5:[]}

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
		
		
func invalid(r, c):
	if r < 0 or c < 0 or r > 5 or c > 5 or box_matrix[r][c]:
		return true
	return false
	
func set_box(box: Box):
	var r = box.r
	var c = box.c
	box_matrix[r][c] = box
	
	var pos = collision_matrix[r][c].position
	pos.x -= 57
	pos.y -= 16
	
	box.position = pos
	
	if c in rowToCol[r]:
		total += 1
	
	if total == 10:
		print("win")
	
	
		
func moved_outside_ans(r, c):
	if c in rowToCol[r]:
		total -= 1

func set_box_left(r, c): #0,1
	if invalid(r, c - 1):
		return
	if r == 3 and c == 1:
		return
		
	moved_outside_ans(r, c)
	
	var box = box_matrix[r][c]
	box_matrix[r][c] = 0
	box.c = box.c - 1
	set_box(box)
	
func set_box_right(r, c):
	if invalid(r, c + 1):
		return
	if r == 3 and c == 0:
		return
		
	moved_outside_ans(r, c)
	
	var box = box_matrix[r][c]
	box_matrix[r][c] = 0
	box.c = box.c + 1
	set_box(box)
	
func set_box_top(r, c):
	if invalid(r - 1, c):
		return
	if (r == 3 and c == 0) or (r == 5 and c == 0) or (r == 5 and c == 1) or (r == 1 and c == 4):
		return
	
	moved_outside_ans(r, c)
	
	var box = box_matrix[r][c]
	box_matrix[r][c] = 0
	box.r = box.r - 1
	set_box(box)
	
func set_box_down(r, c):
	if invalid(r + 1, c):
		return
	if (r == 2 and c == 0) or (r == 4 and c == 0) or (r == 4 and c == 1) or (r == 0 and c == 4):
		return
	
		
	moved_outside_ans(r, c)
	
	var box = box_matrix[r][c]
	box_matrix[r][c] = 0
	box.r = box.r + 1
	set_box(box)
