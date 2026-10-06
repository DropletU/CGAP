extends PlayerState

func enter() -> void:
	pass # Runs when entering a state
	

func exit() -> void:
	pass # Runs when exiting a state
	

func physics_update(delta) -> void:
	var speed_multi: = 1.0
	var input_dir: Vector2 = Input.get_vector("left", "right", "forward", "back")
	if input.is_action_active("sprint"):
		speed_multi*=2
	movement_component.apply_horizontal_movement(player, input_dir, delta, speed_multi, camera.global_rotation.y)
	
	movement_component.apply_gravity(player, delta)
	
	if player.is_on_floor():
		transitioned.emit("Grounded")
	
