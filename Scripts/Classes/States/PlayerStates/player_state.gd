class_name PlayerState extends Node

var player: Player
var input: InputComponent
var movement_component: MovementComponent
var camera: Node3D

@warning_ignore("unused_signal")
signal transitioned(state_name: StringName)

func enter() -> void: pass
func exit() -> void: pass
@warning_ignore("unused_parameter")
func physics_update(delta: float) -> void: pass
