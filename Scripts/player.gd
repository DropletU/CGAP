class_name Player extends Entity3D


@export var speed = 600.0
@export var jump_velocity = 6.0

@onready var state_machine: PlayerStateMachine = $PlayerStateMachine
@onready var camera = $CameraComponent/Camera3D


func _ready() -> void:
	super._ready()
	state_machine.init(self)
	
	
	# floor_snap_length was set to 0.21
	# In the future, you should update this into
	# a value that is more suited for the game.
	

func _physics_process(delta: float) -> void:
	state_machine.physics_update(delta)
	move_and_slide()

func apply_horizontal_movement(delta: float, speed_multi):
	var input_dir := Input.get_vector("left", "right", "forward", "back")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	direction = direction.rotated(Vector3.UP, camera.global_rotation.y)
	if direction:
		velocity.x = direction.x * speed*delta * speed_multi
		velocity.z = direction.z * speed*delta * speed_multi
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)
	

func apply_gravity(delta: float):
	if not is_on_floor():
		velocity += get_gravity() * delta * 2
	

func apply_jump():
	velocity.y += jump_velocity
	
