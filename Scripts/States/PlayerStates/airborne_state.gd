extends PlayerState

func enter() -> void:
	pass # Runs when entering a state
	

func exit() -> void:
	pass # Runs when exiting a state
	

func physics_update(delta) -> void:
	var speed_multi: = 1.0
	if Input.is_action_pressed("sprint"):
		speed_multi*=2
	movement_component.apply_horizontal_movement(player, delta, speed_multi, player.camera.global_rotation.y)
	
	movement_component.apply_gravity(player, delta)
	
	if player.is_on_floor():
		transitioned.emit("Grounded")
	
