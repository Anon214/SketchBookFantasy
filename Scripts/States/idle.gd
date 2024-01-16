class_name Idle
extends State

@export var animator : AnimationPlayer
@onready var player = get_parent().get_parent() as Player

signal move_mode

func _ready() -> void:
	set_physics_process(false)

func enter_state() -> void:
	set_physics_process(true)
	animator.play('idle')
	
func exit_state() -> void:
	set_physics_process(false)
	
func _physics_process(_delta):
	if player.movement_direction != Vector2.ZERO:
		move_mode.emit()
