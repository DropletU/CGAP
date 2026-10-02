extends PlayerState

func enter() -> void:
	player.velocity.y = 0.0
	

func exit() -> void:
	pass # Runs when exiting a state
	

func physics_update(delta) -> void:
	var speed_multi: = 1.0
	if Input.is_action_pressed("sprint"):
		speed_multi*=2
	player.apply_horizontal_movement(delta, speed_multi)
	
	if Input.is_action_just_pressed("jump"):
		player.apply_jump()
	
	if not player.is_on_floor():
		transitioned.emit("Airborne")
	
