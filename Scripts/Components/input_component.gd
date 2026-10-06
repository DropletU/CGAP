class_name InputComponent extends Node

enum States { GAMEPLAY, UI, DISABLED }
@export var state: States = States.GAMEPLAY
var inputs_allowed: Dictionary = {
	States.GAMEPLAY: [],
	States.UI: [],
	States.DISABLED: []
}

func _ready() -> void:
	pass
	# TODO: Make this method set values from the database to each array in
	# [member inputs_allowed]
	

func is_action_active(action: StringName) -> bool:
	if is_action_allowed(action):
		return Input.is_action_pressed(action)
	return false
	

func is_action_just_pressed(action: StringName) -> bool:
	if is_action_allowed(action):
		return Input.is_action_just_pressed(action)
	return false
	

func is_action_allowed(action: StringName) -> bool:
	for input: String in inputs_allowed[state]:
		if action.to_lower() == input.to_lower():
			return true
	return false
	
