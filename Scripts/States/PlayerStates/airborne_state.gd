extends PlayerState

func enter() -> void:
	pass # Runs when entering a state
	

func exit() -> void:
	pass # Runs when exiting a state
	

func physics_update(delta) -> void:
	var speed_multi: = 1.0
	if Input.is_action_pressed("sprint"):
		speed_multi*=2
	player.apply_horizontal_movement(delta, speed_multi)
	
	player.apply_gravity(delta)
	
	if player.is_on_floor():
		transitioned.emit("Grounded")
	
