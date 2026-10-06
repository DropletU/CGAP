extends PlayerState

func enter() -> void:
	player.velocity.y = 0.0
	

func exit() -> void:
	pass # Runs when exiting a state
	

func physics_update(delta) -> void:
	var speed_multi: = 1.0
	if Input.is_action_pressed("sprint"):
		speed_multi*=2
	movement_component.apply_horizontal_movement(player, delta, speed_multi, camera.global_rotation.y)
	
	if Input.is_action_just_pressed("jump"):
		movement_component.apply_jump(player)
	
	if not player.is_on_floor():
		transitioned.emit("Airborne")
	
