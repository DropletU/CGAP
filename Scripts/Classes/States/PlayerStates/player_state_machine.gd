class_name PlayerStateMachine extends Node

@export var initial_state: PlayerState
var current_state: PlayerState

func init(player: Player, movement_component: MovementComponent) -> void:
	for child in get_children():
		if child is PlayerState:
			child.player = player
			child.movement_component = movement_component
			child.transitioned.connect(transition_to)
	current_state = initial_state
	current_state.enter()
	

func physics_update(delta: float) -> void:
	current_state.physics_update(delta)
	

func transition_to(state_name: StringName):
	var new_state: = get_node_or_null(NodePath(state_name)) as PlayerState
	if new_state == null or new_state == current_state:
		return
	current_state.exit()
	current_state = new_state
	current_state.enter()
	
