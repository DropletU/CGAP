class_name HurtboxComponent3D extends Area3D

signal hit_received(damage: int, attacker: Node3D)

func _ready() -> void:
	assert(get_children().any(func(c): return c is CollisionShape3D), str("HurtboxComponent3D: ", self.get_path(), " has no child of type CollisionShape3D."))
	

func hit(damage: int, attacker: Node3D = null):
	hit_received.emit(damage, attacker)
	

func disable():
	set_deferred("monitorable", false)
	

func enable():
	set_deferred("monitorable", true)
	
