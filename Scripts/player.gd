class_name Player extends Entity3D

@onready var state_machine: PlayerStateMachine = $PlayerStateMachine
@onready var camera = $CameraComponent/Camera3D
@onready var input = $InputComponent

func _ready() -> void:
	super._ready()
	state_machine.init(self, input, movement_component, camera)
	input.unhandled_input.connect(unhandled_input)
	
	
	# floor_snap_length was set to 0.21
	# In the future, you should update this into
	# a value that is more suited for the game.
	

func unhandled_input(event: InputEvent) -> void:
	state_machine.unhandled_input(event)
	

func _physics_process(delta: float) -> void:
	state_machine.physics_update(delta)
	move_and_slide()
