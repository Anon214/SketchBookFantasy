class_name Player
extends CharacterBody2D

@onready var fsm = $FiniteStateMachine as FiniteStateMachine
@onready var idle_state = $FiniteStateMachine/Idle as Idle
@onready var move_state = $FiniteStateMachine/Move as Move
@onready var animator : AnimationPlayer = $AnimationPlayer
@onready var sprite : Sprite2D = $Sprite2D
var movement_direction = Vector2.ZERO
var speed : float = 300

func _ready():
	move_state.idle_mode.connect(fsm.change_state.bind(idle_state))
	idle_state.move_mode.connect(fsm.change_state.bind(move_state))

func _physics_process(_delta):
	player_input()
	
func player_input():
	movement_direction = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		movement_direction.x += 1
	if Input.is_action_pressed("ui_left"):
		movement_direction.x -= 1
	if Input.is_action_pressed("ui_up"):
		movement_direction.y -= 1
	if Input.is_action_pressed("ui_down"):
		movement_direction.y += 1
	
