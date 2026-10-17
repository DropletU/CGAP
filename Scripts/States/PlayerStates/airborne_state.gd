extends PlayerState

func enter() -> void:
	pass # Runs when entering a state
	

func exit() -> void:
	pass # Runs when exiting a state
	



func physics_update(delta) -> void:
	var speed_multi: = 1.0
	var input_dir: Vector2 = Input.get_vector("left", "right", "forward", "back")
	var direction: Vector3 = (player.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	direction = direction.rotated(Vector3.UP, camera.global_rotation.y)
	if Input.is_action_pressed("sprint"):
		speed_multi*=2
	movement_component.apply_horizontal_movement(player, direction, delta, speed_multi)
	
	movement_component.apply_gravity(player, delta)
	
	if player.is_on_floor():
		transitioned.emit("Grounded")
	
