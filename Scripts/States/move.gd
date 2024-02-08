class_name Move
extends State

@export var animator : AnimationPlayer
@onready var player = get_parent().get_parent() as Player

signal idle_mode

func _ready() -> void:
	set_physics_process(false)

func enter_state() -> void:
	set_physics_process(true)
	player.animator.play('move_right')
	
func exit_state() -> void:
	set_physics_process(false)

func _physics_process(delta):
	if player.movement_direction == Vector2.ZERO:
		idle_mode.emit()
	
	player.velocity = player.movement_direction.normalized() * player.speed
	player.move_and_slide()
