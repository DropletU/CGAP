class_name Player extends CharacterBody3D


@export var speed = 10.0
@export var jump_velocity = 6.0
var speed_multi = 1.0

@onready var state_machine: PlayerStateMachine = $PlayerStateMachine

@onready var camera = $CameraComponent/Camera3D

func _ready() -> void:
	state_machine.init(self)

func _physics_process(delta: float) -> void:
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta * 2

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("left", "right", "forward", "back")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if Input.is_action_pressed("sprint"):
		speed_multi = 2.0
	else:
		speed_multi = 1.0
	
	direction = direction.rotated(Vector3.UP, camera.global_rotation.y)
	
	if direction:
		velocity.x = direction.x * speed*speed_multi
		velocity.z = direction.z * speed*speed_multi
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)

	move_and_slide()
