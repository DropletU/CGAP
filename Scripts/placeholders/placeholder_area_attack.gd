extends HitboxArea3D

@onready
var forward: Vector3 = -basis.z
var speed: float = 10.0

func _ready() -> void:
	position+=forward/2.0

func _physics_process(delta: float) -> void:
	position+=forward*delta * speed
