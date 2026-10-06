class_name Player extends Entity3D

@onready var state_machine: PlayerStateMachine = $PlayerStateMachine
@onready var camera = $CameraComponent/Camera3D


func _ready() -> void:
	super._ready()
	state_machine.init(self, movement_component, camera)
	
	
	# floor_snap_length was set to 0.21
	# In the future, you should update this into
	# a value that is more suited for the game.
	

func _physics_process(delta: float) -> void:
	state_machine.physics_update(delta)
	move_and_slide()
