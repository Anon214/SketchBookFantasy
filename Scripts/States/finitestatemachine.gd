class_name FiniteStateMachine
extends Node

@export var state: State

func _ready():
	change_state(state)
	
func change_state(new_state: State):
	# if State type, exit current state
	if state is State:
		state.exit_state()
		
	# enters and sets state
	new_state.enter_state()
	state = new_state
