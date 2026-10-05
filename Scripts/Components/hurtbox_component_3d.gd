class_name HurtboxComponent3D extends Area3D

signal hit_received(damage: int, attacker: Node3D)

@export_flags_3d_physics var hurtbox_layer: int = 0:
	set(l):
		collision_layer = l

func _ready() -> void:
	assert(get_children().any(func(c): return c is CollisionShape3D), str("HurtboxComponent3D: ", self.get_path(), " has no child of type CollisionShape3D."))
	collision_mask = 0
	

func hit(damage: int, attacker: Node3D = null):
	hit_received.emit(damage, attacker)
	

func disable():
	set_deferred("monitorable", false)
	

func enable():
	set_deferred("monitorable", true)
	
