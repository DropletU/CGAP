extends PlayerState

func enter() -> void:
	player.velocity.y = 0.0
	

func exit() -> void:
	pass # Runs when exiting a state
	

func physics_update(delta) -> void:
	var speed_multi: = 1.0
	var input_dir: Vector2 = input.get_vector("left", "right", "forward", "back")
	var direction: Vector3 = (player.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	direction = direction.rotated(Vector3.UP, camera.global_rotation.y)
	if input.is_action_active("sprint"):
		speed_multi*=2
	movement_component.apply_horizontal_movement(player, direction, delta, speed_multi)
	
	
	if input.is_action_just_pressed("jump"):
		movement_component.apply_jump(player)
	
	if not player.is_on_floor():
		transitioned.emit("Airborne")
	
