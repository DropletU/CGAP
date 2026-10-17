extends PlayerState

var speed_multi: = 1.0


func enter() -> void:
	player.velocity.y = 0.0
	

func exit() -> void:
	pass # Runs when exiting a state
	

func unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("jump"):
		player.movement_component.apply_jump(player)
	

func physics_update(delta) -> void:
	var input_dir: Vector2 = Input.get_vector("left", "right", "forward", "back")
	var direction: Vector3 = (player.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	direction = direction.rotated(Vector3.UP, camera.global_rotation.y)
	if Input.is_action_pressed("sprint"):
		speed_multi = 2
	else:
		speed_multi = 1
	player.movement_component.apply_horizontal_movement(player, direction, delta, speed_multi)
	
	if not player.is_on_floor():
		transitioned.emit("Airborne")
	
