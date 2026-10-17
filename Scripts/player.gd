class_name Player extends Entity3D

@onready var state_machine: PlayerStateMachine = $PlayerStateMachine
@onready var camera = $CameraComponent/Camera3D

func _ready() -> void:
	super._ready()
	state_machine.init(self, movement_component, camera)
	
	# floor_snap_length was set to 0.21
	# In the future, you should update this into
	# a value that is more suited for the game.
	

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("test_key"):
		# Input that can be used to test anything before implementing it
		# into the state machine
		var test_attack: PackedScene = load("res://Scenes/placeholders/placeholder_area_attack_3d.tscn")
		var instance = test_attack.instantiate()
		instance.rotation = camera.global_rotation
		instance.position = camera.global_position
		get_tree().current_scene.add_child(instance)
		return
	state_machine.unhandled_input(event)
	

func _physics_process(delta: float) -> void:
	state_machine.physics_update(delta)
	move_and_slide()
