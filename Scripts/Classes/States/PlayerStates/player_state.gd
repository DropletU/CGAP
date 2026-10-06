class_name PlayerState extends Node

@warning_ignore("unused_signal")
signal transitioned(state_name: StringName)

var player: Player
var movement_component: MovementComponent

func enter() -> void: pass
func exit() -> void: pass
@warning_ignore("unused_parameter")
func physics_update(delta: float) -> void: pass
