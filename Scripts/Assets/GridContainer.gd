extends Area2D

var matrix = [0, 0]
@onready var children = get_children()
# Called when the node enters the scene tree for the first time.
func _ready():
	matrix[0] = children[0]
	matrix[1] = children[1]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	body.position = matrix[0].position
	body.position.x -= 22
	body.position.y -= 21
